import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vncovi/modules/home_test/blocs/state_of_listview.dart';
import 'package:vncovi/modules/home_test/widgets/empty.dart';
import 'package:vncovi/modules/home_test/widgets/error.dart';

import 'monitor_covid.dart';

class ListCovidCountriesExpansionTile extends StatefulWidget {
  const ListCovidCountriesExpansionTile({Key? key}) : super(key: key);

  @override
  State<ListCovidCountriesExpansionTile> createState() =>
      _ListCovidCountriesExpansionTileState();
}

class _ListCovidCountriesExpansionTileState
    extends State<ListCovidCountriesExpansionTile> {
  late StateOfListView _state;

  @override
  void initState() {
    _state = StateOfListView();
    super.initState();
    _state.getCovidCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<StateOfListView>(
        create: (_) => _state,
        child: Consumer<StateOfListView>(
          builder: (context, model, child) {
            return model.loading
                ? const Center(
                    child: Text(
                      'Loading',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: model.getCovidCountry,
                    child: model.error
                        ? Error()
                        : model.countriesCovid!.isEmpty
                            ? Empty()
                            : ListView.builder(
                                itemCount: model.countriesCovid!.length,
                                itemBuilder: (context, index) {
                                  print(model.countriesCovid![index].cases!);
                                  return ExpansionTile(
                                    title: Text(
                                      '${model.countriesCovid![index].country}',
                                    ),
                                    children: [
                                      MonitorCovid(
                                        cases: model.countriesCovid![index].cases,
                                        active: model.countriesCovid![index].active,
                                        recovered:
                                        model.countriesCovid![index].recovered,
                                        deaths: model.countriesCovid![index].deaths,
                                      )
                                    ],
                                  );
                                },
                              ),
                  );
          },
        ),
      ),
    );
  }
}
