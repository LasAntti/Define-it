import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'get_word.dart';

const String baseUrl = 'https://api.unsplash.com/photos/random';
String? image;
String? artist;
String artistLink = 'www.unsplash.com';
late bool _isLoading;

// Unsplash key here
final _authorization = {
      'Authorization': 'Client-ID ',
    };

class GetImage extends StatefulWidget {
  const GetImage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GetImageState();
  }
}

class _GetImageState extends State<GetImage> {
  var client = http.Client();

  Future<dynamic> getRandomPhoto() async {
    var url = Uri.parse(baseUrl);
    var response = await client.get(url, headers: _authorization);

    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> imageData = jsonDecode(response.body);
        image = imageData['urls']['full']; 
        artist = imageData['user']['name'];
        artistLink = imageData['user']['links']['html'];
        artistLink = artistLink.split('.com/')[1];
      });
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    _isLoading = true;
    getRandomPhoto();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Align(
            alignment: const Alignment(0.0, -0.7),
            child: Container(
              child: _isLoading
                  ? const Text('')
                  : Text(
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        backgroundColor: Colors.black.withOpacity(0.2),
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        //backgroundColor: Colors.grey,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                      finalWord.toString()),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.1),
            child: Center(
              child: _isLoading
                  ? const Text('')
                  : Text(
                      style: TextStyle(
                        fontSize: 22,
                        backgroundColor: Colors.black.withOpacity(0.2),
                        fontStyle: FontStyle.italic,
                        //backgroundColor: Colors.grey,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      definition.toString()
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}
