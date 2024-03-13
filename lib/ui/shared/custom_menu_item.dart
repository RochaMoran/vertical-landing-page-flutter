import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onTap;
  final int delay;

  const CustomMenuItem({super.key, required this.text, required this.onTap, this.delay = 0});

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10,
      delay: Duration(milliseconds: widget.delay),
      duration: const Duration(milliseconds: 200),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: GestureDetector(
          onTap: () {
            widget.onTap();
          },
          child: AnimatedContainer(
           duration: const Duration(milliseconds: 200),
           width: 150,
           height: 50,
            color: isHover ? Colors.white : Colors.blue,
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: isHover ? Colors.blue : Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}