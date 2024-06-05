import 'package:flutter/material.dart';
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
              const SizedBox(
                height: 10,
              ),
              PieChart(
                  chartType: ChartType.ring,
                  chartRadius: MediaQuery.of(context).size.width / 3.2,
                  legendOptions:
                      const LegendOptions(legendPosition: LegendPosition.left),
                  colorList: colorList,
                  dataMap: {"Total": 20, "Recover": 15, "Death": 5}),
              const SizedBox(
                height: 30,
              ),
              const Card(
                child: Column(
                  children: [
                    ReusableRow(title: "Total", value: "20"),
                    ReusableRow(title: "Total", value: "20"),
                    ReusableRow(title: "Total", value: "20")
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:     const Color(0xff1aa260),

                ),
                  onPressed: () {}, child: const Text('Track Countries'))
            ],
          ),
        ),
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
