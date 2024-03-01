import 'package:flutter/material.dart';
import 'package:travel_app/ticket_booking/widgets/ticket_view.dart';

class FilteredTicketScreen extends StatelessWidget {
  final List<Map<String, dynamic>> filteredTicketList;

  const FilteredTicketScreen({Key? key, required this.filteredTicketList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 20,top: 10),
        child: ListView.builder(
          itemCount: filteredTicketList.length,
          itemBuilder: (context, index) {
            final ticket = filteredTicketList[index];
            return GestureDetector(
              onTap: () {
                _showTicketBookedDialog(context);
              },
              child: TicketView(ticket: ticket),
            );
          },
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
