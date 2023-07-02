import 'package:e_learning_app/bases/presentation/atoms/skeleton.dart';
import 'package:e_learning_app/utils/app_utils.dart';
import 'package:flutter/material.dart';

class VerticalListEpisodesFullDateTimeLoading extends StatelessWidget {
  const VerticalListEpisodesFullDateTimeLoading({
    Key? key,
    this.height,
    this.itemCount = 7,
  }) : super(key: key);
  final double? height;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    Utils.instance.setDeviceSize(context);

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: List.generate(
          itemCount,
          (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 90,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(
                        height: 90,
                        width: Utils.instance.toDeviceWidthPercent(160),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Skeleton(
                                height: 10,
                                width: Utils.instance.toDeviceWidthPercent(140),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Skeleton(
                                height: 10,
                                width: 88,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Skeleton(
                                height: 10,
                                width: 40,
                              ),
                              SizedBox(width: 8),
                              Skeleton(
                                height: 10,
                                width: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
