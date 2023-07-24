import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/features/top/domain/entities/google_search_modal.dart';
import 'package:flutter/material.dart';

class GoogleSearchSection extends StatelessWidget {
  const GoogleSearchSection({
    super.key,
    required this.googleSearchModels,
    required this.onSearchKeyTap,
  });

  final List<GoogleSearchModel> googleSearchModels;
  final Function(GoogleSearchModel) onSearchKeyTap;

  @override
  Widget build(BuildContext context) {
    List<Widget> buildList({required int startIndex, required int endIndex}) {
      final List<Widget> list = [const SizedBox(width: 20)];

      for (var i = startIndex; i <= endIndex; i++) {
        list.addAll(
          [
            InkWell(
              onTap: () => onSearchKeyTap(googleSearchModels[i]),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.lineLightBasic),
                ),
                child: Text(
                  googleSearchModels[i].title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w300),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        );
      }

      return list..add(const SizedBox(width: 10));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Education News',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: buildList(startIndex: 0, endIndex: 5),
              ),
              const SizedBox(height: 10),
              Row(
                children: buildList(
                  startIndex: 6,
                  endIndex: googleSearchModels.length - 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
