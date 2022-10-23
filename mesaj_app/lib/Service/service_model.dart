// ignore_for_file: unnecessary_this, unnecessary_new

class ServiceModel {
  String? name;
  int? mesajSayisi;
  String? resimPath;
  String? mesaj;

  ServiceModel({this.name, this.mesajSayisi, this.resimPath, this.mesaj});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mesajSayisi = json['mesajSayisi'];
    resimPath = json['resimPath'];
    mesaj = json['mesaj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['mesajSayisi'] = this.mesajSayisi;
    data['resimPath'] = this.resimPath;
    data['mesaj'] = this.mesaj;
    return data;
  }
}
