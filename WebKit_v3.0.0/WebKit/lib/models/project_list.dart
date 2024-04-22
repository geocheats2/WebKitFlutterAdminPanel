import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/models/identifier_model.dart';

class ProjectList extends IdentifierModel {
  final String appName;
  final int tasks, comments;
  final double taskComplete;

  ProjectList(
      super.id, this.appName, this.tasks, this.comments, this.taskComplete);

  static ProjectList fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String appName = decoder.getString('appName');
    int tasks = decoder.getInt('tasks');
    int comments = decoder.getInt('comments');
    double taskComplete = decoder.getDouble('taskComplete');

    return ProjectList(
      decoder.getId,
      appName,
      tasks,
      comments,
      taskComplete,
    );
  }

  static List<ProjectList> listFromJSON(List<dynamic> list) {
    return list.map((e) => ProjectList.fromJSON(e)).toList();
  }

  static List<ProjectList>? _dummyList;

  static Future<List<ProjectList>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 7);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/project_list.json');
  }
}
