import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? inputType;

  InputWidget({
    Key? key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        label: Text(label),
      ),
      controller: controller,
      validator: (value) {
        if (isEmpty(value)) return 'Please enter some text';
        return null;
      },
    );
  }

  bool isEmpty(String? value) => value == null || value.isEmpty;
}
