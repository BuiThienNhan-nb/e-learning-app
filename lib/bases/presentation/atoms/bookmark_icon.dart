import 'package:flutter/cupertino.dart';

import '../../../configs/colors.dart';

class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({
    super.key,
    required this.isBookmark,
  });

  final bool isBookmark;

  @override
  Widget build(BuildContext context) {
    final url = isBookmark
        ? "assets/icons/bookmark_active_icon.png"
        : "assets/icons/bookmark_inactive_icon.png";
    return Image.asset(
      url,
      color: AppColors.primaryColor,
    );
  }
}
