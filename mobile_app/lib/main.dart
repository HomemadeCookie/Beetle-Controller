import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendPostRequest(String myString) async{
  final url = Uri.parse('http://localhost:3000/data');
  final body = jsonEncode({
    'direction': myString,
  });

  final headers = {'Content-Type': 'application/json'};

  final response = await http.post(
    url,
    body:body,
    headers:headers,
  );

}

void main() => runApp(
  MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Beetle Controller'),
        ),
        backgroundColor: Colors.blue[600],
      ),
      body:
      Center(
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              TextButton(
                child: Text('<'),
                onPressed: () {
                  sendPostRequest('left');
                },
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),
              TextButton(
                child: Text('>'),
                onPressed: () {
                  sendPostRequest('right');
                },
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),
            ]
          ),
      ),
    ),
  )
);


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Hello Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {

//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(

//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text(widget.title),
//       ),
//       body: Center(

//         child: Column(

//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), 
//     );
//   }
// }
