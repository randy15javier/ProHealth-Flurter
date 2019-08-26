class Datas {

  List<Data> items = new List();

  Datas();

  Datas.fromJsonList(List<dynamic> jsonList) {

    if (jsonList == null) return;

    for (var item in jsonList) {

      final data = new Data.fromJsonMap(item);
      items.add(data);

    }

  }

}


class Data {
  int id;
  String date;
  String time;
  String status;
  String observation;
  int price;
  String patient;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  Data({
    this.id,
    this.date,
    this.time,
    this.status,
    this.observation,
    this.price,
    this.patient,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data.fromJsonMap(Map<String, dynamic> json) {

    id          = json["id"];
    date        = json["date"];
    time        = json["time"];
    status      = json["status"];
    observation = json["observation"];
    price       = json["price"];
    patient     = json["patient"];
    createdAt   = json["createdAt"];
    updatedAt   = json["updatedAt"];
    deletedAt   = json["deletedAt"];

  }
}
