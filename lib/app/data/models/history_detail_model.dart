// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryDetailModel historyDetailModelFromJson(String str) =>
    HistoryDetailModel.fromJson(json.decode(str));

String historyDetailModelToJson(HistoryDetailModel data) =>
    json.encode(data.toJson());

class HistoryDetailModel {
  HistoryDetailModel({
    this.success,
    this.toko,
    this.data,
    this.customer,
    this.total,
  });

  bool success;
  List<Toko> toko;
  List<Data> data;
  List<Customer> customer;
  List<Total> total;

  factory HistoryDetailModel.fromJson(Map<String, dynamic> json) =>
      HistoryDetailModel(
        success: json["success"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        toko: List<Toko>.from(json["toko"].map((x) => Toko.fromJson(x))),
        customer: List<Customer>.from(
            json["customer"].map((x) => Customer.fromJson(x))),
        total: List<Total>.from(json["total"].map((x) => Total.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "toko": List<String>.from(toko.map((x) => x.toJson())),
        "data": List<String>.from(data.map((x) => x.toJson())),
        "customer": List<String>.from(customer.map((x) => x.toJson())),
        "total": List<String>.from(total.map((x) => x.toJson())),
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

class Data {
  Data({
    this.reference,
    this.weight,
    this.total,
    this.poin,
    this.tanggal,
    this.no,
  });

  String reference;
  String weight;
  String total;
  int poin;
  int no;
  String tanggal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        reference: json["reference"],
        weight: json["weight"],
        total: json["total"],
        poin: json["poin"],
        tanggal: json["tanggal"],
        no: json["no"],
      );

  Map<String, dynamic> toJson() => {
        "reference": reference,
        "weight": weight,
        "total": total,
        "poin": poin,
        "tanggal": tanggal,
        "no": no,
      };
}

class Customer {
  Customer({
    this.nama,
    this.email,
    this.phone,
    this.address,
    this.kota,
    this.poin,
    this.nik,
    this.tanggal,
    this.sale_no,
    this.paid,
  });

  String nama;
  String email;
  String phone;
  String address;
  String kota;
  int poin;
  String nik;
  String tanggal;
  String sale_no;
  String paid;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        nama: json["nama"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        kota: json["kota"],
        poin: json["poin"],
        nik: json["nik"],
        tanggal: json["tanggal"],
        sale_no: json["sale_no"],
        paid: json["paid"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "phone": phone,
        "address": address,
        "kota": kota,
        "poin": poin,
        "nik": nik,
        "tanggal": tanggal,
        "sale_no": sale_no,
        "paid": paid,
      };
}

class Total {
  Total({
    this.total_amount,
    this.poin_reward,
    this.date,
    this.user,
  });

  String total_amount;
  int poin_reward;
  String date;
  String user;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        total_amount: json["total_amount"],
        poin_reward: json["poin_reward"],
        date: json["date"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "total_amount": total_amount,
        "poin_reward": poin_reward,
        "date": date,
        "user": user,
      };
}
