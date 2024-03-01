import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/ticket_booking/airplane_ticket_screen.dart';
import 'package:travel_app/ticket_booking/hotel_screen.dart';
import 'package:travel_app/ticket_booking/profile_screen.dart';
import 'package:travel_app/ticket_booking/search_screen.dart';
import 'package:travel_app/ticket_booking/utils/app_info_list.dart';
import 'package:travel_app/ticket_booking/widgets/ticket_view.dart';

import '../pages/navpages/search_page.dart';
import 'filtered_ticket.dart';

class TicketBookingPage extends StatefulWidget {
  const TicketBookingPage({Key? key}) : super(key: key);

  @override
  State<TicketBookingPage> createState() => _TicketBookingPageState();
}

class _TicketBookingPageState extends State<TicketBookingPage> {
  String _getGreetingMessage() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }


  //searchh
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


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TicketBookingPage()),
        );
        break;
      case 1:
      // Navigate to Search page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AirplaneTicket()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
      default:
      // Do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.buttonBackground,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket),label: "Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",)

        ],
      ),
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
                        borderRadius: BorderRadius.circular(10), // Match the container's border radius
                        child: Image.asset(
                          'assets/logotwo.jpg', // Provide the path to your image asset
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                    )


                  ],
                ),
              ),
        
              Text(
                _getGreetingMessage(),
                style: TextStyle(
                  fontFamily: 'MyCustomFont',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              SizedBox(height: 5),
              Text(
                'Book Your Tickets Now!!',
                style: TextStyle(fontSize: 18, color: AppColors.textColor2),
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
              SizedBox(height: 10,),


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
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AirplaneTicket()));
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
        
              //Flight ticket view
        
              SizedBox(height: 10),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               padding: EdgeInsets.only(left: 20),
               child: Row(
                 children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket,)).toList(),
               ),

             ),
        
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hotels',
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
              SizedBox(height: 10),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList()
               ),
             )
        
            ],
          ),
        ),
      ),
    );
  }
}
