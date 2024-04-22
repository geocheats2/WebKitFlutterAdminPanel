import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/identifier_model.dart';

class JobVacancee extends IdentifierModel {
  final String jobName, city, image;
  final int price;

  JobVacancee(
    super.id,
    this.jobName,
    this.city,
    this.image,
    this.price,
  );

  static JobVacancee fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String jobName = decoder.getString('job_name');
    String city = decoder.getString('city');
    String image = Images.randomImage(Images.avatars);
    int price = decoder.getInt('price');

    return JobVacancee(
      decoder.getId,
      jobName,
      city,
      image,
      price,
    );
  }

  static List<JobVacancee> listFromJSON(List<dynamic> list) {
    return list.map((e) => JobVacancee.fromJSON(e)).toList();
  }

  static List<JobVacancee>? _dummyList;

  static Future<List<JobVacancee>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/job_vacancee.json');
  }
}
