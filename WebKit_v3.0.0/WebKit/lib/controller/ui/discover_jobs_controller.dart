import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_text_utils.dart';
import 'package:webkit/models/discover.dart';

class SeniorityLevel {
  String name;
  bool isChecked;

  SeniorityLevel(this.name, {this.isChecked = false});
}

class JobType {
  String name;
  bool isChecked;

  JobType(this.name, {this.isChecked = false});
}

class WorkStyle {
  String name;
  bool isChecked;

  WorkStyle(this.name, {this.isChecked = false});
}

class DiscoverJobsController extends MyController {
  List<Discover> discover = [];

  bool showLike = false;
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  final List<JobType> jobType = [
    JobType('Full Time Jobs'),
    JobType('Part Time Jobs'),
    JobType('Remote Jobs'),
    JobType('InternShip Jobs'),
    JobType('Contract Jobs'),
    JobType('Training Jobs'),
  ];
  final List<SeniorityLevel> seniorityLevel = [
    SeniorityLevel('Student Level'),
    SeniorityLevel('Entry Level'),
    SeniorityLevel('Mid Level'),
    SeniorityLevel('Senior Level'),
    SeniorityLevel('Directors'),
    SeniorityLevel('VP or Above'),
  ];

  @override
  void onInit() {
    super.onInit();
    Discover.dummyList.then((value) {
      discover = value.sublist(0, 10);
    });
  }

  void onChangeLike() {
    showLike = !showLike;
    update();
  }
}
