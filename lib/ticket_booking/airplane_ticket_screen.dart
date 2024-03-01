import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/ticket_booking/airplane_ticket_screen.dart';
import 'package:travel_app/ticket_booking/hotel_screen.dart';
import 'package:travel_app/ticket_booking/profile_screen.dart';
import 'package:travel_app/ticket_booking/search_screen.dart';
import 'package:travel_app/ticket_booking/ticket_booking_main_page.dart';
import 'package:travel_app/ticket_booking/utils/app_info_list.dart';
import 'package:travel_app/ticket_booking/widgets/ticket_view.dart';

import '../pages/navpages/search_page.dart';
import 'filtered_ticket.dart';

class AirplaneTicket extends StatefulWidget {
  const AirplaneTicket({Key? key}) : super(key: key);

  @override
  State<AirplaneTicket> createState() => _AirplaneTicketState();
}

class _AirplaneTicketState extends State<AirplaneTicket> {
  List<Map<String, dynamic>> _filteredTicketList = [];

  void _filterTickets(String query) {
    setState(() {
      _filteredTicketList = ticketList
          .where((ticket) => ticket['to']['name']
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    });

    // Navigate to FilteredTicketScreen with the filtered ticket list
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FilteredTicketScreen(filteredTicketList: _filteredTicketList),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.only(top: 50, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black54,
                      size: 30,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // Match the container's border radius
                        child: Image.asset(
                          'assets/logotwo.jpg',
                          // Provide the path to your image asset
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 10),
              Container(
                height: 50, // Adjust the height here
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Adjust the background color here
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onSubmitted: _filterTickets,
                  decoration: InputDecoration(
                    hintText: 'Enter destination...',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
              //Upcoming Flights text

              //Flight ticket view

              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: ticketList
                      .map((singleTicket) =>
                      GestureDetector(
                        onTap: () {
                          _showTicketBookedDialog(context);
                        },
                        child: TicketView(
                          ticket: singleTicket,
                        ),
                      ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTicketBookedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ticket Booked"),
          content: Text("Your ticket has been successfully booked."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
