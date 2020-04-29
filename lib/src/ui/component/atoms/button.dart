import 'package:flutter/material.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/dimens.dart';

// ignore: must_be_immutable
class ButtonComponent extends StatelessWidget {
  var label, onPress,contexts, warna, warna_font;
  double min_lebar;

  ButtonComponent({Key key, this.label, this.onPress, this.contexts, this.warna : AppColors.Hijau, this.warna_font : AppColors.Putih, this.min_lebar : 400}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPress(contexts),//since this is only a UI app
      child: Text(label,
        style: TextStyle(
          fontSize: Dimens.Level_2,
          fontFamily: 'SFUIDisplay',
          fontWeight: FontWeight.bold,
        ),
      ),
      color: warna,
      elevation: 0,
      minWidth: min_lebar,
      height: 50,
      textColor: warna_font,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.Level_2)
      ),
    );
  }
}