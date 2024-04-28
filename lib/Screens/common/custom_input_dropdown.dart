import 'package:flutter/material.dart';

class CustomInputDroopdown extends StatefulWidget {
  final String labelText;
  final List<DropdownMenuItem<String>> items;
  final String? initialValue;
  final String? errorText;
    final String? Function(String?)? validator;
  final void Function(String?) onChanged;

  const CustomInputDroopdown({
    super.key,
    required this.labelText,
    required this.items,
    this.initialValue,
    this.errorText,
    this.validator,
    required this.onChanged,
  });

  @override
  State<CustomInputDroopdown> createState() => _CustomInputDroopdownState();
}

class _CustomInputDroopdownState extends State<CustomInputDroopdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.labelText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
        DropdownButtonFormField<String>(
          value: _selectedValue,
          items: widget.items,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            widget.onChanged(value);
          },
          decoration: InputDecoration(
            errorText: widget.errorText,
          ),
                validator: widget.validator,
        ),
      ],
    ),
    );
  }
}