import 'package:flutter/material.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/dimens.dart';

// ignore: must_be_immutable
class LabelComponent extends StatelessWidget {
  var label = 'Lorem Ipsum', warna = AppColors.Biru_Font, ukuran = Dimens.Level_2, ketebalan  = FontWeight.normal, jenis = FontStyle.normal;

  LabelComponent({Key key, this.label, this.warna, this.ukuran, this.ketebalan, this.jenis}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: ukuran,
        fontWeight: ketebalan,
        fontStyle: jenis,
        color: warna
      ),
    );
  }
}