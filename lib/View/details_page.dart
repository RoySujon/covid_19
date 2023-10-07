import 'package:flutter/material.dart';

import '../data/utils/utils.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {super.key,
      required this.country,
      required this.todayCases,
      required this.flag,
      required this.critical,
      required this.deaths,
      required this.recovered,
      required this.cases,
      required this.population});
  final String country,
      todayCases,
      flag,
      critical,
      deaths,
      recovered,
      cases,
      population;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        ReusableRow(title: 'Population', value: population),
                        ReusableRow(title: 'Case', value: cases),
                        // ReusableRow(title: 'Critical', value: critical),
                        ReusableRow(title: 'Deaths', value: deaths),
                        ReusableRow(title: 'Recovered', value: recovered),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  child: CircleAvatar(
                    radius: 50,
                    // radius: ,
                    backgroundImage: NetworkImage(flag),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
