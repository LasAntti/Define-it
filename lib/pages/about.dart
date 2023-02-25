
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About',
        ),
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyanAccent,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'About',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'This app is a dictionary app that allows you to search for words, and see their definitions. It also allows you to save words to your favorites list. You can get a random word by pressing the "Get random word" button. You can also search for a specific word by typing it in the search bar, on the bottom of the word-page. Lastly you can use the microphone button to search for a word by saying it.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'This app stores your favorites list in your device using Hive. This means that your favorites list will be saved even if you close the app.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'This app was created by Antti Lassila, a second-year student at the time of this assignment (February 2023), as a small project/final assignment for the course "Web- and Hybrid Technologies in Mobile Programming" at Oulu University Of Applied Sciences. ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}