import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/fonts.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.id,
    required this.image,
    required this.color,
    required this.onTap,
    required this.name,
  });

  final String id;
  final String image;
  final Color color;
  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Hero(
                    tag: 'Pokemon-$id',
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                  ),
                  Text(
                    name,
                    style: textBlackStyle,
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  height: 30,
                  width: 40,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text('#$id'),
                ))
          ],
        ),
      ),
    );
  }
}
