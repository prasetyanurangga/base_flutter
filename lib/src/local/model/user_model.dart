class UserModel {
  int id;
  String email;
  String nama;
  bool isLogin = false;

  UserModel({this.id, this.email, this.nama, this.isLogin = false});
  factory UserModel.fromDatabaseJson(Map<String, dynamic> data) => UserModel(
    id: data['id'],
    email: data['email'],
    nama: data['nama'],
    isLogin: data['is_login'] == 0 ? false : true,
  );

  Map<String, dynamic> toDatabaseJson() => {
    "id": this.id,
    "email": this.email,
    "nama": this.nama,
    "is_login": this.isLogin == false ? 0 : 1,
  };
}