import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Personal Card',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 12, 202, 98)),
      ),
      home: const MyHomePage(title: "My Personal Card"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool editMode = false;
  Icon editModeIcon = Icon(Icons.edit);

  void _changeMode() {
    setState(() 
    {
      editMode = !editMode;
      if(editMode) {
        editModeIcon = Icon(Icons.save);
      } else {
        editModeIcon = Icon(Icons.edit);
      }
      }
    );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: 
                const Image(
                        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        ),
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: 
                TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  enabled: editMode,
            )
            )
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child:
                TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fun Fact',
                  enabled: editMode
                  ),
                )
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child:
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Favorite Color',
                      enabled: editMode,
                  )
                  )
                )
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeMode();
        },
        child: editModeIcon,
      ),
    );
  }
}
