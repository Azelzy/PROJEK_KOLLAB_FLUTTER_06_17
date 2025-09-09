import 'package:flutter/material.dart';
import 'brutalist_textfield.dart';

class BrutalistPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;

  const BrutalistPasswordField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  State<BrutalistPasswordField> createState() => _BrutalistPasswordFieldState();
}

class _BrutalistPasswordFieldState extends State<BrutalistPasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return BrutalistTextField(
      label: "PASSWORD",
      controller: widget.controller,
      hint: widget.hint,
      obscureText: !_isVisible,
      suffix: Container(
        margin: const EdgeInsets.all(4),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: _isVisible ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => setState(() => _isVisible = !_isVisible),
            child: Icon(
              _isVisible ? Icons.visibility_off : Icons.visibility,
              color: _isVisible ? Colors.white : Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
