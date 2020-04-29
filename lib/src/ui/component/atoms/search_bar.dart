import 'package:flutter/material.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/dimens.dart';

// ignore: must_be_immutable
class SearchBarComponent extends StatelessWidget {
  var label, warna;

  SearchBarComponent({Key key, this.label, this.warna}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:Dimens.Level_1_half, right: Dimens.Level_1_half),
      decoration: BoxDecoration(
        color: AppColors.Putih,
        borderRadius: new BorderRadius.all(const Radius.circular(Dimens.Level_2)),
      ),
      child: TextFormField(
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'SFUIDisplay'
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: new Icon(Icons.search),
        ),
      ),
    );
  }
}