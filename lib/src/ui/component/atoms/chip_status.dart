import 'package:flutter/material.dart';
import 'package:baseflutter/src/ui/component/atoms/label.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/dimens.dart';

// ignore: must_be_immutable
class ChipStatus extends StatelessWidget {
  var label, warna, warna_font;

  ChipStatus({Key key, this.label = 'Progress', this.warna : AppColors.Hijau, this.warna_font : AppColors.Putih}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: warna,
        borderRadius: new BorderRadius.all(const Radius.circular(Dimens.Level_1)),
      ),
      padding: EdgeInsets.all(Dimens.Level_1),
      child: LabelComponent(label: label,warna: warna_font,ukuran: Dimens.Level_1_half),
    );
  }
}