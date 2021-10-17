import 'dart:developer';

import 'package:appgain_task/data/person_images_response.dart';
import 'package:appgain_task/data/popular_people_response.dart';
import 'package:appgain_task/repos/peoples_repo.dart';
import 'package:flutter/material.dart';

class PopularPeopleProvider extends ChangeNotifier {
  Future<PopularPeopleResponse> getPopularPeople() async {
    return await PeopleRepository.getPopularPeople();
  }

  Future<PersonImagesResponse> getPersonImages({String personId}) async {
    return await PeopleRepository.getPersonImages(personId: personId);
  }
}
