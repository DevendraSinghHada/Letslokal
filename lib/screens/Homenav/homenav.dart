import 'package:letslokal/screens/Homenav/Profile/account.dart';
import 'package:letslokal/screens/Homenav/Quests/quest.dart';
import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/screens/Homenav/Wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'HomePage/mainpage.dart';
import 'MyQuest/myquestfinal.dart';

class HomeNav extends StatefulWidget {
  int selectindex;
  HomeNav({super.key, required this.selectindex});
  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectindex = 0;

  // ignore: prefer_final_fields
  List<Widget> _widgetOption = <Widget>[
    const MainPage(),
    const Wishlist(),
    const MyWishlist(),
    const MyQuest.quests(),
    const Account(),
  ];

  void _onitemTape(int selectindex) {
    setState(() {
      _selectindex = selectindex;
    });
  }

  @override
  void initState() {
    super.initState();

    _selectindex = widget.selectindex - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Center(
        child: _widgetOption.elementAt(_selectindex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: ktextfildecolor),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.home,
                  size: 28,
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 28,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectindex == 2
                  ? SvgPicture.asset(logo, height: 23)
                  : Image.asset(
                      WhiteLogo,
                      height: 26,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectindex == 3
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(tealDashboard, height: 22))
                  : Image.asset(
                      whiteDashboard,
                      height: 22,
                    ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 28,
              ),
              label: '',
            ),
          ],
          currentIndex: _selectindex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: kthemeColor,
          unselectedItemColor: kWhiteColor,
          selectedIconTheme: const IconThemeData(color: kthemeColor, size: 20),
          unselectedIconTheme:
              const IconThemeData(color: kWhiteColor, size: 20),
          onTap: _onitemTape,
        ),
      ),
    );
  }
}
