import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_learning_app/bases/presentation/atoms/w_image_network.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:e_learning_app/features/top/presentation/widgets/w_label_container.dart';
import 'package:flutter/material.dart';

class WCourseItem extends StatefulWidget {
  const WCourseItem({
    super.key,
    required this.course,
    required this.onCourseTap,
  });

  final CourseModel course;
  final Function() onCourseTap;

  @override
  State<WCourseItem> createState() => _WCourseItemState();
}

class _WCourseItemState extends State<WCourseItem> {
  @override
  Widget build(BuildContext context) {
    const widthItemEpisodeDesign = 160;
    const widthItemEpisodeDesignRanking = 142;
    const widthDesign = 390;
    final widthScreen = MediaQuery.of(context).size.width;
    final widthEpisode = widthScreen * (widthItemEpisodeDesign / widthDesign);
    final widthEpisodeRanking =
        widthScreen * (widthItemEpisodeDesignRanking / widthDesign);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          WImageNetwork(
            imageUrl: widget.course.image ?? 'none',
            width: widthEpisode,
            height: 95,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: widget.onCourseTap,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    widget.course.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.course.description.trim(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.textGray999,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.course.category.first,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.textGray999,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...widget.course.categories
                          .asMap()
                          .map(
                            (index, value) => MapEntry(
                              index,
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: WLabelContainer(
                                  color: widget.course.categories[index].color,
                                  title: widget.course.categories[index].title,
                                ),
                              ),
                            ),
                          )
                          .values
                          .toList()
                          .getRange(
                              0,
                              widget.course.categories.length <= 3
                                  ? widget.course.categories.length
                                  : 3)
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
