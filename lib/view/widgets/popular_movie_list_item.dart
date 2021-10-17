import 'package:appgain_task/data/popular_people_response.dart';
import 'package:appgain_task/network/ServicesURLs.dart';
import 'package:appgain_task/utils/Constants.dart';
import 'package:appgain_task/view/popular_people_details.dart';
import 'package:flutter/material.dart';

class PopularPeppleListItem extends StatelessWidget {
  PeopleModel peopleModel;
  PopularPeppleListItem({this.peopleModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => PopularPeopleDetails(
                        model: peopleModel,
                      )));
        },
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(
              Constants.IMG_BASE_URL + peopleModel.profilePath,
              scale: 2),
        ),
        title: Text(peopleModel.name),
        subtitle: Text(peopleModel.gender == 1
            ? "Female"
            : "Male" + "/" + peopleModel.knownForDepartment),
      ),
    );
  }
}
