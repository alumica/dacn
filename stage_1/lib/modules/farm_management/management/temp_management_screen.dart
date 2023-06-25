import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/modules/farm_management/management/farm_management_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/farm_widget.dart';
import 'package:stage_1/widgets/stless/notfound_widget.dart';

class TempFarmManagementScreen extends StatelessWidget {
  const TempFarmManagementScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FarmManagementScreenModel>(
      create: (_) => FarmManagementScreenModel(),
      child: Consumer<FarmManagementScreenModel>(
        builder: (context, model, child) {
          return FarmManagementPage(farms: model.store.farms, model: model);
        },
      ),
    );
  }
}

class FarmManagementPage extends StatefulWidget {
  const FarmManagementPage({
    Key? key,
    required this.farms,
    required this.model,
  }) : super(key: key);

  final List<Farm> farms;
  final FarmManagementScreenModel model;

  @override
  State<FarmManagementPage> createState() => _FarmManagementPageState();
}

class _FarmManagementPageState extends State<FarmManagementPage> {
  @override
  void initState() {
    super.initState();
    widget.model.getFarmByUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      appBar: const CustomAppBar(
        title: 'Quản lý nông trại',
        hideBack: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.primaryPadding),
          child: widget.model.store.farms.isEmpty
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
      ),
    );
  }

  double getTotalArea() {
    double total = 0;
    for (var farm in widget.farms) {
      total += (farm.area ?? 0);
    }
    return total;
  }

  Widget floatingActionButton() {
    return FloatingActionButton(
      child: const Icon(FontAwesomeIcons.plus),
      backgroundColor: LightTheme.darkGreen,
      onPressed: () {
        Navigator.pushNamed(context, Routes.createFarmScreen)
            .then((value) => setState(() {}));
      },
    );
  }

  List<Widget> _getFarmList() {
    return widget.farms
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

class AllFarmInfomation extends StatelessWidget {
  const AllFarmInfomation({
    Key? key,
    required this.area,
    required this.areaUnit,
  }) : super(key: key);

  final int area;
  final String areaUnit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 16),
      child: Text.rich(
        TextSpan(
          text: 'Tổng diện tích: ',
          style: CustomTextStyle.heading2,
          children: <TextSpan>[
            TextSpan(
              text: '$area $areaUnit',
              style: CustomTextStyle.heading1BlackBold,
            )
          ],
        ),
      ),
    );
  }
}
