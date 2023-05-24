import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_bar_steppers/steppers.dart';
import 'package:shyp_task/utils/app_assets.dart';
import 'package:shyp_task/utils/app_colors.dart';
import 'package:shyp_task/widgets/bottom_sheet.dart';
import 'package:shyp_task/widgets/button.dart';

class OrderDetails extends StatelessWidget {
  String orderNumber;
  OrderDetails({super.key, required this.orderNumber});
  var currentStep = 2;
  var totalSteps = 0;
  final stepsData = [
    StepperData(
      label: 'Pending',
    ),
    StepperData(
      label: 'Quoted',
    ),
    StepperData(
      label: 'Scheduled',
    ),
    StepperData(
      label: 'In Progress',
    ),
  ];

  List<Map<String, String>> data = [
    {'label': 'Order ID', 'value': '1'},
    {'label': 'Pickup Date', 'value': '02-Feb-23'},
    {'label': 'Preferred Vehicle', 'value': 'Open Half Body Truck'},
    {'label': 'Quantity of load', 'value': '25.0 Tonne'},
    {'label': 'Material Type', 'value': 'TMT'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 238, 235, 235),
        centerTitle: false,
        title: Text(
          'Order: #$orderNumber',
          style: const TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Pickup Location'),
                              Text('Durgapur, West Bengal',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 14, 74, 111),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              SizedBox(
                                height: 16,
                              ),
                              Text('Drop Location'),
                              Text('Barpeta, Assam',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 14, 74, 111),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 130,
                            child: Lottie.asset(
                              AppAssets.movingTruck,
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < data.length; i++) ...[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(data[i]['label']!),
                                    i == 0
                                        ? Text(orderNumber,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 74, 111),
                                              fontWeight: FontWeight.w500,
                                            ))
                                        : Text(data[i]['value']!,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 14, 74, 111),
                                              fontWeight: FontWeight.w500,
                                            )),
                                  ]),
                            ),
                          ]
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Load Status',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Steppers(
                              direction: StepperDirection.horizontal,
                              labels: stepsData,
                              currentStep: currentStep,
                              stepBarStyle: StepperStyle(
                                activeColor: Colors.green,
                                maxLineLabel: 2,
                              ),
                            )
                          ]))),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Per Tonne Freight Price',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₹ 3000.0',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w800),
                              ),
                            ]))),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: UIButton(
                  buttonBgColor: Colors.green,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25),
                            topStart: Radius.circular(25),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return BottomSheetUI(
                              title: 'Consignor Details (Dispatch From)',
                              location: 'Durgapur, West Bengal',
                              type: 'Consignor');
                        });
                  },
                  title: 'Confirm Load Booking',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: AppColor.primaryColor, width: 2),
                    ),
                    onPressed: () {
                      debugPrint('Received click');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 18, color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
