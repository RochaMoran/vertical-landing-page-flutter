import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  List<String> _pages = ['home', 'about', 'location', 'pricing', 'contact'];
  int _currentIndex = 0;

  goTo(int index) {
    final routeName = _pages[index].toLowerCase();

    html.window.history.pushState(null, routeName, '#/${_pages[index]}');

    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut
    );
  }

  createScrollController (String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));

    html.document.title = "PAGE | ${routeName.toUpperCase()}";

    scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();

      if (pageIndex != _currentIndex) {
        html.window.history.pushState(null, _pages[pageIndex], '#/${_pages[pageIndex]}');
        _currentIndex = pageIndex;
        html.document.title = "PAGE | ${_pages[pageIndex].toUpperCase()}";
      }
    });
  }

  int getPageIndex(String routeName) {
    return (_pages.contains(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }
}