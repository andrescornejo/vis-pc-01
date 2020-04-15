/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:vispc01/logic/disabilitySeries.dart';

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate});

  factory GroupedBarChart.withExistingData(List<charts.Series<DisabilitySeries, String>> inputData) {
    return new GroupedBarChart(inputData, animate: true);
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the legend behavior to the chart to turn on legends.
      // This example shows how to change the position and justification of
      // the legend, in addition to altering the max rows and padding.
      behaviors: [
    new charts.SeriesLegend(
    // Positions for "start" and "end" will be left and right respectively
    // for widgets with a build context that has directionality ltr.
    // For rtl, "start" and "end" will be right and left respectively.
    // Since this example has directionality of ltr, the legend is
    // positioned on the right side of the chart.
    position: charts.BehaviorPosition.bottom,
      // For a legend that is positioned on the left or right of the chart,
      // setting the justification for [endDrawArea] is aligned to the
      // bottom of the chart draw area.
      outsideJustification: charts.OutsideJustification.middleDrawArea,
      // By default, if the position of the chart is on the left or right of
      // the chart, [horizontalFirst] is set to false. This means that the
      // legend entries will grow as new rows first instead of a new column.
      horizontalFirst: false,
      // By setting this value to 2, the legend entries will grow up to two
      // rows before adding a new column.
      desiredMaxRows: 1,
      // This defines the padding around each legend entry.
      cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
    )]);
  }

}