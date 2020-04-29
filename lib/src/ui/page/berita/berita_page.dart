//login.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baseflutter/src/bloc/berita/berita_bloc.dart';
import 'package:baseflutter/src/bloc/berita/berita_event.dart';
import 'package:baseflutter/src/bloc/berita/berita_state.dart';
import 'package:baseflutter/src/model/berita_model.dart';
import 'package:baseflutter/src/route/base_router.gr.dart';
import 'package:baseflutter/src/ui/component/molecules/card/card_berita.dart';
import 'package:baseflutter/src/ui/component/molecules/utils/gridview_image.dart';
import 'package:baseflutter/src/ui/component/atoms/label.dart';
import 'package:baseflutter/src/ui/component/atoms/search_bar.dart';
import 'dart:async';
import 'package:baseflutter/src/constant/color.dart';
import 'package:baseflutter/src/constant/dimens.dart';

class BeritaPage extends StatefulWidget {
  BeritaPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {

  List<String> imagegrid = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxHU6gm0pIrZMoX0cJlHYP-lVTh0E976jvah6g5LwoEtopI6Cx",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxHU6gm0pIrZMoX0cJlHYP-lVTh0E976jvah6g5LwoEtopI6Cx",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxHU6gm0pIrZMoX0cJlHYP-lVTh0E976jvah6g5LwoEtopI6Cx",
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BeritaBloc>(context).add(
      Fetch(),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.Biru_backgroundUtama,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left : Dimens.Level_4, top: Dimens.Level_2, bottom: Dimens.Level_2, right: Dimens.Level_4),
                  child: SearchBarComponent(),
                ),

                Container(
                  child: BlocBuilder<BeritaBloc, BeritaState>(
                    builder: (context, state)
                    {
                      if(state is BeritaLoading)
                        {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: Dimens.Level_40,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                      else if(state is BeritaSuccess)
                        {
                          if(state.beritaModel.toJson().isEmpty)
                            {
                              return Center(
                                child: Text('no posts'),
                              );
                            }
                          else
                            {
                              List<Data> data = state.beritaModel.data;
                              print(data[0].isi_berita);
                              return Column(
                                children: List.generate(data.length, (index){
                                  return Container(
                                    child: CardBerita(
                                      namaUser: data[index].pengirim,
                                      avatarUser: data[index].avatar,
                                      statusUser: data[index].status,
                                      id_card : data[index].id,
                                      IsiCard: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(Dimens.Level_half),
                                              alignment: Alignment.centerLeft,
                                              child: LabelComponent(label :data[index].isi_berita, warna: AppColors.AbuAbu_Font,ukuran: Dimens.Level_1_half),
                                            ),
                                            GridViewImage(
                                                data_images: data[index].foto,
                                                judul: data[index].pengirim,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }
                        }

                      else
                        {
                          return Container();
                        }

                    },

                  ),
                ),


              ],
            ),
          ),
      );
  }

}


