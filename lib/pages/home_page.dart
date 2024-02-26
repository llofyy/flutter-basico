import 'package:exemplo/presentation/feed_page.dart';
import 'package:exemplo/presentation/messages_page.dart';
import 'package:exemplo/presentation/requests_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _indexNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social DEV'),
        centerTitle: true,
        actions: [
          SizedBox(
            child: TextButton(
              child: const Icon(
                Icons.menu,
                size: 30.0,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: _pageController,
          children: const [FeedPage(), RequestsPage(), MessagesPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int page) {
          setState(() {
            _indexNavigation = page;
          });
          _pageController.animateToPage(page,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        currentIndex: _indexNavigation,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'News Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        ],
      ),
    );
  }
}
