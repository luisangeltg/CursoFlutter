import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? icon;
  final IconData? sufixIcon;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.sufixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: true,
      initialValue: "",
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null) return "Este campo es requerido";
        return value.length < 3 ? "Mínimo de 3 letras" : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: "3 caracteres",
        icon: icon == null ? null : Icon(icon),
        suffixIcon: sufixIcon == null ? null : Icon(sufixIcon),
        /*focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green)),        
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))*/
      ),
    );
  }
}
