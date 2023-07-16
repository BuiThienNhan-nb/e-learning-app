import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_learning_app/core/factory/list/list_factory.dart';
import 'package:e_learning_app/features/list/presentation/list_screen_presenter.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/skeleton.dart';
import '../../../../bases/presentation/atoms/w_image_network.dart';
import '../../../../configs/colors.dart';
import '../../../presenters/top/top_state.dart';
import 'w_label_container.dart';

class HorizontalListCoursesLoading extends StatelessWidget {
  const HorizontalListCoursesLoading({Key? key, this.spaceBetween = 4})
      : super(key: key);
  final double? spaceBetween;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Skeleton(
                height: 20,
                width: 80,
                leftPadding: 20,
                rightPadding: 20,
              ),
            ],
          ),
          SizedBox(height: spaceBetween),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                  right: index == 3 - 1 ? 20 : 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Skeleton(
                      height: 90,
                      width: 160,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Skeleton(
                          height: 10,
                          width: 140,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListCoursesFullDateTimeLoading extends StatelessWidget {
  const HorizontalListCoursesFullDateTimeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Skeleton(
                height: 20,
                width: 80,
                leftPadding: 20,
                rightPadding: 20,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                  right: index == 3 - 1 ? 20 : 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Skeleton(
                      height: 90,
                      width: 160,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Skeleton(
                          height: 10,
                          width: 140,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Skeleton(
                          height: 10,
                          width: 80,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListCourses extends StatelessWidget {
  final String categoryTitle;
  final TextStyle? categoryTitleStyle;
  final double? spaceBetween;
  final List<CourseModel> courses;
  final CoursesType typeEnum;

  const HorizontalListCourses({
    super.key,
    required this.categoryTitle,
    required this.courses,
    this.categoryTitleStyle,
    this.spaceBetween = 4,
    required this.typeEnum,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        typeEnum == CoursesType.continueToWatch ? Colors.transparent : null;

    return InkWell(
      splashColor: color,
      highlightColor: color,
      onTap: () {
        if (typeEnum != CoursesType.continueToWatch) {
          /// TODO: Push to another screen
          // Navigator.of(context).push(route);
        }
      },
      child: SizedBox(
        height: (courses.isEmpty || typeEnum == CoursesType.continueToWatch)
            ? 120
            : 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider<ListScreenPresenter>(
                    create: (_) => makeListScreenPresenter(),
                    lazy: true,
                    child: makeListScreenView(typeEnum),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  Text(
                    categoryTitle,
                    style: categoryTitleStyle ??
                        Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    CupertinoIcons.forward,
                    color: AppColors.iconActive,
                  )
                ],
              ),
            ),
            SizedBox(height: spaceBetween),
            Expanded(
              child: (courses.isEmpty)
                  ? SizedBox(
                      height: 120,
                      child: Center(
                        child: Text(
                          'Currently not have any data yet!',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: courses.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20 : 0,
                          right: index == courses.length - 1 ? 20 : 10,
                        ),
                        child: WCourse(
                          course: courses[index],
                          type: typeEnum,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class WCourse extends StatelessWidget {
  const WCourse({
    super.key,
    required this.course,
    required this.type,
  });

  final CourseModel course;
  final CoursesType type;

  @override
  Widget build(BuildContext context) {
    List<Widget> buildLabels() {
      List<Widget> list = [];

      for (int i = 0; i < course.categories.length; i++) {
        if (i == 2) break;
        list.addAll([
          WLabelContainer(
            color: course.categories[i].color,
            title: course.categories[i].title,
          ),
          const SizedBox(width: 4)
        ]);
      }

      return list;
    }

    return type == CoursesType.continueToWatch
        ? WEpisodeThumbnail(course.image)
        : SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: WEpisodeThumbnail(course.image),
                ),
                const SizedBox(height: 5),
                AutoSizeText(
                  course.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  'Teacher Name:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.textGray999,
                      ),
                ),
                const SizedBox(height: 5),
                Wrap(
                  children: buildLabels(),
                  // child: Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: buildLabels(),
                  // ),
                ),
              ],
            ),
          );
  }
}

class WEpisodeThumbnail extends StatelessWidget {
  const WEpisodeThumbnail(
    this.imageUrl, {
    super.key,
    this.width = 160,
    this.height = 90,
  });

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl == ''
        ? Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 0.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: WImageNetwork(
              imageUrl: imageUrl!,
              width: width,
              height: height,
            ),
          );
  }
}
