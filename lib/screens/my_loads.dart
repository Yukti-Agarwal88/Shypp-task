import 'package:flutter/material.dart';
import 'package:shyp_task/screens/ongoing_view.dart';
import 'package:shyp_task/screens/past_screen.dart';
import 'package:shyp_task/utils/app_colors.dart';

class MyLoads extends StatelessWidget {
  const MyLoads({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: const Color.fromARGB(255, 234, 232, 232),
            title: const Text(
              'My Loads',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
            bottom: const TabBar(
              labelStyle: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              labelColor: AppColor.primaryColor,
              indicatorColor: AppColor.primaryColor,
              indicatorWeight: 5,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              tabs: <Widget>[
                Tab(
                  text: 'Ongoing',
                ),
                Tab(
                  text: 'Past',
                ),
              ],
            ),
          ),
          body: const TabBarView(children: <Widget>[
            Center(
              child: OngoingView(),
            ),
            Center(
              child: PastLoads(),
            ),
          ])),
    );
  }
}
