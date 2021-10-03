import 'package:flutter/material.dart';
import 'package:state_management_provider/contact/contact.dart';
import 'package:state_management_provider/provider/contact_provider.dart';

class ListItem extends StatefulWidget {
  const ListItem(
      {Key? key, required this.contactList, required this.contactProvider})
      : super(key: key);

  final List<Contact> contactList;
  final ContactProvider contactProvider;
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: CircleAvatar(
          radius: 50,
          child: FittedBox(
            child: Text(widget.contactList[index].name.split(" ").length > 2
                ? '${widget.contactList[index].name.substring(0, 1).toUpperCase()}'
                    '${widget.contactList[index].name.substring(1, 2).toUpperCase()}'
                : '${widget.contactList[index].name.substring(0, 1).toUpperCase()}'),
          ),
        ),
        title: Text(widget.contactList[index].name),
        subtitle: Text('${widget.contactList[index].phoneNumber}'),
        trailing: IconButton(
          icon: new Icon(Icons.delete),
          onPressed: () {
            widget.contactProvider.deleteContact = widget.contactList[index];
          },
        ),
      ),
      itemCount: widget.contactList.length,
    );
  }
}