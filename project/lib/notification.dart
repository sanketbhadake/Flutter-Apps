// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NotificatonPage extends StatefulWidget {
//   const NotificatonPage({super.key});

//   @override
//   State<NotificatonPage> createState() => _NotificatonPageState();
// }

// class _NotificatonPageState extends State<NotificatonPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Notification',
//           style: GoogleFonts.inter(fontSize: 25),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_rounded),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project/profile.dart';

class NotificatonPage extends StatefulWidget {
  const NotificatonPage({super.key});

  @override
  _NotificatonPageState createState() => _NotificatonPageState();
}

class _NotificatonPageState extends State<NotificatonPage> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: ListTile(
              title: const Text(
                'WhatsApp Messages',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                'Get updates from us on WhatsApp',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              trailing: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeColor: Color.fromRGBO(254, 114, 76, 1),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
