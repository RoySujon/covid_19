import 'package:covid_19/View/country_list.dart';
import 'package:covid_19/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 5))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  StateServices _stateServices = StateServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return Column(
                  children: [
                    Text(data!.active.toString()),
                    PieChart(
                        animationDuration: Duration(seconds: 2),
                        chartType: ChartType.ring,
                        chartRadius: 150,
                        chartLegendSpacing: 20,
                        chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        legendOptions:
                            LegendOptions(legendPosition: LegendPosition.right),
                        dataMap: {
                          'Total': double.parse(data.cases.toString()),
                          'Recovered': double.parse(data.recovered.toString()),
                          'Deads': double.parse(data.deaths.toString()),
                        }),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * .06),
                      child: Card(
                        child: Column(
                          children: [
                            ReusableRow(
                                title: 'Total', value: data.cases.toString()),
                            ReusableRow(
                                title: 'Deaths', value: data.deaths.toString()),
                            ReusableRow(
                                title: 'Recoverd',
                                value: data.recovered.toString()),
                            ReusableRow(
                                title: 'Active', value: data.active.toString()),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CountryListScreen(),
                            ));
                      },
                      child: Container(
                        height: 60,
                        child: Center(child: Text('Track Country')),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: _stateServices.fetchWorldStatesData(),
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  const ReusableRow({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
        ),
        Divider(),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
