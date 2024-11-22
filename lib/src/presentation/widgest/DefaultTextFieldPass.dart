import 'package:flutter/material.dart';

class DefaultTextFieldPass extends StatefulWidget {
  String label;
  String? initialValue;
  String? errorText;
  TextInputType? textInputType;
  IconData icon;
  Color? color;
  Function(String text) onChanged;
  String? Function(String?)? validator;
  bool obscureText;

  DefaultTextFieldPass({
    Key? key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.errorText,
    this.validator,
    this.obscureText = false,
    this.initialValue,
    this.color = Colors.white,
    textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  _DefaultTextFieldPassState createState() => _DefaultTextFieldPassState();
}

class _DefaultTextFieldPassState extends State<DefaultTextFieldPass> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText; // Inicializamos con el valor recibido
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      initialValue: widget.initialValue,
      onChanged: (text) {
        widget.onChanged(text);
      },
      keyboardType: widget.textInputType,
      validator: widget.validator,
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: TextStyle(color: widget.color),
        ),
        errorText: widget.errorText,
        prefixIcon: Icon(
          widget.icon,
          color: widget.color,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: widget.color,
          ),
        ),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: widget.color!)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: widget.color!)),
      ),
      style: TextStyle(color: widget.color),
    );
  }
}
