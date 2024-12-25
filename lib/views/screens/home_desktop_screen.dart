import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/views/widgets/top_bar.dart';
import 'package:protfolio/views/widgets/side_bar.dart';
import 'package:protfolio/views/widgets/nav_bar.dart';
import 'package:protfolio/views/widgets/user_section.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 60), child: const NavBar()),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
                top: AppDimesions.px_8,
                left: AppDimesions.px_16,
                right: AppDimesions.px_16),
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  constraints.maxWidth <= 730
                      ? TopBar()
                      : const SizedBox.shrink(),
                  const SizedBox(
                    width: AppDimesions.px_16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      constraints.maxWidth <= 730
                          ? const SizedBox.shrink()
                          : const Expanded(flex: 1, child: SideBar()),
                      const SizedBox(
                        width: AppDimesions.px_16,
                      ),
                      const Expanded(
                        flex: 3,
                        child: UserSection(),
                      )
                    ],
                  ),
                ],
              );
            })),
      ),
   
   
    );
  }
}
