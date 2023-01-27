import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:membership/app/modules/home/views/home_view.dart';
import 'package:membership/app/modules/list_reward/views/list_reward_view.dart';
import 'package:membership/app/modules/contactUs/views/contactUs_view.dart';
import '../../../widgets/active_icon_buttom_navbar_item.dart';
import '../../../widgets/icon_buttom_navbar_item.dart';
import '../../contactUs/controllers/contactUs_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../list_reward/controllers/list_reward_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../../../utils/text_resource.dart';
import '../../../utils/images.dart';
import '../../../utils/color_resource.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardController controller = Get.put(DashboardController());
  final HomeController homeController = Get.put(HomeController());
  final ContactUsController contactUsController =
      Get.put(ContactUsController());
  final ListRewardController listRewardController =
      Get.put(ListRewardController());

  Future<bool> _onWillPop() async {
    Get.defaultDialog(
      title: "Keluar aplikasi?",
      middleText: "Apakah Anda yakin akan keluar dari aplikasi",
      confirm: Padding(
        padding: EdgeInsets.all(14.0),
        child: TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text("Ya"),
        ),
      ),
      cancel: Padding(
        padding: EdgeInsets.all(14.0),
        child: TextButton(
          onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
          child: Text("Tidak"),
        ),
      ),
    );
  }

  var _selectedIndex = 0;
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ListRewardView(),
    ContactUsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconBottomNavBarItem(icon: Images.iconHome),
              label: TextResource.home,
              activeIcon: ActiveIconBottomNavBarItem(icon: Images.iconHome),
            ),
            BottomNavigationBarItem(
              icon: IconBottomNavBarItem(icon: Images.iconGift),
              label: TextResource.rewardList,
              activeIcon: ActiveIconBottomNavBarItem(icon: Images.iconGift),
            ),
            BottomNavigationBarItem(
              icon: IconBottomNavBarItem(icon: Images.iconContactUs),
              label: TextResource.contactUs,
              activeIcon:
                  ActiveIconBottomNavBarItem(icon: Images.iconContactUs),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ColorResources.primaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
