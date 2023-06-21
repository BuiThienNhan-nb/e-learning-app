import 'package:e_learning_app/bases/presentation/atoms/w_image_network.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';

class WGridTeacherItem extends StatelessWidget {
  final TeacherModel teacher;
  final Function(TeacherModel) onItemTap;

  const WGridTeacherItem({
    Key? key,
    required this.teacher,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemTap(teacher),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.lineBasic,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              WImageNetwork(
                imageUrl: teacher.avatar ?? '',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  teacher.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
