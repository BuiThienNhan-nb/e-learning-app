import 'package:e_learning_app/features/my_transactions/presentations/widgets/my_transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../bases/presentation/atoms/default_app_bar.dart';

class MyTransactionsPage extends StatelessWidget {
  const MyTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppBar(title: "My Transactions"),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ListView.builder(
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(
                "transaction_detail",
                params: {
                  "transactionId": "N/A",
                },
              ),
              child: const MyTransactionCard(),
            ),
          ),
        ),
      ),
    );
  }
}
