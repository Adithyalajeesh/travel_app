import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/ticket_booking/utils/app_layout.dart';
import 'package:travel_app/ticket_booking/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String,dynamic>ticket;
  const TicketView({super.key,required this.ticket});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: 200,
      child: Container(
        margin: EdgeInsets.only(right: 50, left: 8),
        child: Column(
          children: [
            /*
            Showing blue part of the ticket
            */
            Container(
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(21),
                    topLeft: Radius.circular(21)),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      ThickContainer(),
                      Expanded(
                          child: Stack(children: [
                        Container(
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                8,
                                (index) => Text(
                                      "-",
                                      style: TextStyle(color: Colors.white),
                                    )),
                          ),
                        ),
                        Center(
                            child: Transform.rotate(
                          angle: 1.5,
                          child: Icon(
                            Icons.airplanemode_active,
                            color: Colors.white,
                          ),
                        )),
                      ])),
                      ThickContainer(),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket['from']['name'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        ticket['flying_time'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket['to']['name'],

                        textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            /*
            Showing orange part of the ticket
            */
            Container(
              color: Color(0xFFF37B67),
              child: Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                20,
                                (index) => SizedBox(
                                      width: 5,
                                      height: 1,
                                      child: DecoratedBox(
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                      ),
                                    )));
                      },
                    ),
                  )),
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  )
                ],
              ),
            ),

            //bottom part of orange part
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF37B67),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21)),
              ),
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ticket['date'],
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Date',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ticket['departure_time'],
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Departure',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ticket['number'].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Number',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
