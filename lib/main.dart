import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
      home: const MyHomePage(title: "Your Special Personal Card"),
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
  Color currentColor = Color(0x0);
  Color pickerColor = Color(0x0);
  // TODO: Complete
  // final picker = ImagePicker();

  void _changeMode() {
    setState(() 
    {
      editMode = !editMode;
      if(editMode) {
        editModeIcon = Icon(Icons.check);
      } else {
        editModeIcon = Icon(Icons.edit);
        // ScaffoldMessenger.of(context).clearSnackBars();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: const Text('Saved Personal Card'),
        //     duration: const Duration(seconds: 3),
        //     behavior: .floating,
        //     )
        // );
      }
      }
    );
    }


  void _changeColor(Color color)
  {
    setState(() => pickerColor = color);
  }

  // Future<void> _changeImage() {
  //   setState(()
  //    async {
  //       final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //    });
  // }

  Future<void> _colorPickerDialogBuilder(BuildContext context)
  {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pick a color!"),
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: pickerColor,
              onColorChanged: _changeColor,
            ),
        ),
        actions: <Widget>[
          TextButton(
          child: const Text("OK"), 
          onPressed: () {
            setState(() => currentColor = pickerColor);
            Navigator.of(context).pop();
          })]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: pickerColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: 
                CircleAvatar(
                  foregroundImage: NetworkImage("https://thumb.wikimedia.org/wikipedia/commons/thumb/5/56/Bubo_bubo_sibiricus_-_01.JPG/250px-Bubo_bubo_sibiricus_-_01.JPG",),
                  radius: 80,
                  )
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
              TextButton(
                child: const Text("Choose your favorite color!"),
                onPressed:() => _colorPickerDialogBuilder(context),
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
