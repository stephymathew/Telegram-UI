import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import your chat and login screens here
import 'package:telegram_project/screens/chat.dart';
import 'package:telegram_project/screens/login.dart';

final List<String> images = [
  'assets/image/download.jpeg',
  'assets/image/image 1.webp',
  'assets/image/image 2.webp',
  'assets/image/image 3.jpg',
  'assets/image/image 4.jpg',
  'assets/image/image 5.webp',
  'assets/image/image 6.webp',
  'assets/image/image 7.jpg',
  'assets/image/image 8.jpg',
  'assets/image/image 9.jpeg',
  'assets/image/image 11.jpeg',
];

final List<String> names = [
  'CINEMA COMPANY',
  'cinema koottu',
  'MALAYALAM ONLY',
  'BLOCKBUSTER',
  'CINEMA VS CINEMA',
  'MOLLYWOOD',
  'MALA   YA  LA  M',
  'CINEMA KOOTTU', // Add a comma here
  'FILMS',
  'CINEMAS',
  'MALAYALAM VS MALAYALAM',
];

final List<String> subnames = [
  'Harisree Ashogan comedy film full of fun(meeshamadhavan',
  'Aju Vargise film (oru vadakkan selfie)',
  'sreenivasan film (kadha thudarumbol)',
  'agathi film (kilukkam kilukilukkam)',
  'agadeesh film appukkuttan character(in gost house)',
  'kuthiravvatm pappu film (theenmavin kombath)',
  'Darmajan film (kattapanele rithik roshan)',
  'dashamoolam film chamattinadu',
  'FILMS',
  'CINEMAS',
  'MALAYALAM VS MALAYALAM',
];

final List<String> times = [
  '10:30',
  '12:38',
  '11:56',
  '6:30',
  '5:45',
  '3:44',
  '2:46',
  '1:30',
  '8:20',
  '7:07',
  '2:45',
];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Telegram'),
        actions: [
          const Icon(Icons.search),
          TextButton.icon(
            onPressed: () {
              dialogView(context);
            },
            icon: const Icon(Icons.logout, color: Colors.black),
            label: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  index: index,
                ),
              ),
            );
          },
          leading: CircleAvatar(
            backgroundImage: AssetImage(images[index]),
          ),
          title: Text(names[index]),
          subtitle: Text(subnames[index]),
          trailing: Text(times[index]),
        ),
        separatorBuilder: (context, index) => const Divider(endIndent: 10),
        itemCount: names.length,
      ),
    );
  }
}

void dialogView(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.clear();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false,
            );
          },
          child: const Text('Logout'),
        )
      ],
    ),
  );
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
