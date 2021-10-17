import 'dart:convert';
import 'dart:developer';

import 'package:appgain_task/data/person_images_response.dart';
import 'package:appgain_task/data/popular_people_response.dart';
import 'package:appgain_task/network/networkCallback/NetworkCallback.dart';
import 'package:appgain_task/utils/Constants.dart';
import 'package:appgain_task/utils/Enums.dart';

class PeopleRepository {
  static Future<PopularPeopleResponse> getPopularPeople() async {
    return PopularPeopleResponse.fromJson(await NetworkCall.makeCall(
        endPoint: "3/person/popular",
        method: HttpMethod.GET,
        queryParams: {"api_key": Constants.token}));
  }

  static Future<PersonImagesResponse> getPersonImages({String personId}) async {
    return PersonImagesResponse.fromJson(await NetworkCall.makeCall(
        endPoint: "3/person/$personId/images",
        method: HttpMethod.GET,
        queryParams: {"api_key": Constants.token}));
  }
  // static Future<MovieDetailsResponse> getMovieDetails(String movieId) async {
  //   return MovieDetailsResponse.fromJson(await NetworkCall.makeCall(
  //       endPoint: "3/movie/$movieId",
  //       method: HttpMethod.GET,
  //       queryParams: {"api_key": Constants.token}));
  // }
}
