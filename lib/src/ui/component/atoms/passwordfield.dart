import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:baseflutter/src/constant/dimens.dart';

// ignore: must_be_immutable
class PasswordFieldComponent extends StatefulWidget {
  var label, controller,hint, border, warna, ukuran, onTap, value, iconKiri, keyboard, maxLine, inputFormatter;

  PasswordFieldComponent({Key key,
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
  _PasswordFieldComponentState createState() => _PasswordFieldComponentState();
}

class _PasswordFieldComponentState extends State<PasswordFieldComponent> {

  bool _obscureText = true;
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
      obscureText: _obscureText,
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboard,
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
          ),
          suffixIcon: GestureDetector(
            dragStartBehavior: DragStartBehavior.down,
            onTap: (){
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          )
      ),
    );
  }
}