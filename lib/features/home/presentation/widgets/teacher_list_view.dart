import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/network_image.dart';

class TeacherListView extends StatelessWidget {
  const TeacherListView({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? AppDimens.mediumWidthDimens : 0,
          ),
          child: SizedBox(
            width: AppDimens.extraLargeWidthDimens * 3.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultNetworkImage(
                  imageUrl:
                      "https://i.kinja-img.com/gawker-media/image/upload/q_75,w_1200,h_900,c_fill/8df231ec8f1266779a6908117e0650ac.JPG",
                  blurHash: "LUE{|Z~qNeIV0LE2WAozIpR+t6oI",
                  height: AppDimens.extraLargeHeightDimens * 3.2,
                  width: AppDimens.extraLargeWidthDimens * 3.2,
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                SizedBox(
                  width: AppDimens.extraLargeWidthDimens * 3.5,
                  child: Text(
                    "Andrew",
                    textAlign: TextAlign.center,
                    style: AppStyles.subtitle1TextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
