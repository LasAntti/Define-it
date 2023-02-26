// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:define_it/http/get_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

const String _baseUrl = 'https://wordsapiv1.p.rapidapi.com/words/';
const _random = '?random=true';
String? finalWord;
String? results;
String? definition; 

//WordsAPI keys here
final _headers = {
        'X-RapidAPI-Key': '',
        'X-RapidAPI-Host': ''
      };

class GetWords extends StatefulWidget {
  const GetWords({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GetWordsState();
  }
}

class _GetWordsState extends State<GetWords> {
  final _client = http.Client();
  final _storeWords = Hive.box('storedWords');
  bool _isListening = false;
  var _speech = stt.SpeechToText();

  @override
  void initState() {
    getRandomWord();
    _speech = stt.SpeechToText();
    super.initState();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            results = val.recognizedWords;
            print(results);
            _speech.stop();
            _isListening = false;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  Future<dynamic> getRandomWord() async {
    try {
      var url = Uri.parse(_baseUrl + _random);
      
      var response = await _client.get(url, headers: _headers);

      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> wordData = jsonDecode(response.body);
          finalWord = wordData['word'];
          definition = wordData['results'][0]['definition'];
        });
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on NoSuchMethodError catch (e) {
      print(e);
      setState(() {
        definition = 'No definition found';
      });
    }
  }

  Future<dynamic> getWord(String condition) async {
    try {
      var url = Uri.parse(_baseUrl + condition);
      var response = await _client.get(url, headers: _headers);

      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> wordData = jsonDecode(response.body);
          finalWord = wordData['word'];
          definition = wordData['results'][0]['definition'];
          print(finalWord);
          print(definition);
        });
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on NoSuchMethodError catch (e) {
      print(e);
      setState(() {
        definition = 'No definition found';
      });
    }
  }

  Future<void> _launchURL(String artistLink) async {
  final Uri uri = Uri(scheme: 'https',  host: 'unsplash.com', path: artistLink);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw "Could not launch $uri";
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'See Random Words',
        ),
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.cyanAccent,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      ),
      body: Stack(
        children: <Widget>[
          // ignore: prefer_const_constructors
          GetImage(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    style: const TextStyle(color: Colors.white70),
                    text: "Photo by $artist, at Unsplash",
                    recognizer: TapGestureRecognizer()
                      ..onTap = ()  {
                        _launchURL(artistLink);
                      }),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    getRandomWord(),
                  },
                  child: const Text('Refresh random word'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      _storeWords
                          .add("${finalWord!.toUpperCase()}: ${definition!}"),
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Word saved!'),
                        ),
                      ),
                    },
                    child: const Text('Save this word'),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => {
                    _listen(),
                    Future.delayed(const Duration(seconds: 4), () {
                      getWord(results.toString());
                    }),
                  },
                  child: Icon(
                    _isListening ? Icons.mic_rounded : Icons.mic_off_rounded,),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Search a specific word',
                  ),
                  onFieldSubmitted: (value) => getWord(value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
