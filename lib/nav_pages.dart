import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/presentations/homepage.dart';
import 'package:spiritual_daily_guide/presentations/page_2.dart';
import 'package:spiritual_daily_guide/presentations/page_3.dart';
import 'package:spiritual_daily_guide/presentations/settings_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List pages = const [
    HomePage(),
    Page2(),
    Page3(),
    SettingsPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 14.0,
        unselectedFontSize: 14,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.indigoAccent.withOpacity(0.7),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 4,
        items: const [
          BottomNavigationBarItem(
              label: "Home",
              icon: Padding(
                padding: EdgeInsets.only(top: 14.0, bottom: 7),
                child: SizedBox(
                    width: 18, height: 18, child: Icon(Icons.home_filled)
                    //  SvgPicture.asset(
                    //   'assets/icons/home.svg',
                    // )
                    ),
              )),
          BottomNavigationBarItem(
              label: "Work",
              icon: Padding(
                padding: EdgeInsets.only(top: 14.0, bottom: 7),
                child: SizedBox(width: 18, height: 18, child: Icon(Icons.work)
                    // SvgPicture.asset(
                    //   'assets/icons/work.svg',
                    // )
                    ),
              )),
          // BottomNavigationBarItem(
          //     label: "",
          //     icon: Padding(
          //       padding: const EdgeInsets.only(top: 14.0),
          //       child: SizedBox(
          //           width: 32,
          //           height: 32,
          //           child:
          //               SvgPicture.asset('assets/icons/center-add-icon.svg')),
          //     )),
          BottomNavigationBarItem(
              label: "PPM",
              icon: Padding(
                padding: EdgeInsets.only(top: 14.0, bottom: 7),
                child: SizedBox(
                    width: 18, height: 18, child: Icon(Icons.engineering_sharp)
                    // SvgPicture.asset('assets/icons/ppm.svg')
                    ),
              )),
          BottomNavigationBarItem(
              label: "Settings",
              icon: Padding(
                padding: EdgeInsets.only(top: 14.0, bottom: 7),
                child:
                    SizedBox(width: 18, height: 18, child: Icon(Icons.settings)
                        // SvgPicture.asset('assets/icons/settings.svg')
                        ),
              )),
        ],
      ),
    );
  }
}
