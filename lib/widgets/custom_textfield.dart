import 'package:flutter/material.dart';
import 'package:human_resources/widgets/export.dart';



class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key key,
      this.controller,
      this.enabled = true,
      this.autoFocus = false,
      this.inputType,
      this.inputAction,
      this.focusNode,
      this.maxLength,
      this.maxLines,
      this.labelText,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.hintText,
      this.fillColor,
      this.prefixIcon,
      this.titleColor,
      this.image,
      this.title,
      this.height,
      this.minLines,
      this.keyboardType,
      this.suffixText,
      this.obscure})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FocusNode focusNode;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final double height;
  final bool obscure;
  final Color titleColor, fillColor;
  final bool autoFocus;
  final String labelText, title;
  final String suffixText;
  final keyboardType;
  final String hintText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Widget image;
  final String Function(String) validator;
  final Function onChanged;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure;

  @override
  void initState() {
    obscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   children: [
        //     CustomText(
        //       widget.title,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 14,
        //       color: widget.titleColor ?? Styles.colorBlack.withOpacity(0.8),
        //     ),
        //   ],
        // ),
        // verticalSpaceTiny,
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            keyboardType: widget.inputType,
            controller: widget.controller,
            textInputAction: widget.inputAction,
            autofocus: widget.autoFocus,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            obscureText: obscure ?? false,
            cursorColor: Colors.black,
            style: TextStyle(
                color: Styles.colorBlack,
                fontSize: screenAwareSize(16, context, width: true),
                fontFamily: 'Brandon'),
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              suffixText: widget.suffixText,
              suffixStyle: TextStyle(
                color: Colors.red,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              labelText: widget.labelText,
              fillColor: widget.fillColor ?? Styles.colorGrey.withOpacity(0.15),
              filled: true,
              hintStyle: TextStyle(
                  color: Styles.colorBlack.withOpacity(0.2),
                  fontSize: screenAwareSize(14, context, width: true),
                  fontFamily: 'Brandon'),
              hintText: widget.hintText,
              labelStyle: TextStyle(
                  color: Styles.red,
                  fontSize: screenAwareSize(14, context, width: true),
                  fontFamily: 'Brandon'),
              errorStyle: const TextStyle(color: Color(0xff222222)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffFAFAFA), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffFAFAFA), width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffFAFAFA), width: 1),
              ),
              counterText: '',
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ?? obscure == null
                  ? null
                  : widget.image ??
                      IconButton(
                        icon: obscure
                            ? Icon(Icons.visibility_off,
                                color: Styles.colorBlack.withOpacity(0.3))
                            : Icon(Icons.visibility,
                                color: Styles.colorBlack.withOpacity(0.5)),
                        onPressed: () {
                          setState(
                            () {
                              obscure = !obscure;
                            },
                          );
                        },
                      ),
            ),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
