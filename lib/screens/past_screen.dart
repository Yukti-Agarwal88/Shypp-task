import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shyp_task/utils/app_assets.dart';

class PastLoads extends StatelessWidget {
  const PastLoads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Lottie.asset(
                AppAssets.noLoads,
                height: 150,
                width: 200,
              ),
            ),
            const Text('No Past Loads Found!')
          ],
        ),
      ),
    );
  }
}
