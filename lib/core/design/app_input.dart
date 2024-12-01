import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final bool obscureText ;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefix;
  final Widget? suffix;
  final bool? alignLabelWithHint;
  final String? labelText;
  final String? hintText;
  const AppInput({super.key, this.controller, this.validator, this.onTap, this.keyboardType,  this.obscureText=false, this.onFieldSubmitted, this.prefix, this.suffix, this.alignLabelWithHint, this.labelText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onTap: onTap,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          prefix: prefix,
          suffix: suffix,
          alignLabelWithHint: alignLabelWithHint,
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          hintText: hintText,
          hintStyle: TextStyle(color:Colors.orange),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(20)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(20)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    );
  }
}
