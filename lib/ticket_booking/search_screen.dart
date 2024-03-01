import 'dart:math';
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/ticket_booking/profile_screen.dart';
import 'package:travel_app/ticket_booking/ticket_booking_main_page.dart';
import 'package:travel_app/ticket_booking/utils/app_info_list.dart';
import 'package:travel_app/ticket_booking/utils/app_layout.dart';
import '../pages/home_page.dart';
import 'airplane_ticket_screen.dart';
import 'filtered_ticket.dart';

final List<String> quotes = [
  'The only trip you\'ll regret is the one you don\'t take',
  'Travel is the only thing you buy that makes you richer',
  'Adventure is worthwhile',
  '“Jobs fill your pocket, but adventures fill your soul.” ',
  'Blessed are the curious for they shall have adventures.',
  'Live your life by a compass not a clock.',
  'A journey of a thousand miles begins with a single step.',
  '“It’s not what you look at that matters. It’s what you see.” – Henry David Thoreau'

  // Add more quotes here...
];

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 0;
  String _randomQuote = '';

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  void _getRandomQuote() {
    final Random random = Random();
    final int randomNumber = random.nextInt(quotes.length);
    setState(() {
      _randomQuote = quotes[randomNumber];
    });
  }


  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  List<Map<String, dynamic>> filteredTicketList = ticketList;

  void filterTickets() {
    setState(() {
      filteredTicketList = ticketList.where((ticket) {
        final from = ticket['from']['name'].toString().toLowerCase();
        final to = ticket['to']['name'].toString().toLowerCase();
        final fromInput = fromController.text.toLowerCase();
        final toInput = toController.text.toLowerCase();
        return from.contains(fromInput) && to.contains(toInput);
      }).toList();
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FilteredTicketScreen(filteredTicketList: filteredTicketList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(

      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'What are \nyou looking for?',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          FittedBox(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(3.5),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.44,
                    padding: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white),
                    child: Center(
                      child: Text('Airline tickets'),
                    ),
                  ),
                  Container(
                    width: size.width * 0.44,
                    padding: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.transparent),
                    child: Center(
                      child: Text('Hotel'),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFFF4F6FD)),
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: TextField(
                    controller: fromController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.flight_takeoff),
                      hintText: 'From',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: TextField(
                    controller: toController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.flight_land),
                      hintText: 'To',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextButton(
                    onPressed: filterTickets,
                    child: Text(
                      'Find Tickets',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Flights',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // View all action
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 400,
                      width: size.width * .42,
                      padding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 1,
                                spreadRadius: 1)
                          ]),
                      child: Column(
                        children: [
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/seat.jpg'))),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '20% discount on the early booking of this flight.Don\'t miss this chance',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textColor2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: size.width * .44,
                              height: 174,
                              decoration: BoxDecoration(
                                  color: Color(0xFF3AB8B8),
                                  borderRadius: BorderRadius.circular(18)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Discount\n for Survey',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Take the survey about our service and get discount',
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              right: -28,
                              top: -20,
                              child: Container(
                                padding: EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 18,
                                    color: Color(0xFF189999),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: size.width * .44,
                          height: 200,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Color(0xFFEC6545)),
                          child: Column(
                            children: [
                              Text(
                                'Quote of the day:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                _randomQuote,
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
