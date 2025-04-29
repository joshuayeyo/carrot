import 'package:carrot_market/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late int _currentPageIndex; // late initialization

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  Widget _bodyWidget() {
      switch (_currentPageIndex) {
        case 0:
          return Home();
        case 1:
          return Container();
        case 2:
          return Container();
        case 3:
          return Container();
        case 4:
          return Container();
      }
      return Container();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String iconName, String label) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: SvgPicture.asset("assets/svg/${iconName}_off.svg", width: 22,)
        ),
        // 활성화된 아이콘
        activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: SvgPicture.asset("assets/svg/${iconName}_on.svg", width: 22,)
        ),
        label: label,
    );
  }
  
  Widget _bottomNavigationBarWidget() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          print(index);
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        selectedFontSize: 12,
        selectedItemColor: Colors.black,  // label 색 추가
        items: [
          _bottomNavigationBarItem("home", "홈"),
          _bottomNavigationBarItem("notes", "동네생활"),
          _bottomNavigationBarItem("location", "내 근처"),
          _bottomNavigationBarItem("chat", "채팅"),
          _bottomNavigationBarItem("user", "나의 당근"),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
