import 'package:appgain_task/data/popular_people_response.dart';
import 'package:appgain_task/providers/popular_people_viewModel.dart';
import 'package:appgain_task/repos/peoples_repo.dart';
import 'package:appgain_task/view/widgets/popular_movie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var popularPeopleViewModel = Provider.of<PopularPeopleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular People'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: FutureBuilder<PopularPeopleResponse>(
          initialData: PopularPeopleResponse(results: []),
          future: popularPeopleViewModel.getPopularPeople(),
          builder: (ctx, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Center(
                    child: Text('No internet connection'),
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Center(
                    child: Text("Error:${snapshot.error.toString()}"),
                  );

                if (snapshot.data != null)
                  return ListView(
                    children: [
                      ...List.generate(
                          snapshot.data.results.length,
                          (index) => PopularPeppleListItem(
                                peopleModel: snapshot.data.results[index],
                              ))
                    ],
                  );
                return Container();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
