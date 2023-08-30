import 'package:flutter/material.dart';
import 'package:pokemon_app/core/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../routes/resource_icons.dart';

class CustomLoadingScreen extends StatelessWidget {
  const CustomLoadingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: mainGrey.withOpacity(0.2),
      child: SizedBox(
        child: SizedBox(
          child: Image(
            image: const AssetImage(loadingGIF),
            fit: BoxFit.cover,
            height: 5.h,
          ),
        ),
      ),
    );
  }
}
