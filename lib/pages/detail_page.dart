import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../contact/contact.dart';
import '../provider/contact_provider.dart';
import '../widget/input_widget.dart';

class DetailPage extends StatefulWidget {
  final Contact? contact;
  final int index;

  DetailPage({Key? key, this.contact, this.index = -1}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.contact?.name ?? "";
    _phoneController.text = widget.contact?.phoneNumber ?? "";
    _addressController.text = widget.contact?.address ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.index == -1 ? 'Add Contact' : 'Edit Contact',
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            InputWidget(label: 'Name', controller: _nameController),
            InputWidget(
              label: 'Phone Number',
              controller: _phoneController,
              inputType: TextInputType.number,
            ),
            InputWidget(label: 'Address', controller: _addressController),
            SizedBox(height: 15),
            Consumer<ContactProvider>(
              builder: (context, contactProvider, _) => ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    showSnackBar('Please Fill All Form!');
                    return;
                  }
                  if (widget.index == -1) {
                    contactProvider.addContact = Contact(
                      _nameController.text,
                      _phoneController.text,
                      _addressController.text,
                    );
                    showSnackBar('Success Add Contact');
                  } else {
                    contactProvider.editContact(
                      widget.index,
                      Contact(
                        _nameController.text,
                        _phoneController.text,
                        _addressController.text,
                      ),
                    );
                    showSnackBar('Success Edit Contact');
                  }
                  Navigator.of(context).pop();
                },
                child: Text(
                  widget.index == -1 ? 'Add Contact' : 'Edit Contact',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
          label: "Close",
          onPressed: () {},
        ),
      ),
    );
  }
}
