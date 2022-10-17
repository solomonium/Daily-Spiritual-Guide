import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class SkillSetActionHolder extends StatelessWidget {
  const SkillSetActionHolder({Key? key, this.title = ''}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Material(
        color: const Color(0xFFFFD339).withOpacity(0.2),
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Row(
            children: [
              Text(title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.body2.copyWith(fontWeight: FontWeight.w400))
            ],
          ),
        ),
      ),
    );
  }
}
