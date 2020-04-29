import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baseflutter/src/ui/component/molecules/utils/chip_button_home.dart';
import 'package:baseflutter/src/ui/component/atoms/label.dart';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/dimens.dart';
import 'package:like_button/like_button.dart';
import 'package:baseflutter/src/ui/component/atoms/chip_user.dart';

// ignore: must_be_immutable
class CardBerita extends StatelessWidget {
  var label, warna, IsiCard, id_card, borderRadius, margin_side, margin_updown, showButton, namaUser, avatarUser, statusUser, warnaStatus;

  CardBerita({Key key, this.label, this.warna, this.IsiCard = false, this.id_card, this.borderRadius : const Radius.circular(Dimens.Level_1), this.margin_side : Dimens.Level_3, this.margin_updown : Dimens.Level_1, this.showButton : true, this.namaUser : "Lorem", this.avatarUser : "", this.statusUser : "Progress", this.warnaStatus : AppColors.Hijau}) : super(key: key);

  Widget _buildIsiCard()
  {
    if(IsiCard == false)
      {
        return Container(
            margin: EdgeInsets.all(Dimens.Level_half),
            alignment: Alignment.centerLeft,
            child : LabelComponent(label :'Lorem Ipsum Dolor', warna: AppColors.AbuAbu_Font,ukuran: Dimens.Level_1_half));
      }
    else
      {
        return IsiCard;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left : margin_side, right: margin_side, top: margin_updown, bottom: margin_updown),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.Putih,
          borderRadius: new BorderRadius.all(borderRadius),
        ),
        padding: EdgeInsets.all(Dimens.Level_1),
        child: Column(
          children: [
            Container(
              child: ChipUser(
                namaUser: namaUser,
                statusUser: statusUser,
                warnaStatusUser: warnaStatus,
                avatarUser: avatarUser,
                ketCard: false,
              ),
            ),
            Container(
              margin: EdgeInsets.all(Dimens.Level_1),
              child: _buildIsiCard(),
            ),
            Container(
              child: Visibility(
                visible: showButton,
                child: ChipButtonHome(warna_like: AppColors.Hijau,warna_komen: AppColors.Hijau, id_card : id_card),
              ),
            ),
          ],
        ),
      ),
    );
  }
}