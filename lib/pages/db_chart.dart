import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:firebase_database/firebase_database.dart';

class TemperatureChart extends StatefulWidget {
  @override
  _TemperatureChartState createState() => _TemperatureChartState();
}

class _TemperatureChartState extends State<TemperatureChart> {
  List<charts.Series<Temperature, int>> _seriesData = [];
  @override
  void initState() {
    super.initState();
    FirebaseDatabase.instance.reference().child("temp").onValue.listen((event) {
      var tempData = event.snapshot.value as Map<dynamic, dynamic>;
      print(tempData);
      var data = tempData.entries
          .map((e) => Temperature(int.parse(e.key), e.value))
          .toList();
      setState(() {
        _seriesData = [
          charts.Series<Temperature, int>(
            data: data,
            domainFn: (Temperature temperature, _) => temperature.time,
            measureFn: (Temperature temperature, _) => temperature.temp,
            id: 'Temperature',
          )
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        child: charts.LineChart(
          _seriesData,
          animate: true,
        ));
  }
}

class Temperature {
  final int time;
  final double temp;
  Temperature(this.time, this.temp);
}
