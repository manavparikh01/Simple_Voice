import 'package:flutter/material.dart';

import 'package:avatar_glow/avatar_glow.dart';
//import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Command',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VoiceApp(),
    );
  }
}

class VoiceApp extends StatefulWidget {
  @override
  _VoiceAppState createState() => _VoiceAppState();
}

class _VoiceAppState extends State<VoiceApp> {
  //final Map<String, HighlightedWord> _highlights = {
  //'wave': HighlightedWord(
  //onTap: () => print('wave'),
  //textStyle: const TextStyle(
  //color: Colors.blue,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'one': HighlightedWord(
  //onTap: () => print('one'),
  //textStyle: const TextStyle(
  //color: Colors.green,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'two': HighlightedWord(
  //onTap: () => print('two'),
  //textStyle: const TextStyle(
  //color: Colors.red,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'three': HighlightedWord(
  //onTap: () => print('three'),
  //textStyle: const TextStyle(
  //color: Colors.blueAccent,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'four': HighlightedWord(
  //onTap: () => print('four'),
  //textStyle: const TextStyle(
  //color: Colors.greenAccent,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'five': HighlightedWord(
  //onTap: () => print('five'),
  //textStyle: const TextStyle(
  //color: Colors.yellow,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'hold': HighlightedWord(
  //onTap: () => print('hold'),
  //textStyle: const TextStyle(
  //color: Colors.orange,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'release': HighlightedWord(
  //onTap: () => print('release'),
  //textStyle: const TextStyle(
  //color: Colors.pink,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'rock': HighlightedWord(
  //onTap: () => print('rock'),
  //textStyle: const TextStyle(
  //color: Colors.purple,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //'cuss': HighlightedWord(
  //onTap: () => print('cuss'),
  //textStyle: const TextStyle(
  //color: Colors.deepOrange,
  //fontWeight: FontWeight.bold,
  //),
  //),
  //};

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';

  @override
  void initState() {
    _speech = stt.SpeechToText();
    super.initState();
  }

  //var _isThetext = false;

  //bool _isTheText = if (_text.toLowerCase() == 'wave' || '1' || '2' || '3' || '4' || '5' || 'hold' || 'release' || 'rock' || 'cuss') {}

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      title: Text('VoiceApp'),
    );
    return Scaffold(
        appBar: appBar,
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.8,
              //margin: EdgeInsets.all(30),
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
              //decoration: BoxDecoration(
              //border: Border.all(
              //width: 1,
              //color: Theme.of(context).primaryColor,
              //),
              /////////////////////////////////////////////////////
              //child: TextHighlight(
              //textAlign: TextAlign.center,
              //text: _text,
              //words: _highlights,
              //textStyle: const TextStyle(
              //fontSize: 32.0,
              //color: Colors.black,
              //fontWeight: FontWeight.w400,
              //),
              child: Text(
                (_text.toLowerCase() == 'wave' ||
                        _text.toLowerCase() == '1' ||
                        _text.toLowerCase() == '2' ||
                        _text.toLowerCase() == '3' ||
                        _text.toLowerCase() == '4' ||
                        _text.toLowerCase() == '5' ||
                        _text.toLowerCase() == 'hold' ||
                        _text.toLowerCase() == 'release' ||
                        _text.toLowerCase() == 'rock' ||
                        _text.toLowerCase() == 'cuss')
                    ? _text.toUpperCase()
                    : _text,
                style: TextStyle(
                  fontSize: 32,
                  color: (_text.toLowerCase() == 'wave' ||
                          _text.toLowerCase() == '1' ||
                          _text.toLowerCase() == '2' ||
                          _text.toLowerCase() == '3' ||
                          _text.toLowerCase() == '4' ||
                          _text.toLowerCase() == '5' ||
                          _text.toLowerCase() == 'hold' ||
                          _text.toLowerCase() == 'release' ||
                          _text.toLowerCase() == 'rock' ||
                          _text.toLowerCase() == 'cuss')
                      ? Colors.green
                      : Colors.black,
                  fontWeight: (_text.toLowerCase() == 'wave' ||
                          _text.toLowerCase() == '1' ||
                          _text.toLowerCase() == '2' ||
                          _text.toLowerCase() == '3' ||
                          _text.toLowerCase() == '4' ||
                          _text.toLowerCase() == '5' ||
                          _text.toLowerCase() == 'hold' ||
                          _text.toLowerCase() == 'release' ||
                          _text.toLowerCase() == 'rock' ||
                          _text.toLowerCase() == 'cuss')
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          endRadius: 75,
          glowColor: Theme.of(context).accentColor,
          duration: const Duration(milliseconds: 2500),
          repeatPauseDuration: const Duration(milliseconds: 50),
          repeat: true,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: _listen,
            child: _isListening
                ? Icon(
                    Icons.mic,
                    color: Theme.of(context).accentColor,
                  )
                : Icon(
                    Icons.mic_none,
                    color: Colors.white,
                  ),
          ),
        ));
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      setState(() => _isListening = true);
      if (available) {
        //setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            //if (val.hasConfidenceRating && val.confidence > 0) {
            //_confidence = val.confidence;
            //}
          }),
        );
      }
    } else {
      setState(() {
        _isListening = false;
        //_text = 'Just a sec';
      });
      _speech.stop();
    }
  }
}
