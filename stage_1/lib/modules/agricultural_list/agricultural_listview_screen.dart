import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/modules/agricultural_list/provider/agricultural_listview_model.dart';
import 'package:stage_1/widgets/stless/agri_list_tile.dart';
import 'package:stage_1/widgets/stless/scroll.dart';

class AgriculturalListView extends StatelessWidget {
  const AgriculturalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: ChangeNotifierProvider<AgriculturalListProvider>(
          create: (_) => AgriculturalListProvider(),
          builder: (context, child) => Consumer<AgriculturalListProvider>(
              builder: (context, model, child) {
            return SafeArea(
              child: ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildChildren(size, model)),
                  ),
                ),
              ),
            );
          }),
        ));
  }

  List<Widget> _buildChildren(Size size, AgriculturalListProvider model) {
    List<Widget> agriWidget = model.agri!
        .asMap()
        .map((index, value) => MapEntry(value, AgriListTile(agriData: value)

            // ListTile(
            //   title: Text(value),
            //   trailing:
            //   IconButton(
            //     onPressed: (){
            //       Text('data');
            //   },
            //   icon: const Icon(Icons.more_vert)),

            // )
            ))
        .values
        .toList();
    return [
      Text(
        'Danh sách nông sản hiện có',
        textAlign: TextAlign.center,
        style: CustomTextStyle.heading3.copyWith(fontWeight: FontWeight.w600),
      ),
      ...agriWidget,
    ];
  }
}
