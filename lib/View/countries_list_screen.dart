import 'package:flutter/material.dart';
import 'package:lr_api_test/model/countries_state_model.dart';
import 'package:lr_api_test/services/state_services.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries State'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              onChanged: (v){
                setState(() {
                  
                });
              },
              controller: controller,
              decoration: InputDecoration(
                hintText: "Search your country",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder(
              future: StateServices().getCountriesData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CountriesState>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: ListTile(
                          title: Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 4.0),
                          ),
                          leading: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 4.0),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text("No data available"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data![index];
                      String name = data.country.toString();

                      if (name.isEmpty) {
                        return ListTile(
                          title: Text(data.country ?? 'Unknown Country'),
                          subtitle: Text(
                              "Cases: ${data.cases?.toString() ?? 'Unknown'}"),
                          leading: data.countryInfo?.flag != null
                              ? Image.network(
                                  data.countryInfo!.flag!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.grey,
                                ),
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(controller.text.toLowerCase())) {
                        return ListTile(
                          title: Text(data.country ?? 'Unknown Country'),
                          subtitle: Text(
                              "Cases: ${data.cases?.toString() ?? 'Unknown'}"),
                          leading: data.countryInfo?.flag != null
                              ? Image.network(
                                  data.countryInfo!.flag!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.grey,
                                ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
