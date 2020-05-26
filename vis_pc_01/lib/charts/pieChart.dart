/// Bar chart with series legend example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:vispc01/logic/disabilitySeries.dart';

class DonutChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutChart(this.seriesList, {this.animate});

  factory DonutChart.withExistingData(List<DisabilitySeries> inputList, String sex) {
    return new DonutChart(_createChartData(inputList, sex), animate: true);
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [new charts.DatumLegend(desiredMaxColumns: 3)],
//      // [ArcLabelDecorator] will automatically position the label inside the
//      // arc if the label will fit. If the label will not fit, it will draw
//      // outside of the arc with a leader line. Labels can always display
//      // inside or outside using [LabelPosition].
//      //
//      // Text style for inside / outside can be controlled independently by
//      // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
//      //
//      // Example configuring different styles for inside/outside:
//      //       new charts.ArcLabelDecorator(
//      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
//      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 80,
          arcRendererDecorators: [new charts.ArcLabelDecorator()]
      )
    );
  }

  static List<charts.Series<DisabilitySeries, String>> _createChartData(List<DisabilitySeries> inputList, String sex) {

    return [
//      new charts.Series<DisabilitySeries, String>(
//        id: 'Hombres',
//        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//        domainFn: (DisabilitySeries amount, _) => amount.ageGroup,
//        measureFn: (DisabilitySeries amount, _) => amount.amount,
//        data: maleList,
//      ),
      new charts.Series<DisabilitySeries, String>(
        id: 'Mujeres',
        domainFn: (DisabilitySeries amount, _) => amount.ageGroup,
        measureFn: (DisabilitySeries amount, _) => amount.amount,
        labelAccessorFn: (DisabilitySeries row, _) => '${row.ageGroup}: ${row.amount}',
        data: inputList,
      ),
    ];
  }

}