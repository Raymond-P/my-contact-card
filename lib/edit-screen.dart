import 'package:flutter/material.dart';

class MyEditPage extends StatefulWidget
{
    const MyEditPage({super.key, required this.title});
    final String title;

    @override
    State<MyEditPage> createState() => _MyEditPageState();
}

class _MyEditPageState extends State<MyEditPage>
{

    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
                ),
            body: Center(
                child: Column(
                    children:[
                        const Image(
  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
),
Row(children: [
    Text("Name:"),

],)
                    ]
                )
                )
            );
    }
}