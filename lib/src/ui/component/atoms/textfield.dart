import 'package:flutter/material.dart';
import 'dart:async';

import 'package:baseflutter/src/constant/dimens.dart';

// ignore: must_be_immutable
class TextFieldComponent extends StatefulWidget {
  var label, controller,hint, border, warna, ukuran, onTap, value, iconKiri, keyboard, maxLine, inputFormatter;

  TextFieldComponent({Key key,
    this.label,
    this.controller,
    this.hint : "",
    this.border : InputBorder.none,
    this.warna : Colors.black,
    this.ukuran : Dimens.Level_2,
    this.onTap,
    this.value : '',
    this.iconKiri,
    this.keyboard : TextInputType.text,
    this.maxLine: 1,
    this.inputFormatter,
  }) : super(key: key);

  @override
  _TextFieldComponentState createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {

  @override
  void initState() {
    super.initState();
    print(widget.value);
    if(widget.value != '')
      {
        widget.controller = new TextEditingController();
        widget.controller.text = widget.value;
      }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTap: () => widget.onTap(),
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboard,
      maxLines: widget.maxLine,
      style: TextStyle(
          color: widget.warna,
          fontFamily: 'SFUIDisplay',

      ),
      decoration: InputDecoration(
          prefix: widget.iconKiri,
          border: widget.border,
          hintText: widget.hint,
          labelStyle: TextStyle(
              fontSize: widget.ukuran
          )
      ),
    );
  }
}