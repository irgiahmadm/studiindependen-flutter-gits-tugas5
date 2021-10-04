import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/contact_provider.dart';
import 'widget/list_item.dart';

import 'pages/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Contact List'),
      ),
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
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailPage(),
            ),
          );
        },
        tooltip: 'Add Contact',
        child: Icon(Icons.add),
      ),
    );
  }
}
