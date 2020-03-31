import 'package:flutter/material.dart';
import 'package:vispc01/dataSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatelessWidget{
  final List<DataSeries> data;

  BarChart({@required this.data});

  @override
  Widget build(BuildContext context){

    List<charts.Series<DataSeries, String>> series
    = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (DataSeries series, _) => series.year,
        measureFn: (DataSeries series, _) => series.subscribers,
        colorFn: (DataSeries series, _) => series.barColor
      )
    ];

    return charts.BarChart(series, animate: true);
  }
}