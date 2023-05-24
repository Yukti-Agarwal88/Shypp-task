import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:shyp_task/utils/app_colors.dart';
import 'package:shyp_task/widgets/card_ui.dart';

class OngoingView extends StatelessWidget {
  const OngoingView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ButtonsTabBar(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              borderColor: AppColor.primaryColor,
              backgroundColor: AppColor.primaryColor.withOpacity(0.2),
              unselectedBackgroundColor: Colors.white,
              labelStyle: const TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              borderWidth: 1,
              unselectedBorderColor: Colors.grey,
              radius: 50,
              tabs: const <Widget>[
                Tab(
                  text: 'All (8)',
                ),
                Tab(
                  text: 'Pending (7)',
                ),
                Tab(
                  text: 'In Progress (1)',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  ListView.builder(
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return CardUI(
                          orderStatus: index == 7 ? 'In Progress' : 'Pending',
                          orderNum: '${index + 1}',
                        );
                      }),
                  ListView.builder(
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return CardUI(
                          orderStatus: 'Pending',
                          orderNum: '${index + 1}',
                        );
                      }),
                  SingleChildScrollView(
                      child: CardUI(
                    orderStatus: 'In Progress',
                    orderNum: '8',
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
