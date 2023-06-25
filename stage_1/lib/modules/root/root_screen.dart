import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/modules/farm_management/management/farm_management_screen.dart';
import 'package:stage_1/modules/profile/profile_screen.dart';
import 'package:stage_1/modules/statistic/statistic_screen.dart';
import 'package:stage_1/modules/suggest/advise_screen.dart';
import 'package:stage_1/shared/services/notification_service.dart';

import '../home/home_screen.dart';
import '../techdetail/techdetail.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    NotificationService().init(initSchedule: true);
    listenNotification();
    // NotificationService().showNotification(
    //     title: 'LacDuong',
    //     body: 'Hãy cập nhật nông trại của bạn',
    //     payload: 'test');
    NotificationService().showScheduleNotification(
        title: 'LacDuong',
        body: 'Hãy cập nhật nông trại của bạn',
        payload: 'update_8am',
        scheduleDate: DateTime.now().add(const Duration(seconds: 12)));
  }

  void listenNotification() =>
      NotificationService.onNotification.stream.listen((event) {});

  void onClickedNotification(String? payload) =>
      Navigator.pushNamed(context, Routes.screensList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          AdviseScreen(),
          FarmManagementScreen(),
          StatisticScreen(),
          TechDetailPage(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 3,
        selectedItemColor: LightTheme.darkGreen,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang Chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: 'Đề xuất',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: 'Nông Trại',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: 'Thống kê',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Quy trình',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hồ sơ',
          ),
        ],
      ),
    );
  }
}
