import 'package:covid_19/View/details_page.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../services/states_services.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  final _searchController = TextEditingController();
  StateServices _stateServices = StateServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) => setState(() {}),
              controller: _searchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: 'Serach by country Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _stateServices.fetchCountryListData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      String name = data[index].country.toString();
                      if (_searchController.text.isEmpty) {
                        return ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  country: data[index].country.toString(),
                                  population: data[index].population.toString(),
                                  todayCases: data[index].todayCases.toString(),
                                  flag: data[index].countryInfo.flag.toString(),
                                  critical: data[index].critical.toString(),
                                  recovered: data[index].recovered.toString(),
                                  deaths: data[index].deaths.toString(),
                                  cases: data[index].cases.toString(),
                                ),
                              )),
                          title: Text(data[index].country.toString()),
                          leading: Image.network(
                            data[index].countryInfo!.flag.toString(),
                            // height: 60,
                            width: 50,

                            fit: BoxFit.cover,
                          ),
                          subtitle: Text(data[index].cases.toString()),
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase())) {
                        return ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  country: data[index].country.toString(),
                                  population: data[index].population.toString(),
                                  todayCases: data[index].todayCases.toString(),
                                  flag: data[index].countryInfo.flag.toString(),
                                  critical: data[index].critical.toString(),
                                  recovered: data[index].recovered.toString(),
                                  deaths: data[index].deaths.toString(),
                                  cases: data[index].cases.toString(),
                                ),
                              )),
                          title: Text(data[index].country.toString()),
                          leading: Image.network(
                            data[index].countryInfo.flag.toString(),
                            // height: 60,
                            width: 50,

                            fit: BoxFit.cover,
                          ),
                          subtitle: Text(data[index].cases.toString()),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                    itemCount: data!.length,
                  );
                } else {
                  return Shimmer.fromColors(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Container(
                              height: 10,
                              width: double.infinity,
                              color: Colors.white),
                          leading: Container(
                              height: 50, width: 50, color: Colors.white),
                          subtitle: Container(
                              height: 10,
                              width: double.infinity,
                              color: Colors.white),
                        ),
                        itemCount: 10,
                      ),
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
