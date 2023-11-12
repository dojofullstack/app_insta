import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

var logger = Logger();

void main() {
  logger.i('Este es un mensaje informativo');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}


class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web'),
      ),
      body: const WebView(
        initialUrl: 'https://dojofullstack.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Bienvenido a Rappi Pedidos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Pide todo lo que quieras al instante',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebViewApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              ),
              child: Text(
                'Empezar hoy!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 100), // Adjust the height to position the button
        ],
      ),
    );
  }
}
