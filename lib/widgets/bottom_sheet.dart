import 'package:flutter/material.dart';
import 'package:shyp_task/utils/app_colors.dart';
import 'package:shyp_task/widgets/button.dart';

class BottomSheetUI extends StatefulWidget {
  String title;
  String location;
  String type;

  BottomSheetUI({
    super.key,
    required this.title,
    required this.location,
    required this.type,
  });

  @override
  State<BottomSheetUI> createState() => _BottomSheetUIState();
}

class _BottomSheetUIState extends State<BottomSheetUI> {
  List dataList = [
    'Krishna Pvt Ltd.',
    'Balaji Cements',
    'Bajaj Motors',
    'Tata Motors'
  ];
  String? selectValue = 'Krishna Pvt Ltd.';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.31,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            DropdownButtonFormField<String>(
              value: selectValue,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(Icons.close_outlined),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.keyboard_arrow_down_outlined),
                ],
              ),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  selectValue = value!;
                });
              },
              items: dataList.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry,
                  child:
                      Text(entry, style: const TextStyle(color: Colors.black)),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelStyle: TextStyle(fontSize: 12),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(widget.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
                child: Text(
              '+ Add New ${widget.type} Contract',
              style:
                  const TextStyle(color: AppColor.primaryColor, fontSize: 14),
            )),
            const SizedBox(
              height: 20,
            ),
            widget.type == 'Consignor'
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: UIButton(
                      buttonBgColor: AppColor.primaryColor,
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
                                  title: 'Consignee Details (Ship To)',
                                  location: 'Barpeta, Assam',
                                  type: 'Consignee');
                            });
                      },
                      title: 'Next',
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIButton(
                          buttonBgColor: AppColor.primaryColor,
                          smallButton: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: 'Back'),
                      UIButton(
                          buttonBgColor: AppColor.primaryColor,
                          smallButton: true,
                          onPressed: () {},
                          title: 'Confirm')
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
