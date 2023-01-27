// To parse this JSON data, do
//
//     final ProfileModel = historyModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.success,
    this.toko,
    this.data,
  });

  bool success;
  List<Toko> toko;
  List<Data> data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        toko: List<Toko>.from(json["toko"].map((x) => Toko.fromJson(x))),
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "toko": List<String>.from(toko.map((x) => x.toJson())),
        "data": List<String>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.nama,
    this.phone,
    this.nik,
    this.kode_member,
    this.address,
    this.kota,
    this.email,
    this.poin,
    this.kode_verifikasi,
    this.member_since,
  });

  String nama;
  String phone;
  String nik;
  String kode_member;
  String address;
  String kota;
  String email;
  int poin;
  String kode_verifikasi;
  String member_since;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nama: json["nama"],
        phone: json["phone"],
        nik: json["nik"],
        kode_member: json["kode_member"],
        address: json["address"],
        kota: json["kota"],
        email: json["email"],
        poin: json["poin"],
        kode_verifikasi: json["kode_verifikasi"],
        member_since: json["member_since"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "phone": phone,
        "nik": nik,
        "kode_member": kode_member,
        "address": address,
        "kota": kota,
        "email": email,
        "poin": poin,
        "kode_verifikasi": kode_verifikasi,
        "member_since": member_since,
      };
}

class Toko {
  Toko({
    this.toko,
    this.email,
    this.phone,
    this.alamat,
  });

  String toko;
  String email;
  String phone;
  String alamat;

  factory Toko.fromJson(Map<String, dynamic> json) => Toko(
        toko: json["toko"],
        email: json["email"],
        phone: json["phone"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "toko": toko,
        "email": email,
        "phone": phone,
        "alamat": alamat,
      };
}
