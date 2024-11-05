import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldsWidget extends StatefulWidget {
  String fieldText;
  TextEditingController textController;
  IconData? fieldIcon;
  bool hideText;
  TextInputType keyboardType;
  TextFieldsWidget({
    required this.fieldText,
    required this.textController,
    required this.keyboardType,
    required this.hideText,
    this.fieldIcon,
  });

  @override
  State<TextFieldsWidget> createState() => _TextFieldsWidgetState();
}

class _TextFieldsWidgetState extends State<TextFieldsWidget> {
  IconData? fieldIcon2;

  Color? iconColor;

  String? fieldHintText, fieldPrefixText;

  bool ispasswordNotVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      cursorColor: Theme.of(context).colorScheme.primary,
      enableSuggestions: true,
      spellCheckConfiguration: SpellCheckConfiguration(
        spellCheckService: DefaultSpellCheckService(),
      ),
      keyboardType: widget.keyboardType,
      autocorrect: true,
      obscureText: widget.fieldText == 'Password' ||
              widget.fieldText == 'Confirm Password'
          ? ispasswordNotVisible
          : widget.hideText,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.onPrimary,
        focusColor: Theme.of(context).colorScheme.primary,
        hoverColor: Theme.of(context).colorScheme.primary,
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        suffixIcon: widget.fieldText == 'Password' ||
                widget.fieldText == 'Confirm Password'
            ? IconButton(
                onPressed: () {
                  setState(() {
                    ispasswordNotVisible = !ispasswordNotVisible;
                  });
                },
                color: ispasswordNotVisible
                    ? iconColor
                    : Theme.of(context).colorScheme.onPrimary,
                icon: Icon(
                  ispasswordNotVisible ? widget.fieldIcon : Icons.visibility,
                ),
              )
            : Icon(widget.fieldIcon),
        label: Text(widget.fieldText),
        //hintText: fieldHintText,
        prefixText: fieldPrefixText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
