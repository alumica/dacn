import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/models/suggestion.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/services/api/suggestion_service.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';

class SuggestResultScreen extends StatelessWidget {
  const SuggestResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Thông tin tư vấn",
      ),
      body: ChangeNotifierProvider<SuggestResultScreenModel>(
        create: (_) => SuggestResultScreenModel(),
        builder: (context, child) {
          return Consumer<SuggestResultScreenModel>(
            builder: (context, model, child) => FutureBuilder(
              future: model.initSuggestion(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: model.suggestions.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: const BoxDecoration(
                                // color: const Color(0xffFDF6F0),
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${model.suggestions[index].variety.name}',
                                        style: CustomTextStyle.heading2Green),
                                    Text(
                                      '${(model.suggestions[index].recommendLevel * 100).toStringAsFixed(2)} %',
                                      style: CustomTextStyle.heading3GreenBold,
                                    )
                                  ],
                                ),
                                Text(
                                    'Ngày trồng: ${model.suggestions[index].plantingDate}',
                                    style: CustomTextStyle.heading3),
                                const Text('Dự kiến thu hoạch: ',
                                    style: CustomTextStyle.heading3),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFCDEC0),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                          model.suggestions[index].harvestDate,
                                          style: CustomTextStyle.heading3),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                          '${model.suggestions[index].harvestAmount.toStringAsFixed(2)} ${model.suggestions[index].harvestAmountUnit}',
                                          style: CustomTextStyle.heading3.copyWith(
                                            fontWeight: FontWeight.bold
                                          )),
                                    ),
                                  ],
                                ),
                                Text(
                                    'Dự kiến nhu cầu: ${model.suggestions[index].demandAmount} ${model.suggestions[index].demandUnit}',
                                    style: CustomTextStyle.heading3),
                                Text(
                                    'Tổng sản lượng: ${model.suggestions[index].totalAmount.toStringAsFixed(2)} ${model.suggestions[index].harvestAmountUnit}',
                                    style: CustomTextStyle.heading3),
                                Text(
                                    'Số nông hộ đang trồng: ${model.suggestions[index].numberOfPlaceholders}',
                                    style: CustomTextStyle.heading3),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       vertical: 16, horizontal: 8),
                                //   child: GradientButton(
                                //       size: size,
                                //       content: "Tiến hành trồng",
                                //       onTap: () {}),
                                // )
                              ],
                            ),
                          );
                        },
                      );
                    }
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class SuggestResultScreenModel extends ChangeNotifier {
  final SuggestionService _suggestionService = SuggestionService();
  final AppStorage _storage = AppStorage();

  List<Suggestion> suggestions = [];

  Future initSuggestion() async {
    suggestions = await _suggestionService.getSuggestionByVariety(
        _storage.varietyID, _storage.startedDate, _storage.area);

    if (suggestions.isNotEmpty) {
      suggestions.sort((e, f) => f.recommendLevel.compareTo(e.recommendLevel));
    }
  }
}
