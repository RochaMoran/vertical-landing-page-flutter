import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200)
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: 150,
          height: isOpen ? 305 : 50,
          color: Colors.blue,
          child: Column(
            children: [
              _MenuTile(isOpen: isOpen, animationController: _animationController),
              
              if(isOpen)
              ...[
                CustomMenuItem(delay: 10, text: 'Home', onTap: () => pageProvider.goTo(0)),
                CustomMenuItem(delay: 20, text: 'About', onTap: () => pageProvider.goTo(1)),
                CustomMenuItem(delay: 50, text: 'Location', onTap: () => pageProvider.goTo(2)),
                CustomMenuItem(delay: 30, text: 'Pricing', onTap: () => pageProvider.goTo(3)),
                CustomMenuItem(delay: 40, text: 'Contact', onTap: () => pageProvider.goTo(4)),
                const SizedBox(height: 5)
              ]
            ]
          )
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    super.key,
    required this.isOpen,
    required AnimationController animationController,
  }) : _animationController = animationController;

  final bool isOpen;
  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            width: isOpen ? 25 : 0,
          ),
          const Text('Menú', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
          const Spacer(),
          // const Icon(Icons.menu, color: Colors.black),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close, 
            progress: _animationController, 
            color: Colors.black
          )
        ],
      ),
    );
  }
}