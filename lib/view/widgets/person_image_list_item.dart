import 'package:appgain_task/utils/Constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class PersonImageListItem extends StatelessWidget {
  String profilePath;
  PersonImageListItem({this.profilePath});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: Constants.IMG_BASE_URL + profilePath,
      fit: BoxFit.fill,
      placeholder: (context, url) => Container(
          width: 20,
          height: 20,
          child: Center(child: CircularProgressIndicator())),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
