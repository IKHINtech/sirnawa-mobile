import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String value;
  final TextEditingController? controller;
  final Function(String? newValue)? saveCallBack;
  final Function(String? value)? validatorFunction;
  final Function(String? value)? onChanged;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final bool? obscure;
  final bool isEmpty;
  final bool isNumber;
  final bool enable;
  final int? maxLines;
  final int? maxLength;
  final bool require;
  final bool isPassword;

  const CustomTextField({
    super.key,
    this.textInputAction,
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.saveCallBack,
    this.validatorFunction,
    this.suffixIcon,
    this.obscure,
    this.maxLines,
    this.isEmpty = true,
    this.isNumber = false,
    this.enable = true,
    this.maxLength,
    this.helperText,
    required this.value,
    this.require = true,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      onChanged: onChanged,
      enabled: enable,
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      initialValue: controller == null ? value : null,
      obscureText: isPassword ? true : (obscure ?? false),
      maxLines: maxLines,
      decoration: InputDecoration(
        // filled: true,
        //     fillColor: Colors.grey[100],
        helperText: helperText,
        suffixIcon: suffixIcon,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        labelText: labelText,
        hintText: hintText,
      ),
      validator: (String? val) {
        if (validatorFunction == null) {
          if (require && val != null && val.isEmpty) {
            return "$labelText harus diisi !";
          } else {
            return null;
          }
        } else {
          return validatorFunction!(val);
        }
      },
      onSaved: saveCallBack != null ? (value) => saveCallBack!(value) : null,
    );
  }
}


