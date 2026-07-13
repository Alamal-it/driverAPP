import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;

import 'verify_screen.dart';
import 'delivery_failed_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  BitmapDescriptor? carIcon;

  StreamSubscription<Position>? positionStream;

  final String apiKey =
      "AIzaSyB-w-tax79hp6AJ7OvWw2bSFmldyboIXoM";

  LatLng currentLocation = const LatLng(
    24.7136,
    46.6753,
  );

  final LatLng customerLocation = const LatLng(
    24.7165,
    46.6830,
  );

  Set<Marker> markers = {};

  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();

    loadCarIcon();

    getCurrentLocation();
  }

  Future<void> loadCarIcon() async {
    carIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(38, 38),
      ),
      "assets/images/car.png",
    );
  }

  void showDeliveryDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Center(
            child: Text(
              "تأكيد حالة الطلب",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: const Text(
            "هل تم تسليم الطلب؟",
            textAlign: TextAlign.center,
          ),
          actions: [

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VerifyScreen(),
                    ),
                  );
                },
                child: const Text(
                  "تم التسليم",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DeliveryFailedScreen(),
                    ),
                  );
                },
                child: const Text(
                  "تعذر التسليم",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  Future<void> getCurrentLocation() async {
  bool serviceEnabled =
      await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) return;

  LocationPermission permission =
      await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    return;
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.best,
  );

  currentLocation = LatLng(
    position.latitude,
    position.longitude,
  );

  await getRoute();

  startTracking();
}

Future<void> getRoute() async {
  final url =
      "https://maps.googleapis.com/maps/api/directions/json"
      "?origin=${currentLocation.latitude},${currentLocation.longitude}"
      "&destination=${customerLocation.latitude},${customerLocation.longitude}"
      "&mode=driving"
      "&key=$apiKey";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode != 200) return;

  final data = jsonDecode(response.body);

  if (data["routes"] == null || data["routes"].isEmpty) {
    return;
  }

  final encoded =
      data["routes"][0]["overview_polyline"]["points"];

  PolylinePoints polylinePoints = PolylinePoints();

  List<PointLatLng> result =
      polylinePoints.decodePolyline(encoded);

  List<LatLng> routePoints = result
      .map(
        (e) => LatLng(
          e.latitude,
          e.longitude,
        ),
      )
      .toList();

  polylines.clear();

  polylines.add(
    Polyline(
      polylineId: const PolylineId("route"),
      points: routePoints,
      color: const Color(0xff1565FF),
      width: 8,
    ),
  );

  markers.removeWhere(
    (m) => m.markerId.value == "customer",
  );

  markers.add(
    Marker(
      markerId: const MarkerId("customer"),
      position: customerLocation,
      infoWindow: const InfoWindow(
        title: "موقع العميل",
      ),
    ),
  );

  setState(() {});
}

void startTracking() {
  positionStream = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 3,
    ),
  ).listen((Position position) async {
    currentLocation = LatLng(
      position.latitude,
      position.longitude,
    );

    await getRoute();

    markers.removeWhere(
      (m) => m.markerId.value == "driver",
    );

    markers.add(
      Marker(
        markerId: const MarkerId("driver"),
        position: currentLocation,
        icon: carIcon ?? BitmapDescriptor.defaultMarker,
        rotation: position.heading,
        flat: true,
        anchor: const Offset(0.5, 0.5),
      ),
    );

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: currentLocation,
          zoom: 18,
          bearing: position.heading,
          tilt: 60,
        ),
      ),
    );

    setState(() {});
  });
}

@override
void dispose() {
  positionStream?.cancel();
  super.dispose();
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xff0E4595),
      centerTitle: true,
      title: const Text(
        "الملاحة",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    body: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: currentLocation,
        zoom: 17,
      ),

      onMapCreated: (controller) async {
        mapController = controller;

        try {
          String style = await rootBundle.loadString(
            "assets/images/map_style.json",
          );

          await controller.setMapStyle(style);
        } catch (_) {}
      },

      markers: markers,
      polylines: polylines,

      myLocationEnabled: true,
      myLocationButtonEnabled: false,

      zoomControlsEnabled: false,
      compassEnabled: false,
      trafficEnabled: true,
      buildingsEnabled: true,
      mapToolbarEnabled: false,
      indoorViewEnabled: false,
    ),

    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.my_location,
        color: Color(0xff0E4595),
      ),
      onPressed: () {
        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: currentLocation,
              zoom: 18,
              tilt: 60,
            ),
          ),
        );
      },
    ),

    bottomNavigationBar: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 55,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0E4595),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: showDeliveryDialog,
            child: const Text(
              "وصلت للعميل",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}