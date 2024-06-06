import 'package:flutter/material.dart';
import 'package:lr_api_test/View/world_state_screen.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String name;
  final int totalcases, totalDeaths, totalRecovered, active, critical, test;
  const DetailsScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.totalcases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.test});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      ReusableRow(title: "Name", value: name),
                      ReusableRow(title: "Cases", value: totalcases.toString()),
                      ReusableRow(
                          title: "TotalDeaths", value: totalDeaths.toString()),
                      ReusableRow(
                          title: "TotalRecovered",
                          value: totalRecovered.toString()),
                      ReusableRow(title: "Active", value: active.toString()),
                      ReusableRow(
                          title: "Critical", value: critical.toString()),
                      ReusableRow(title: "Test", value: test.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(image),
              )
            ],
          ),
        ],
      ),
    );
  }
}
