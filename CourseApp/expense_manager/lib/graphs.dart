import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class Graphs extends StatefulWidget {
  const Graphs({super.key});

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  final Map<String, double> dataMap = {
    "Food": 650,
    "Fuel": 600,
    "Medicine": 500,
    "Entertainment": 475,
    "Shopping": 325,
  };
  final List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.pink,
  ];

  List<Map<dynamic, String>> categories = [
    {"image": "assets/food.png", "name": "Food", "price": "450"},
    {"image": "assets/fuel.png", "name": "Fuel", "price": "450"},
    {"image": "assets/medicine.png", "name": "Medicine", "price": "450"},
    {"image": "assets/shopping.png", "name": "Shopping", "price": "450"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graphs",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 1000),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 2.5,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              legendOptions: const LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 0,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 0.7),
          ListView.builder(
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            categories[index]["image"]!,
                            scale: 1.4,
                          ),
                        ),
                        Text(
                          categories[index]["name"]!,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        Text(
                          "₹ ${categories[index]["price"]!}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Total:",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "₹5454654",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
