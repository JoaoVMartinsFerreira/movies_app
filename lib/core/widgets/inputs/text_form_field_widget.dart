import 'package:flutter/material.dart';
import 'package:movies_app/core/config/firebase_movies_app_colors.dart';
import 'package:movies_app/core/widgets/sized_box/sized_box_widget.dart';
import 'package:movies_app/core/widgets/texts/text_widget.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String inputLabel;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final bool isPassword;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmited;
  final ValueNotifier<bool> _isPasswordVN;

  TextFormFieldWidget({
    super.key,
    required this.inputLabel,
    required this.controller,
    this.validator,
    required this.focusNode,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.onSubmited,
  }) : _isPasswordVN =
            ValueNotifier<bool>(isPassword); // para saber se é true ou false

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<TextFormFieldWidget> {
  bool hasFocus = false;
  @override
  void initState() {
    hasFocus = widget.focusNode.hasFocus;
    widget.focusNode.addListener(_onRequestFOcusChanges);
    super.initState();
  }

  void _onRequestFOcusChanges() {
    setState(() {
      hasFocus = widget.focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onRequestFOcusChanges);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.normal(widget.inputLabel),
        const SizedBoxWidget.xxs(),
        ValueListenableBuilder(
          // para ouvir as alterações do valueNotifier
          valueListenable: widget._isPasswordVN,
          builder: (_, bool isPasswordVNValue, __) {
            return TextFormField(
              textCapitalization: TextCapitalization.none,
              focusNode: widget.focusNode,
              controller: widget.controller,
              style: TextStyle(
                color: FirebaseMoviesAppColors.whiteColor,
                fontSize: 16,
              ),
              keyboardType: widget.textInputType,
              autocorrect: false,
              onFieldSubmitted: widget.onSubmited,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                filled: true,
                errorStyle: TextStyle(
                    color: FirebaseMoviesAppColors.errorColor, fontSize: 14),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: FirebaseMoviesAppColors.errorColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12)),
                fillColor: hasFocus
                    ? FirebaseMoviesAppColors.secondaryColor.withOpacity(.7)
                    : FirebaseMoviesAppColors.whiteColor.withOpacity(.3),
                suffix: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          widget._isPasswordVN.value = !isPasswordVNValue;
                        },
                        icon: Icon(
                          isPasswordVNValue
                              ? Icons.visibility_off
                              : Icons.visibility,
                              color: FirebaseMoviesAppColors.whiteColor,
                        ),
                      )
                    : null,    
              ),
              obscureText: isPasswordVNValue,
              validator: widget.validator,
            );
          },
        )
      ],
    );
  }
}
