import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/identifier_model.dart';

class JobCandidate extends IdentifierModel {
  final String name, subTitle, city, image;
  final double rating;

  JobCandidate(
    super.id,
    this.name,
    this.subTitle,
    this.rating,
    this.city,
    this.image,
  );

  static JobCandidate fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String subTitle = decoder.getString('subtitle');
    double rating = decoder.getDouble('rating');
    String city = decoder.getString('city');
    String image = Images.randomImage(Images.avatars);

    return JobCandidate(decoder.getId, name, subTitle, rating, city, image);
  }

  static List<JobCandidate> listFromJSON(List<dynamic> list) {
    return list.map((e) => JobCandidate.fromJSON(e)).toList();
  }

  static List<JobCandidate>? _dummyList;

  static Future<List<JobCandidate>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 20);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/job_candidate.json');
  }
}
