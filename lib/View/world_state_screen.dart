import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lr_api_test/View/countries_list_screen.dart';
import 'package:lr_api_test/model/world_state_model.dart';
import 'package:lr_api_test/services/state_services.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({super.key});

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();
  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                FutureBuilder(
                  future: StateServices().getAllData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<WorldState> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                          child: SpinKitFadingCircle(
                        color: Colors.white,
                        controller: controller,
                      ));
                    } else {
                      final data = snapshot.data;
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          PieChart(
                              chartType: ChartType.ring,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3.2,
                              legendOptions: const LegendOptions(
                                  legendPosition: LegendPosition.left),
                              colorList: colorList,
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true
                              ),
                              dataMap: {
                                "Total":
                            double.tryParse(data!.cases!.toString())!,
                                "Recover": double.tryParse(data!.recovered!.toString())!,
                                "Death": double.tryParse(data!.deaths!.toString())!
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                           Card(
                            child: Column(
                              children: [
                                ReusableRow(title: "Total", value: data.cases.toString()),
                                ReusableRow(title: "Recover", value: data.recovered.toString()),
                                ReusableRow(title: "Death", value: data.deaths.toString())
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff1aa260),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>CountriesListScreen()));
                              },
                              child: const Text('Track Countries'))
                        ],
                      );
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title),
            Text(value),
          ]),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ]));
  }
}
