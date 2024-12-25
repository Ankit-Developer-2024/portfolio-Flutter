
import 'package:flutter/material.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/views/widgets/components/heading_with_line_ui.dart';

class UserProjectSection extends StatelessWidget {
  const UserProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadingWithLineUi(heading: "Projects"),
        const SizedBox(height: AppDimesions.px_10,),
      ],
    );
  }
}