import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../states/mobx/update_avatar_store.dart';

class UpdateAvatarBottomSheet extends StatelessWidget {
  const UpdateAvatarBottomSheet({
    super.key,
    required this.store,
  });

  final UpdateAvatarStore store;

  @override
  Widget build(BuildContext context) {
    _pickImage(ImageSource source) async {
      XFile? xFile = await ImagePicker().pickImage(source: source);
      if (xFile == null) return;
      store.updateAvatar(xFile.path);
      // if (!mounted) return;
      Navigator.of(context).pop();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppDimens.mediumHeightDimens),
        Text(
          "Edit Avatar",
          style: AppStyles.headline4TextStyle.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        Divider(
          thickness: 1.2,
          indent: AppDimens.extraLargeWidthDimens,
          endIndent: AppDimens.extraLargeWidthDimens,
          color: AppColors.neutral.shade500,
        ),
        RowUpdateAvatarItem(
          title: "Pick Image from Gallery",
          iconSource: "assets/icons/gallery_icon.png",
          onTap: () => _pickImage(ImageSource.gallery),
        ),
        RowUpdateAvatarItem(
          title: "Take a Picture from Camera",
          iconSource: "assets/icons/camera_icon.png",
          onTap: () => _pickImage(ImageSource.camera),
        ),
      ],
    );
  }
}

class RowUpdateAvatarItem extends StatelessWidget {
  const RowUpdateAvatarItem({
    super.key,
    required this.title,
    required this.iconSource,
    required this.onTap,
  });

  final String title;
  final String iconSource;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppDimens.mediumHeightDimens,
          horizontal: AppDimens.largeWidthDimens,
        ),
        child: Row(
          children: [
            Image.asset(
              iconSource,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            Expanded(
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
