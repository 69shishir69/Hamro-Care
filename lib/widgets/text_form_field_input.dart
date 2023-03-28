import 'package:flutter/material.dart';

class TextFormFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final Icon prefixIcon;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final String validatorString;
  final Color fieldColor;
  final Color hintColor;
  // final Function? onTap;
  const TextFormFieldInput(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      required this.prefixIcon,
      this.isPass = false,
      // this.onTap = ,
      required this.textInputType,
      this.validatorString = "* required",
      this.fieldColor = Colors.white,
      this.hintColor = const Color.fromARGB(156, 152, 154, 156)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
    return TextFormField(
      // shadowColor: const Color.fromARGB(255, 240, 247, 255),
      controller: textEditingController,
      // focusNode: FocusNode(),
      decoration: InputDecoration(
          fillColor: fieldColor,
          prefixIcon: prefixIcon,
          // suffixIcon: IconButton(onPressed: onpressed, icon: const Icon(Icons.remove_red_eye_outlined)),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor, fontWeight: FontWeight.w500),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorString;
        }
        return null;
      },
      // onTap: onTap,
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
