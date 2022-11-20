import 'package:e_learning_app/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../../configs/dimens.dart';
import '../../../../configs/formats.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../widgets/transaction_detail_info_container.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String mockTransactionId = "".getRandomString(15);

    return Scaffold(
      appBar: const SettingAppBar(title: "E-Receipt"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimens.mediumWidthDimens,
            AppDimens.largeHeightDimens,
            AppDimens.mediumWidthDimens,
            AppDimens.largeHeightDimens,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimens.largeHeightDimens),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: AppDimens.extraLargeWidthDimens,
                ),
                height: AppDimens.extraLargeHeightDimens * 5,
                width: double.infinity,
                child: SfBarcodeGenerator(
                  value: mockTransactionId,
                  symbology: Code39Extended(module: 2),
                  showValue: true,
                ),
              ),
              SizedBox(height: AppDimens.largeHeightDimens),
              TransactionDetailInfoContainer(
                titles: const [
                  "Course",
                  "Category",
                ],
                contents: const [
                  "Passive Income 6 figures Drop Servicing Home Online Business",
                  "Business",
                ],
              ),
              SizedBox(height: AppDimens.smallHeightDimens),
              TransactionDetailInfoContainer(
                titles: const [
                  "Name",
                  "Phone",
                  "Email",
                ],
                contents: const [
                  "Bùi Thiện Nhân",
                  "N/A",
                  "buithiennhan250901@gmail.com",
                ],
              ),
              SizedBox(height: AppDimens.smallHeightDimens),
              TransactionDetailInfoContainer(
                titles: const [
                  "Price",
                  "Payment Method",
                  "Date",
                  "TransactionID",
                ],
                contents: [
                  "53.5\$",
                  "Credit Card",
                  AppFormats.instance.formatDateMonthTime
                      .format(DateTime.now()),
                  mockTransactionId,
                ],
                status: "Paid",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
