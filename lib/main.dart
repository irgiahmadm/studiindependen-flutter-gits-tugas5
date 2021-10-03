import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/contact_provider.dart';
import 'package:state_management_provider/widget/list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Contact List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactProvider>(
      create: (context) => ContactProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Consumer<ContactProvider>(
            builder: (context, contactProvider, _) => ListItem(
                contactList: contactProvider.contactList,
                contactProvider: contactProvider),
          ),
        ),
        /* floatingActionButton: FloatingActionButton(
          onPressed: ,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),  */
      ),
    );
  }
}
