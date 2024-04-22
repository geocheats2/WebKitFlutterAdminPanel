import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:webkit/controller/my_controller.dart';

class Model {
  Model(this.state, this.dataLabel);

  String state;
  String dataLabel;
}

class CountryTimeInGMT {
  CountryTimeInGMT(this.countryName, this.gmtTime);

  final String countryName;
  final String gmtTime;
}

class CountryDensity {
  CountryDensity(this.countryName, this.density);

  final String countryName;
  final double density;
}

class TimeDetails {
  TimeDetails(this.countryName, this.latitude, this.longitude, this.date);

  final String countryName;
  final double latitude;
  final double longitude;
  final DateTime date;
}

class SfMapController extends MyController {
  late List<Model> data;
  late MapShapeSource dataSource;
  late MapShapeSource source;
  late List<CountryTimeInGMT> timeZones;
  late MapShapeSource mapSource;
  late List<CountryDensity> worldPopulationDensity;

  final NumberFormat numberFormat = NumberFormat('#.#');
  late MapShapeSource mapSource1;
  late List<TimeDetails> worldClockData;
  late MapShapeSource mapSource2;

  @override
  void onInit() {
    data = <Model>[
      Model('New South Wales', 'New South Wales'),
      Model('Queensland', 'Queensland'),
      Model('Northern Territory', 'Northern sTerritory'),
      Model('Victoria', 'Victoria'),
      Model('South Australia', 'South Australia'),
      Model('Western Australia', 'Western Australia'),
      Model('Tasmania', 'Tasmania'),
    ];

    dataSource = MapShapeSource.asset(
      'assets/datas/australia.json',
      shapeDataField: 'STATE_NAME',
      dataCount: data.length,
      primaryValueMapper: (int index) => data[index].state,
      dataLabelMapper: (int index) => data[index].dataLabel,
    );
    source = const MapShapeSource.network(
      'http://www.json-generator.com/api/json/get/bVqXoJvfjC?indent=2',
      shapeDataField: 'name',
    );

    timeZones = <CountryTimeInGMT>[
      CountryTimeInGMT('Albania', 'GMT+2'),
      CountryTimeInGMT('Aland', 'GMT+3'),
      CountryTimeInGMT('Andorra', 'GMT+1'),
      CountryTimeInGMT('Austria', 'GMT+2'),
      CountryTimeInGMT('Belgium', 'GMT+2'),
      CountryTimeInGMT('Bulgaria', 'GMT+3'),
      CountryTimeInGMT('Bosnia and Herz.', 'GMT+2'),
      CountryTimeInGMT('Belarus', 'GMT+3'),
      CountryTimeInGMT('Switzerland', 'GMT+2'),
      CountryTimeInGMT('Czech Rep.', 'GMT+2'),
      CountryTimeInGMT('Germany', 'GMT+2'),
      CountryTimeInGMT('Denmark', 'GMT+2'),
      CountryTimeInGMT('Spain', 'GMT+2'),
      CountryTimeInGMT('Estonia', 'GMT+3'),
      CountryTimeInGMT('Finland', 'GMT+3'),
      CountryTimeInGMT('France', 'GMT+2'),
      CountryTimeInGMT('Faeroe Is.', 'GMT+1'),
      CountryTimeInGMT('United Kingdom', 'GMT+1'),
      CountryTimeInGMT('Guernsey', 'GMT+1'),
      CountryTimeInGMT('Greece', 'GMT+3'),
      CountryTimeInGMT('Croatia', 'GMT+2'),
      CountryTimeInGMT('Hungary', 'GMT+2'),
      CountryTimeInGMT('Isle of Man', 'GMT+1'),
      CountryTimeInGMT('Ireland', 'GMT+1'),
      CountryTimeInGMT('Iceland', 'GMT+0'),
      CountryTimeInGMT('Italy', 'GMT+2'),
      CountryTimeInGMT('Jersey', 'GMT+1'),
      CountryTimeInGMT('Kosovo', 'GMT+2'),
      CountryTimeInGMT('Liechtenstein', 'GMT+2'),
      CountryTimeInGMT('Lithuania', 'GMT+3'),
      CountryTimeInGMT('Luxembourg', 'GMT+2'),
      CountryTimeInGMT('Latvia', 'GMT+3'),
      CountryTimeInGMT('Monaco', 'GMT+2'),
      CountryTimeInGMT('Moldova', 'GMT+3'),
      CountryTimeInGMT('Macedonia', 'GMT+2'),
      CountryTimeInGMT('Malta', 'GMT+2'),
      CountryTimeInGMT('Montenegro', 'GMT+2'),
      CountryTimeInGMT('Netherlands', 'GMT+2'),
      CountryTimeInGMT('Norway', 'GMT+2'),
      CountryTimeInGMT('Poland', 'GMT+2'),
      CountryTimeInGMT('Portugal', 'GMT+1'),
      CountryTimeInGMT('Romania', 'GMT+3'),
      CountryTimeInGMT('San Marino', 'GMT+2'),
      CountryTimeInGMT('Serbia', 'GMT+2'),
      CountryTimeInGMT('Slovakia', 'GMT+2'),
      CountryTimeInGMT('Slovenia', 'GMT+2'),
      CountryTimeInGMT('Sweden', 'GMT+2'),
      CountryTimeInGMT('Ukraine', 'GMT+3'),
      CountryTimeInGMT('Vatican', 'GMT+1'),
    ];
    mapSource = MapShapeSource.asset(
      'assets/datas/europe_map.json',
      shapeDataField: 'name',
      dataCount: timeZones.length,
      primaryValueMapper: (int index) => timeZones[index].countryName,
      shapeColorValueMapper: (int index) => timeZones[index].gmtTime,
      shapeColorMappers: <MapColorMapper>[
        const MapColorMapper(
            value: 'GMT+0', color: Colors.lightBlue, text: 'GMT+0'),
        const MapColorMapper(
            value: 'GMT+1', color: Colors.orangeAccent, text: 'GMT+1'),
        const MapColorMapper(
            value: 'GMT+2', color: Colors.lightGreen, text: 'GMT+2'),
        const MapColorMapper(
            value: 'GMT+3', color: Colors.purple, text: 'GMT+3'),
      ],
    );

    worldPopulationDensity = <CountryDensity>[
      CountryDensity('Monaco', 26337),
      CountryDensity('Macao', 21717),
      CountryDensity('Singapore', 8358),
      CountryDensity('Hong kong', 7140),
      CountryDensity('Gibraltar', 3369),
      CountryDensity('Bahrain', 2239),
      CountryDensity('Holy See', 1820),
      CountryDensity('Maldives', 1802),
      CountryDensity('Malta', 1380),
      CountryDensity('Bangladesh', 1265),
      CountryDensity('Sint Maarten', 1261),
      CountryDensity('Bermuda', 1246),
      CountryDensity('Channel Islands', 915),
      CountryDensity('State of Palestine', 847),
      CountryDensity('Saint-Martin', 729),
      CountryDensity('Mayotte', 727),
      CountryDensity('Taiwan', 672),
      CountryDensity('Barbados', 668),
      CountryDensity('Lebanon', 667),
      CountryDensity('Mauritius', 626),
      CountryDensity('Aruba', 593),
      CountryDensity('San Marino', 565),
      CountryDensity('Nauru', 541),
      CountryDensity('Korea', 527),
      CountryDensity('Rwanda', 525),
      CountryDensity('Netherlands', 508),
      CountryDensity('Comoros', 467),
      CountryDensity('India', 464),
      CountryDensity('Burundi', 463),
      CountryDensity('Saint-Barthélemy', 449),
      CountryDensity('Haiti', 413),
      CountryDensity('Israel', 400),
      CountryDensity('Tuvalu', 393),
      CountryDensity('Belgium', 382),
      CountryDensity('Curacao', 369),
      CountryDensity('Philippines', 367),
      CountryDensity('Reunion', 358),
      CountryDensity('Martinique', 354),
      CountryDensity('Japan', 346),
      CountryDensity('Sri Lanka', 341),
      CountryDensity('Grenada', 331),
      CountryDensity('Marshall Islands', 328),
      CountryDensity('Puerto Rico', 322),
      CountryDensity('Vietnam', 313),
      CountryDensity('El Salvador', 313),
      CountryDensity('Guam', 312),
      CountryDensity('Saint Lucia', 301),
      CountryDensity('United States Virgin Islands', 298),
      CountryDensity('Pakistan', 286),
      CountryDensity('Saint Vincent and the Grenadines', 284),
      CountryDensity('United Kingdom', 280),
      CountryDensity('American Samoa', 276),
      CountryDensity('Cayman Islands', 273),
      CountryDensity('Jamaica', 273),
      CountryDensity('Trinidad and Tobago', 272),
      CountryDensity('Qatar', 248),
      CountryDensity('Guadeloupe', 245),
      CountryDensity('Luxembourg', 241),
      CountryDensity('Germany', 240),
      CountryDensity('Kuwait', 239),
      CountryDensity('Gambia', 238),
      CountryDensity('Liechtenstein', 238),
      CountryDensity('Uganda', 228),
      CountryDensity('Sao Tome and Principe', 228),
      CountryDensity('Nigeria', 226),
      CountryDensity('Dominican Rep.', 224),
      CountryDensity('Antigua and Barbuda', 222),
      CountryDensity('Switzerland', 219),
      CountryDensity('Dem. Rep. Korea', 214),
      CountryDensity('Seychelles', 213),
      CountryDensity('Italy', 205),
      CountryDensity('Saint Kitts and Nevis', 204),
      CountryDensity('Nepal', 203),
      CountryDensity('Malawi', 202),
      CountryDensity('British Virgin Islands', 201),
      CountryDensity('Guatemala', 167),
      CountryDensity('Anguilla', 166),
      CountryDensity('Andorra', 164),
      CountryDensity('Micronesia', 164),
      CountryDensity('China', 153),
      CountryDensity('Togo', 152),
      CountryDensity('Indonesia', 151),
      CountryDensity('Isle of Man', 149),
      CountryDensity('Kiribati', 147),
      CountryDensity('Tonga', 146),
      CountryDensity('Czech Rep.', 138),
      CountryDensity('Cabo Verde', 138),
      CountryDensity('Thailand', 136),
      CountryDensity('Ghana', 136),
      CountryDensity('Denmark', 136),
      CountryDensity('Tokelau', 135),
      CountryDensity('Cyprus', 130),
      CountryDensity('Northern Mariana Islands', 125),
      CountryDensity('Poland', 123),
      CountryDensity('Moldova', 122),
      CountryDensity('Azerbaijan', 122),
      CountryDensity('France', 119),
      CountryDensity('United Arab Emirates', 118),
      CountryDensity('Ethiopia', 115),
      CountryDensity('Jordan', 114),
      CountryDensity('Slovakia', 113),
      CountryDensity('Portugal', 111),
      CountryDensity('Sierra Leone', 110),
      CountryDensity('Turkey', 109),
      CountryDensity('Austria', 109),
      CountryDensity('Benin', 107),
      CountryDensity('Hungary', 106),
      CountryDensity('Cuba', 106),
      CountryDensity('Albania', 105),
      CountryDensity('Armenia', 104),
      CountryDensity('Slovenia', 103),
      CountryDensity('Egypt', 102),
      CountryDensity('Serbia', 99),
      CountryDensity('Costa Rica', 99),
      CountryDensity('Malaysia', 98),
      CountryDensity('Dominica', 95),
      CountryDensity('Syria', 95),
      CountryDensity('Cambodia', 94),
      CountryDensity('Kenya', 94),
      CountryDensity('Spain', 93),
      CountryDensity('Iraq', 92),
      CountryDensity('Timor-Leste', 88),
      CountryDensity('Honduras', 88),
      CountryDensity('Senegal', 86),
      CountryDensity('Romania', 83),
      CountryDensity('Myanmar', 83),
      CountryDensity('Brunei Darussalam', 83),
      CountryDensity("Côte d'Ivoire", 82),
      CountryDensity('Morocco', 82),
      CountryDensity('Macedonia', 82),
      CountryDensity('Greece', 80),
      CountryDensity('Wallis and Futuna Islands', 80),
      CountryDensity('Bonaire, Sint Eustatius and Saba', 79),
      CountryDensity('Uzbekistan', 78),
      CountryDensity('French Polynesia', 76),
      CountryDensity('Burkina Faso', 76),
      CountryDensity('Tunisia', 76),
      CountryDensity('Ukraine', 75),
      CountryDensity('Croatia', 73),
      CountryDensity('Cook Islands', 73),
      CountryDensity('Ireland', 71),
      CountryDensity('Ecuador', 71),
      CountryDensity('Lesotho', 70),
      CountryDensity('Samoa', 70),
      CountryDensity('Guinea-Bissau', 69),
      CountryDensity('Tajikistan', 68),
      CountryDensity('Eswatini', 67),
      CountryDensity('Tanzania', 67),
      CountryDensity('Mexico', 66),
      CountryDensity('Bosnia and Herz.', 64),
      CountryDensity('Bulgaria', 64),
      CountryDensity('Afghanistan', 59),
      CountryDensity('Panama', 58),
      CountryDensity('Georgia', 57),
      CountryDensity('Yemen', 56),
      CountryDensity('Cameroon', 56),
      CountryDensity('Nicaragua', 55),
      CountryDensity('Guinea', 53),
      CountryDensity('Liberia', 52),
      CountryDensity('Iran', 51),
      CountryDensity('Eq. Guinea', 50),
      CountryDensity('Montserrat', 49),
      CountryDensity('Fiji', 49),
      CountryDensity('South Africa', 48),
      CountryDensity('Madagascar', 47),
      CountryDensity('Montenegro', 46),
      CountryDensity('Belarus', 46),
      CountryDensity('Colombia', 45),
      CountryDensity('Lithuania', 43),
      CountryDensity('Djibouti', 42),
      CountryDensity('Turks and Caicos Islands', 40),
      CountryDensity('Mozambique', 39),
      CountryDensity('Dem. Rep. Congo', 39),
      CountryDensity('Palau', 39),
      CountryDensity('Bahamas', 39),
      CountryDensity('Zimbabwe', 38),
      CountryDensity('United States of America', 36),
      CountryDensity('Eritrea', 35),
      CountryDensity('Faroe Islands', 35),
      CountryDensity('Kyrgyzstan', 34),
      CountryDensity('Venezuela', 32),
      CountryDensity('Lao PDR', 31),
      CountryDensity('Estonia', 31),
      CountryDensity('Latvia', 30),
      CountryDensity('Angola', 26),
      CountryDensity('Peru', 25),
      CountryDensity('Chile', 25),
      CountryDensity('Brazil', 25),
      CountryDensity('Somalia', 25),
      CountryDensity('Vanuatu', 25),
      CountryDensity('Saint Pierre and Miquelon', 25),
      CountryDensity('Sudan', 24),
      CountryDensity('Zambia', 24),
      CountryDensity('Sweden', 24),
      CountryDensity('Solomon Islands', 24),
      CountryDensity('Bhutan', 20),
      CountryDensity('Uruguay', 19),
      CountryDensity('Papua New Guinea', 19),
      CountryDensity('Niger', 19),
      CountryDensity('Algeria', 18),
      CountryDensity('S. Sudan', 18),
      CountryDensity('New Zealand', 18),
      CountryDensity('Finland', 18),
      CountryDensity('Paraguay', 17),
      CountryDensity('Belize', 17),
      CountryDensity('Mali', 16),
      CountryDensity('Argentina', 16),
      CountryDensity('Oman', 16),
      CountryDensity('Saudi Arabia', 16),
      CountryDensity('Congo', 16),
      CountryDensity('New Caledonia', 15),
      CountryDensity('Saint Helena', 15),
      CountryDensity('Norway', 14),
      CountryDensity('Chad', 13),
      CountryDensity('Turkmenistan', 12),
      CountryDensity('Bolivia', 10),
      CountryDensity('Russia', 8),
      CountryDensity('Gabon', 8),
      CountryDensity('Central African Rep.', 7),
      CountryDensity('Kazakhstan', 6),
      CountryDensity('Niue', 6),
      CountryDensity('Mauritania', 4),
      CountryDensity('Canada', 4),
      CountryDensity('Botswana', 4),
      CountryDensity('Guyana', 3),
      CountryDensity('Libya', 3),
      CountryDensity('Suriname', 3),
      CountryDensity('French Guiana', 3),
      CountryDensity('Iceland', 3),
      CountryDensity('Australia', 3),
      CountryDensity('Namibia', 3),
      CountryDensity('W. Sahara', 2),
      CountryDensity('Mongolia', 2),
      CountryDensity('Falkland Is.', 0.2),
      CountryDensity('Greenland', 0.1),
    ];
    mapSource1 = MapShapeSource.asset(
      'assets/datas/world_map.json',
      shapeDataField: 'name',
      dataCount: worldPopulationDensity.length,
      primaryValueMapper: (int index) =>
          worldPopulationDensity[index].countryName,
      shapeColorValueMapper: (int index) =>
          worldPopulationDensity[index].density,
      shapeColorMappers: <MapColorMapper>[
        const MapColorMapper(
            from: 0,
            to: 100,
            color: Color.fromRGBO(128, 159, 255, 1),
            text: '{0},{100}'),
        const MapColorMapper(
            from: 100,
            to: 500,
            color: Color.fromRGBO(51, 102, 255, 1),
            text: '500'),
        const MapColorMapper(
            from: 500,
            to: 1000,
            color: Color.fromRGBO(0, 57, 230, 1),
            text: '1k'),
        const MapColorMapper(
            from: 1000,
            to: 5000,
            color: Color.fromRGBO(0, 45, 179, 1),
            text: '5k'),
        const MapColorMapper(
            from: 5000,
            to: 50000,
            color: Color.fromRGBO(0, 26, 102, 1),
            text: '50k'),
      ],
    );
    final DateTime currentTime = DateTime.now().toUtc();

    worldClockData = <TimeDetails>[
      TimeDetails('Seattle', 47.60621, -122.332071,
          currentTime.subtract(const Duration(hours: 7))),
      TimeDetails('Belem', -1.455833, -48.503887,
          currentTime.subtract(const Duration(hours: 3))),
      TimeDetails('Greenland', 71.706936, -42.604303,
          currentTime.subtract(const Duration(hours: 2))),
      TimeDetails('Yakutsk', 62.035452, 129.675475,
          currentTime.add(const Duration(hours: 9))),
      TimeDetails('Delhi', 28.704059, 77.10249,
          currentTime.add(const Duration(hours: 5, minutes: 30))),
      TimeDetails('Brisbane', -27.469771, 153.025124,
          currentTime.add(const Duration(hours: 10))),
      TimeDetails('Harare', -17.825166, 31.03351,
          currentTime.add(const Duration(hours: 2))),
    ];

    mapSource2 = const MapShapeSource.asset(
      'assets/datas/world_map.json',
      shapeDataField: 'name',
    );

    super.onInit();
  }

  @override
  void dispose() {
    timeZones.clear();
    worldPopulationDensity.clear();
    super.dispose();
  }
}

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key, required this.countryName, required this.date})
      : super(key: key);

  final String countryName;
  final DateTime date;

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late String _currentTime;
  late DateTime _date;
  Timer? _timer;

  @override
  void initState() {
    _date = widget.date;
    _currentTime = _getFormattedDateTime(widget.date);
    _timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _updateTime(_date));
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            width: 8,
            height: 8,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          ),
        ),
        Text(
          widget.countryName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Center(
          child: Text(_currentTime,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(letterSpacing: 0.5, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  void _updateTime(DateTime currentDate) {
    _date = currentDate.add(const Duration(seconds: 1));
    setState(() {
      _currentTime = DateFormat('hh:mm:ss a').format(_date);
    });
  }

  String _getFormattedDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }
}
