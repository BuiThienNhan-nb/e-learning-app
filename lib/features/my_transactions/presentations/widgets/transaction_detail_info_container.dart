import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';

class TransactionDetailInfoContainer extends StatelessWidget {
  TransactionDetailInfoContainer({
    super.key,
    required this.titles,
    required this.contents,
    this.status,
  }) : assert(titles.length == contents.length,
            "Length of list titles must be equal to length of list contents");

  final List<String> titles;
  final List<String> contents;
  String? status;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimens.mediumWidthDimens),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.mediumWidthDimens,
        vertical: 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.neutral.shade300),
        borderRadius: BorderRadius.circular(AppDimens.largeRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral.shade200,
            blurRadius: AppDimens.mediumHeightDimens,
            // offset: const Offset(1, 1),
            blurStyle: BlurStyle.normal,
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Column(
        children: status == null
            ? _buildChildren()
            : List<Widget>.from(
                _buildChildren()
                  ..add(
                    Column(
                      children: [
                        SizedBox(height: AppDimens.mediumHeightDimens),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Text(
                                "Status",
                                style: AppStyles.subtitle1TextStyle.copyWith(
                                  color: AppColors.neutral.shade700,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimens.smallHeightDimens,
                                  horizontal: AppDimens.mediumWidthDimens,
                                ),
                                decoration: BoxDecoration(
                                  color: status == "Paid"
                                      ? AppColors.secondaryColor
                                          .withOpacity(0.1)
                                      : AppColors.fireEngineRedColor
                                          .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.largeRadius),
                                ),
                                child: Text(
                                  status ?? "",
                                  style: AppStyles.subtitle1TextStyle.copyWith(
                                    color: status == "Paid"
                                        ? AppColors.primaryColor
                                        : AppColors.fireEngineRedColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppDimens.mediumHeightDimens),
                      ],
                    ),
                  )
                  ..toList(),
              ),
      ),
    );
  }

  List<Widget> _buildChildren() => titles
      .map(
        (e) => Column(
          children: [
            SizedBox(height: AppDimens.mediumHeightDimens),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    e,
                    style: AppStyles.subtitle1TextStyle.copyWith(
                      color: AppColors.neutral.shade700,
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Text(
                    contents[index++],
                    style: AppStyles.subtitle1TextStyle.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
          ],
        ),
      )
      .toList();
}
