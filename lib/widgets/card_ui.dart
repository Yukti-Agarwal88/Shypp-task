import 'package:flutter/material.dart';
import 'package:shyp_task/screens/order_details.dart';

class CardUI extends StatelessWidget {
  String orderStatus;
  String orderNum;
  CardUI({super.key, required this.orderStatus, required this.orderNum});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderDetails(
                    orderNumber: orderNum,
                  )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Price Pending',
                      style: TextStyle(
                          color: Color.fromARGB(255, 40, 39, 39),
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: orderStatus == 'Pending'
                            ? const Color.fromARGB(255, 130, 186, 232)
                                .withOpacity(0.6)
                            : const Color.fromARGB(255, 167, 235, 169)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        orderStatus,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 40, 39, 39),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text('Durgapur, West Bengal',
                  style: TextStyle(
                      color: Color.fromARGB(255, 40, 39, 39),
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
              const Text('28-March-2022'),
              const SizedBox(
                height: 12,
              ),
              const Text('Barpeta, Assam',
                  style: TextStyle(
                      color: Color.fromARGB(255, 40, 39, 39),
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
              const Text(
                '28-March-2022',
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('30 Tonne • TMT • Open Full Body Truck',
                      style: TextStyle(
                          color: Color.fromARGB(255, 40, 39, 39),
                          fontWeight: FontWeight.w500,
                          fontSize: 12)),
                  Icon(Icons.arrow_forward_outlined)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
