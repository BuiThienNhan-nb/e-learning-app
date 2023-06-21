import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../configs/colors.dart';

class SearchInput extends StatelessWidget {
  final void Function(String) onSearch;
  final void Function(String) onChanged;
  final void Function(String) onSubmitSearch;
  final TextEditingController searchController;
  final VoidCallback onClearButton;
  final bool isShowButton;

  const SearchInput({
    Key? key,
    required this.onSearch,
    required this.onChanged,
    required this.searchController,
    required this.isShowButton,
    required this.onClearButton,
    required this.onSubmitSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.placeholderLightMode,
      ),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/ic_search_transfer.svg'),
            onPressed: () {
              final searchText = searchController.text;
              onSearch(searchText);
            },
          ),
          Expanded(
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Search by course title...',
                hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                border: InputBorder.none,
              ),
              onChanged: onChanged,
              onSubmitted: onSubmitSearch,
            ),
          ),
          if (isShowButton)
            IconButton(
              icon: SvgPicture.asset('assets/icons/ic_clear.svg'),
              onPressed: onClearButton,
            ),
        ],
      ),
    );
  }
}
