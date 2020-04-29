import 'package:flutter/material.dart';
import 'package:baseflutter/src/ui/component/atoms/chip_status.dart';
import 'package:baseflutter/src/ui/component/atoms/label.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/dimens.dart';
import 'package:baseflutter/src/constant/string.dart';

// ignore: must_be_immutable
class ChipUser extends StatelessWidget {
  var namaUser,
      ketUser,
      statusUser,
      warnaStatusUser,
      avatarUser,
      ketCard,
      visibilityKet,
      warna_dasar,
      warnaFont_label1,
      wanraFont_label2,
      wanraFont_label3,
      ukuran_label1,
      ukuran_label2,
      ukuran_label3,
      tinggiFoto,
      lebarFoto,
      warna_pin,
      maxRadiusFoto,
      showLabel3,
      showLabel4,
  warna_font_label_status;

  ChipUser({Key key,
    this.avatarUser = Strings.dummy_image_avatar,
    this.namaUser = "Lorem Ipsum",
    this.ketUser = "Hari Ini",
    this.statusUser = "Progress",
    this.warnaStatusUser = AppColors.Hijau,
    this.ketCard = false,
    this.visibilityKet : true ,
    this.warna_dasar : AppColors.transparant,
    this.warnaFont_label1 : AppColors.Biru_Font,
    this.wanraFont_label2 : AppColors.AbuAbu_Font,
    this.wanraFont_label3 : AppColors.AbuAbu_Font,
    this.ukuran_label1 : Dimens.Level_2,
    this.ukuran_label2 : Dimens.Level_1_half,
    this.ukuran_label3 : Dimens.Level_1_half,
    this.tinggiFoto : Dimens.Level_8,
    this.lebarFoto : Dimens.Level_8,
    this.showLabel3 : false,
    this.maxRadiusFoto : Dimens.Level_3,
    this.warna_pin : AppColors.AbuAbu_Font,
    this.showLabel4 : false,
    this.warna_font_label_status : AppColors.Putih
  }) : super(key: key);

  Widget _buildKetCard()
  {
    if(ketCard == false)
    {
      return ChipStatus(
        label: statusUser,
        warna: warnaStatusUser,
        warna_font : warna_font_label_status,
      );
    }
    else
    {
      return ketCard;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: warna_dasar,
      padding: EdgeInsets.all(Dimens.Level_1),
      child: Row(
        children: [
          Wrap(
            children: [
              Container(
                margin: EdgeInsets.only(right: Dimens.Level_1),
                child: CircleAvatar(
                  maxRadius: maxRadiusFoto,
                  child: Image.network(avatarUser, width: lebarFoto,height: tinggiFoto),
                ),
              )
            ],
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  child: LabelComponent(label : namaUser, warna: warnaFont_label1, ukuran: ukuran_label1),
                  alignment: Alignment.topLeft,
                ),
                Container(

                  child: LabelComponent(label : ketUser, warna: wanraFont_label2, ukuran: ukuran_label2),
                  alignment: Alignment.topLeft,
                ),

              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildKetCard()
          ),
        ],
      ),
    );
  }
}