import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String validate;
  // final Function? validate;
  final IconData? suffix;
  final String? hintText;
  final bool isPassword;
  final Function? suffixPressed;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.validate,
    this.suffix,
    this.hintText,
    this.isPassword = false,
    this.suffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return validate;
        }
        return null;
      },
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        label: Text(
          hintText!,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(18),
            topRight: Radius.circular(18),
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: (){
                  suffixPressed!();
                },
                icon: Icon(suffix),
              )
            : null
      ),
    );
  }
}
