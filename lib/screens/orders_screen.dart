import 'package:flutter/material.dart';
import 'order_details_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int selectedTab = 0;
  String searchText = '';

  final List<String> tabs = [
    "الكل",
    "جديدة",
    "في الطريق",
    "تم التوصيل",
  ];

  final List<Map<String, dynamic>> orders = [
    {
      "id": "#ORD-0015",
      "address": "جازان - مخطط 6",
      "time": "10:30 ص",
      "price": "25 ر.س",
      "status": "جديدة",
      "statusColor": const Color(0xff4CAF50),
    },
    {
      "id": "#ORD-0316",
      "address": "جازان - السويس",
      "time": "11:45 ص",
      "price": "250 ر.س",
      "status": "في الطريق",
      "statusColor": const Color(0xffFF9800),
    },
    {
      "id": "#ORD-0977",
      "address": "جازان - حي الصفا",
      "time": "8:00 ص",
      "price": "50 ر.س",
      "status": "تم التوصيل",
      "statusColor": const Color(0xff219653),
    },
    {
      "id": "#ORD-0987",
      "address": "صبيا - شارع أحمد",
      "time": "2:00 م",
      "price": "150 ر.س",
      "status": "في الطريق",
      "statusColor": const Color(0xffFF9800),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredOrders = orders.where((order) {
      final matchTab = selectedTab == 0
          ? true
          : order["status"] == tabs[selectedTab];

      final matchSearch = order["id"]
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase());

      return matchTab && matchSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        elevation: 0,
        centerTitle: true,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        title: const Text(
          "الطلبات",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: OrderSearchDelegate(
                  onSearch: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),

          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                final selected = selectedTab == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xff0E4595)
                          : Colors.white,

                      borderRadius: BorderRadius.circular(12),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),

                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15),

              itemCount: filteredOrders.length,

              itemBuilder: (context, index) {
                final order = filteredOrders[index];

                return orderCard(
                  context,
                  id: order["id"],
                  address: order["address"],
                  time: order["time"],
                  price: order["price"],
                  status: order["status"],
                  statusColor: order["statusColor"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget orderCard(
    BuildContext context, {
    required String id,
    required String address,
    required String time,
    required String price,
    required String status,
    required Color statusColor,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderDetailsScreen(
              orderId: id,
              address: address,
              time: time,
              price: price,
              status: status,
            ),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,

              decoration: BoxDecoration(
                color: const Color(0xff0E4595)
                    .withOpacity(0.1),

                borderRadius: BorderRadius.circular(12),
              ),

              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Color(0xff0E4595),
              ),
            ),

            const Spacer(),

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end,

              children: [
                Text(
                  id,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  address,
                  style: const TextStyle(
                    color: Color(0xff0E4595),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 15),

            Container(
              width: 55,
              height: 55,

              decoration: BoxDecoration(
                color: const Color(0xff0E4595)
                    .withOpacity(0.1),

                borderRadius: BorderRadius.circular(15),
              ),

              child: const Icon(
                Icons.location_on_outlined,
                color: Color(0xff0E4595),
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      class OrderSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;

  OrderSearchDelegate({
    required this.onSearch,
  });

  @override
  String get searchFieldLabel => "ابحث برقم الطلب";

  @override
  TextStyle? get searchFieldStyle {
    return const TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          onSearch('');
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff0E4595),
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.white70,
        ),
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            titleLarge: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    close(context, null);
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        query.isEmpty
            ? "اكتب رقم الطلب مثل: ORD-0015"
            : "اضغط بحث لإظهار النتائج",
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}