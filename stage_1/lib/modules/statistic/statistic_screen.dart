import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/modules/statistic/statistic_page_model.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  late StatisticPageModel _model;

  @override
  bool get mounted {
    return super.mounted;
  }

  @override
  void initState() {
    _model = StatisticPageModel();
    super.initState();
    _model.getAllVariesties();
    _model.totalHarvesStats();
    _model.getTotalArea();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Thống kê',
        hideBack: true,
      ),
      body: ChangeNotifierProvider<StatisticPageModel>(
        create: (_) => _model,
        builder: (context, child) => Consumer<StatisticPageModel>(
          builder: (context, model, child) {
            return  SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: []
                    ..addAll(buildHarvestTotal(model))
                    ..addAll(buildTotalFramer(model)),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }

  int maxOfAmount(List<dynamic> products) {
    int max = -1;
    for (int i = 0; i < products.length; i++) {
      var product = products[i];
      if (product['amount'] >= max) {
        max = product['amount'];
      }
    }
    return max;
  }

  List<Widget> buildHarvestTotal(StatisticPageModel model) {
    List<Widget> widgets = [
      const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Tổng sản lượng trung bình',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
          ),
        ),
      )
    ];
    if (model.harvestStats['stats'] == null) {
      return [
        const Text('Loading'),
      ];
    }

    List<dynamic> stats = model.harvestStats['stats'];

    for (int i = 0; i < stats.length; i++) {
      Map<String, dynamic> stat = stats[i];
      List<dynamic> products = stat['products'];
      var name = model.findVariety(stat['variety_id'])?.name ?? '';
      if (name.isEmpty) {
        continue;
      }
      //
      var item = Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width:1)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Wrap(
                children: products
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        buildItem(
                            '${value['product']} : ${value['amount']} ${value['unit']}')))
                    .values
                    .toList()),
          ],
        ),
      );

      widgets.add(item);
    }

    return widgets;
  }

  List<Widget> buildTotalFramer(StatisticPageModel model) {
    List<Widget> widgets = [
      const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Thông tin về diện tích',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
          ),
        ),
      )
    ];

    if(model.speciesList.isEmpty){
      widgets.add(
        const Center(child: CircularProgressIndicator())
      );
    }

// "id": "6220dc04684322a3d2a67133",
//                     "title": "Cải Thảo",
//                     "object": {
//                         "id": "6220dc04684322a3d2a67133",
//                         "name": "Cải Thảo",
//                         "category": "",
//                         "created_by": "",
//                         "created_at": "2022-03-03 15:17:24.247456758 +0000 UTC m=+471133.966619222",
//                         "updated_at": "",
//                         "deleted_at": "",
//                         "metadata": null
//                     },
//                     "amount": 24500,
//                     "unit": "m2",
//                     "number_of_farmers": 9
    for (int i = 0; i < model.speciesList.length; i++) {
      Map<String, dynamic> species = model.speciesList[i];
      var item = Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width:1)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              species['title'],
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Wrap(children: [
              buildItem('Tổng hộ trồng: ${species['number_of_farmers']}'),
              buildItem('Tổng diện tích: ${species['amount']} ${species['unit']}'),
            ])
          ],
        ),
      );

      widgets.add(item);
    }
    return widgets;
  }

  Widget buildItem(String text) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical:8),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.green),
            borderRadius: BorderRadius.circular(12)),
        child: Text(text,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black)));
  }
  // List<Widget> buildHarvestTotal(StatisticPageModel model) {
  //   List<Widget> widgets = [
  //     const Text(
  //       'Tổng sản lượng dự kiến',
  //       style: TextStyle(fontSize: 26),
  //     )
  //   ];
  //   if (model.harvestStats['stats'] == null) {
  //     return [
  //       const Text('Loading'),
  //     ];
  //   }

  //   List<dynamic> stats = model.harvestStats['stats'];

  //   for (int i = 0; i < stats.length; i++) {
  //     Map<String, dynamic> stat = stats[i];
  //     List<dynamic> products = stat['products'];

  //     List<_ChartData> data = products
  //         .map((e) => _ChartData(
  //             e['product'], (e['amount'] as int).toDouble(), Colors.red))
  //         .toList();
  //     int maxAmount = maxOfAmount(products);
  //     var item = Container(
  //       child: Column(
  //         children: [
  //           Text(model.findVariety(stat['variety_id'])?.name ?? ''),
  //           SfCartesianChart(
  //             primaryXAxis: CategoryAxis(),
  //             primaryYAxis: NumericAxis(
  //                 minimum: 0,
  //                 maximum: maxAmount.toDouble(),
  //                 interval: (maxAmount / 1000).toDouble()),
  //             series: <ChartSeries<_ChartData, String>>[
  //               ColumnSeries(
  //                 dataSource: data,
  //                 xValueMapper: (_ChartData data, _) => data.x,
  //                 yValueMapper: (_ChartData data, _) => data.y,
  //                 name: 'Gold',
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     );

  //     widgets.add(item);
  //   }

  //   return widgets;
  // }
}
