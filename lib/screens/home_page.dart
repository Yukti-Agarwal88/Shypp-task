import 'package:flutter/material.dart';
import 'package:shyp_task/screens/my_loads.dart';
import 'package:shyp_task/utils/app_colors.dart';
import 'package:shyp_task/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.primaryColor);
  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Welcome to Shypp',
      style: optionStyle,
    ),
    const MyLoads(),
    SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 32,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hi, Rahul',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w800),
                              ),
                              Text(
                                'View order summary',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ]),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: UIButton(
                  onPressed: () {},
                  title: 'Sign Out',
                  buttonBgColor: AppColor.primaryColor),
            )
          ],
        ),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'My Loads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
