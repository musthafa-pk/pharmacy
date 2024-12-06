import 'package:flutter/material.dart';

import '../../Constants/appColors.dart';

class Readytoship extends StatelessWidget {
  const Readytoship({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: TextColorWhite,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order No:#0001'),
                    Text('Date   : 2024-11-01'),
                    Text('Total  : Rs 300.0'),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:100,
                          decoration:BoxDecoration(
                              color: PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Accept',style: TextStyle(
                                color: TextColorWhite,fontWeight: FontWeight.bold
                            ),),
                          )),
                        ),

                        Container(
                          width:100,
                          decoration:BoxDecoration(
                              color: RedColor,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Reject',style: TextStyle(
                                color: TextColorWhite,fontWeight: FontWeight.bold
                            ),),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
