import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _controller=ConfettiController();
  bool isPlaying=false;
 @override
 void dispose(){
   super.dispose();
   _controller.dispose();
 }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/avatarprof.jpg'))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Book Tickets',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      'New-York',
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            Stack(
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
                Positioned(
                    top: -40,
                    right: -45,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 18, color: Color(0xFF264CD2))),
                    )),
                GestureDetector(
                  onTap: () {
                    _showAwardCelebration(context);

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.lightbulb_outline_rounded,
                            color: AppColors.mainColor,
                          ),
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'You have got an award',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              'You have 150 flights in a year',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Accumilated Miles',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text("192802",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 45
                  ),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Miles accured',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                      Text('11 June 2011',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('23 456',style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('Airline CO',style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Miles ',style: TextStyle(color: Colors.grey.shade600,fontSize: 14),),
                      Text('Received from',style: TextStyle(color: Colors.grey.shade600,fontSize: 14),),
                    ],
                  ),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('23 ',style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('Indigo',style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Miles ',style: TextStyle(color: Colors.grey.shade600,fontSize: 14),),
                      Text('Received from',style: TextStyle(color: Colors.grey.shade600,fontSize: 14),),
                    ],
                  ),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('789',style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('Air Asia',style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Miles ',style: TextStyle(color: Colors.grey.shade600,fontSize: 14),),
                      Text('Received from',style: TextStyle(color: Colors.grey.shade600,fontSize: 14),),
                    ],
                  ),

                ],
              ),
            )
          ],
        ));
  }

  void _showAwardCelebration(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 250,
            child: Column(
              children: [
                ConfettiWidget(
                  confettiController: _controller,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  maxBlastForce: 20,
                  minBlastForce: 10,

                ),
                SizedBox(height: 10),
                Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'You have got',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '50%',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                ),
                Text(
                  'on next flight',
                  style: TextStyle(fontSize: 16),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _controller.stop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    _controller.play();
  }
}
