import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/modules/product_management/provider/create_forestry_product_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';

class CreateForestryProductScreen extends StatefulWidget {
  const CreateForestryProductScreen({Key? key}) : super(key: key);

  @override
  _CreateForestryProductScreenState createState() =>
      _CreateForestryProductScreenState();
}

class _CreateForestryProductScreenState
    extends State<CreateForestryProductScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateForestryProductScreenModel>(
        create: (_) => CreateForestryProductScreenModel(),
        builder: (context, child) {
          return Consumer<CreateForestryProductScreenModel>(
              builder: (context, model, child) {
            return Scaffold(
              appBar: const CustomAppBar(
                title: 'Thêm lâm sản',
              ),
              body: Column(),
            );
          });
        });
  }
}
