import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsTicket extends StatefulWidget {
  @override
  _EventsTicketState createState() => _EventsTicketState();
}

class _EventsTicketState extends State<EventsTicket> {
  TextEditingController _ticketPriceController = TextEditingController();
  String? selectedCurrency;

  @override
  void dispose() {
    _ticketPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ticket.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Set your',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  ' Event Ticket ',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF8C54B8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'details',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  TextField(
                    controller: _ticketPriceController,
                    decoration: const InputDecoration(
                      labelText: 'Enter ticket price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: selectedCurrency,
                    items: ['USD', 'EUR', 'PKR', 'INR']
                        .map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(currency),
                            ))
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: 'Select currency',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedCurrency = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_ticketPriceController.text.isNotEmpty &&
                    selectedCurrency != null) {
                  // Handle ticket details
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ticket has been generated.'),
                    ),
                  );
                  print(
                      "Ticket Price: \${_ticketPriceController.text} \${selectedCurrency}");
                  _generateEventTicket();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter ticket price and currency.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(180, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: const Color(0xFF8C54B8),
              ),
              child: Text(
                'Generate Ticket',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _generateEventTicket() {
    Navigator.pop(context);
  }
}
