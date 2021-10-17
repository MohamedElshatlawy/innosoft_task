import 'package:appgain_task/data/person_images_response.dart';
import 'package:appgain_task/data/popular_people_response.dart';
import 'package:appgain_task/providers/popular_people_viewModel.dart';
import 'package:appgain_task/view/widgets/person_image_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';

class PopularPeopleDetails extends StatelessWidget {
  PeopleModel model;
  PopularPeopleDetails({this.model});
  @override
  Widget build(BuildContext context) {
    var popularPeopleViewModel = Provider.of<PopularPeopleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Name')),
                Expanded(child: Text(model.name))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Gender')),
                Expanded(child: Text(model.gender == 1 ? "Female" : "Male"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Department')),
                Expanded(child: Text(model.knownForDepartment))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Movies')),
                Expanded(
                    child: Text(
                        model.knownFor.map((e) => e.originalTitle).join(" , ")))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<PersonImagesResponse>(
                initialData: PersonImagesResponse(profiles: []),
                future: popularPeopleViewModel.getPersonImages(
                    personId: model.id.toString()),
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
                        return GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          childAspectRatio:
                              ScreenUtil.defaultSize.aspectRatio / .9,
                          children: [
                            ...snapshot.data.profiles
                                .map((e) => PersonImageListItem(
                                      profilePath: e.filePath,
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
          ],
        ),
      ),
    );
  }
}
