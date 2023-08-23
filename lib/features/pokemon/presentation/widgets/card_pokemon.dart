import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            SingleCard(
              icon: Icons.person_2_outlined,
              color: Colors.greenAccent,
              text: 'Pokemon 1',
              currentIndex: 1,
            ),
            SingleCard(
              icon: Icons.build_circle_outlined,
              color: Colors.orangeAccent,
              text: 'Pokemon 2',
              currentIndex: 2,
            ),
          ],
        ),
        TableRow(
          children: [
            SingleCard(
              icon: Icons.bus_alert_rounded,
              color: Colors.purpleAccent,
              text: 'Pokemon 1',
              currentIndex: 1,
            ),
            SingleCard(
              icon: Icons.car_crash_outlined,
              color: Colors.grey,
              text: 'Pokemon 2',
              currentIndex: 2,
            ),
          ],
        ),
        TableRow(
          children: [
            SingleCard(
              icon: Icons.person_2_outlined,
              color: Colors.greenAccent,
              text: 'Pokemon 1',
              currentIndex: 1,
            ),
            SingleCard(
              icon: Icons.build_circle_outlined,
              color: Colors.orangeAccent,
              text: 'Pokemon 2',
              currentIndex: 2,
            ),
          ],
        ),
        TableRow(
          children: [
            SingleCard(
              icon: Icons.bus_alert_rounded,
              color: Colors.purpleAccent,
              text: 'Pokemon 1',
              currentIndex: 1,
            ),
            SingleCard(
              icon: Icons.car_crash_outlined,
              color: Colors.grey,
              text: 'Pokemon 2',
              currentIndex: 2,
            ),
          ],
        ),
      ],
    );
  }
}

class SingleCard extends StatefulWidget {
  const SingleCard({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.currentIndex,
  });

  final IconData icon;
  final Color color;
  final String text;
  final int currentIndex;

  @override
  State<SingleCard> createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _CardBackGroud(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: widget.color,
              radius: 30,
              child: Icon(
                widget.icon,
                size: 35,
                color: mainBlue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.text,
              style: textStyleCardPokemon(Colors.black),
            )
          ],
        ),
      ),
      onTap: () {
        //TODO nagevar al la pantalla de detalle
      },
    );
  }
}

class _CardBackGroud extends StatelessWidget {
  const _CardBackGroud({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 170,
            decoration: const BoxDecoration(
              color: secondaryBlue,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
