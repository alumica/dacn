import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/modules/farm_management/management/widgets/all_farm_infomation.dart';
import 'package:stage_1/widgets/stless/farm_widget.dart';
import 'package:stage_1/widgets/stless/notfound_widget.dart';

import '../farm_management_screen_model.dart';

class ListOfFarm extends StatefulWidget {
  const ListOfFarm({Key? key, required this.model}) : super(key: key);

  final FarmManagementScreenModel model;

  @override
  _ListOfFarmState createState() => _ListOfFarmState();
}

class _ListOfFarmState extends State<ListOfFarm> {
  late FarmManagementScreenModel _model;
  late AppStorage _store;

  @override
  void initState() {
    super.initState();
    _store = AppStorage();
    _model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.primaryPadding),
        child: _model.store.farms.isEmpty
            ? NotFoundWidget(
                onTap: () {
                  Navigator.pushNamed(context, Routes.createFarmScreen)
                      .then((value) => setState(() {}));
                },
                title: 'Chưa có nông trại',
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AllFarmInfomation(
                    area: getTotalArea().toInt(),
                    areaUnit: 'm2',
                  ),
                  ..._getFarmList(),
                ],
              ),
      ),
    );
  }

  double getTotalArea() {
    double total = 0;
    for (var farm in _store.farms) {
      total += (farm.area ?? 0);
    }
    return total;
  }

  List<Widget> _getFarmList() {
    return _store.farms
        .map(
          (farm) => FarmWidget(
            farm: farm,
            onTap: () => Navigator.pushNamed(context, Routes.farmDetailsScreen,
                    arguments: farm)
                .then((value) => setState(() {})),
          ),
        )
        .toList();
  }
}
