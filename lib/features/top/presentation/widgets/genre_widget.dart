import 'package:e_learning_app/bases/presentation/atoms/w_image_network.dart';
import 'package:e_learning_app/features/top/domain/entities/category_model.dart';
import 'package:flutter/material.dart';

class ListGenreHorizontal extends StatelessWidget {
  const ListGenreHorizontal({Key? key, required this.categories})
      : super(key: key);
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width,
      height: 70,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GenreWidget(
              category: categories[index],
            ),
          ),
        ),
      ),
    );
  }
}

class GenreWidget extends StatelessWidget {
  const GenreWidget({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: WImageNetwork(
              imageUrl: category.imageUrl ?? '', width: 100, height: 40),
        ),
        Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
