import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

//This class will contain all the data that will be processed by the graphs.

class DataSeries{
  final String year;
  final int subscribers;
  final charts.Color barColor;

  DataSeries({
    @required this.year,
    @required this.subscribers,
    @required this.barColor
  });
}
