import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/placeholder.dart' as placeholder;
import 'package:stage_1/widgets/stless/custom_container_decoration.dart';


class FarmInformation extends StatelessWidget {
  const FarmInformation({
    Key? key,
    required this.farm,
    required this.placeholders
  }) : super(key: key);

  final Farm? farm;
  final List<placeholder.Placeholder>? placeholders;

  
  getAllTotalPlaceholders() {
    double sum = 0;
    for(var element in placeholders??[]){
      sum += element.area ?? 0;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0),
      decoration: borderContainer(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Thông tin',
                style: CustomTextStyle.heading2BlackBold,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text.rich(
            TextSpan(
              text: 'Tổng diện tích: ',
              style: CustomTextStyle.heading3BlackBold,
              children: <TextSpan>[
                TextSpan(
                    text: '${farm!.area?.round()} ${farm!.areaUnit}',
                    style: CustomTextStyle.heading3),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'Diện tích đã trồng: ',
              style: CustomTextStyle.heading3BlackBold,
              children: <TextSpan>[
                TextSpan(
                    text: '${getAllTotalPlaceholders()} ${farm!.areaUnit}',
                    style: CustomTextStyle.heading3),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'Diện tích còn lại: ',
              style: CustomTextStyle.heading3BlackBold,
              children: <TextSpan>[
                TextSpan(
                    text: '${farm!.areaLeft?.round()} ${farm!.areaUnit}',
                    style: CustomTextStyle.heading3),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: 'Địa chỉ: ',
              style: CustomTextStyle.heading3BlackBold,
              children: <TextSpan>[
                TextSpan(
                    text: farm!.street!.isNotEmpty || farm!.street == null
                        ? '${farm?.street}'
                        : "",
                    style: CustomTextStyle.heading3),
                TextSpan(
                    text: farm!.street!.isNotEmpty || farm!.street == null
                        ? ', ${farm?.ward}'
                        : "",
                    style: CustomTextStyle.heading3),
                // TextSpan(
                //     text:
                //         farm!.street!.isNotEmpty || farm!.street == null
                //             ? ', ${farm?.district}'
                //             : "",
                //     style: CustomTextStyle.heading3),
                // TextSpan(
                //     text:
                //         farm!.street!.isNotEmpty || farm!.street == null
                //             ? ', ${farm?.province}'
                //             : "",
                //     style: CustomTextStyle.heading3),
                const TextSpan(text: '.', style: CustomTextStyle.heading3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
