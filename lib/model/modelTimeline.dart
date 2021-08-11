class ModelTimeline {
  ModelTimeline({
    this.id,
    this.status,
    this.lokasi,
    this.lat,
    this.long,
    this.date,
  });

  int id;
  String status;
  String lokasi;
  double lat;
  double long;
  DateTime date;

  factory ModelTimeline.fromMap(Map<String, dynamic> json) => ModelTimeline(
        id: json["id"] == null ? null : json["id"],
        status: json["status"] == null ? null : json["status"],
        lokasi: json["lokasi"] == null ? null : json["lokasi"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "status": status == null ? null : status,
        "lokasi": lokasi == null ? null : lokasi,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "date": date == null ? null : date.toIso8601String(),
      };
}

List<ModelTimeline> a = [
  ModelTimeline(
    id: 9,
    status: "Diterima oleh Indira",
    lokasi: "Sumberejo, Balong, Ponorogo, Indonesia",
    lat: -7.954032081957058,
    long: 111.39300595933075,
    date: DateTime(2021, 08, 2, 14, 30),
  ),
  ModelTimeline(
    id: 8,
    status: "Keluar drop point",
    lokasi: "Balong, Ponorogo, Indonesia",
    lat: -7.911726391223655,
    long: 111.4661855660945,
    date: DateTime(2021, 08, 2, 08, 30),
  ),
  ModelTimeline(
    id: 7,
    status: "Masuk drop point",
    lokasi: "Balong, Ponorogo, Indonesia",
    lat: -7.911726391223655,
    long: 111.4661855660945,
    date: DateTime(2021, 08, 1, 10, 0),
  ),
  ModelTimeline(
    id: 6,
    status: "Keluar drop point",
    lokasi: "Madiun, Indonesia",
    lat: -7.625841716169849,
    long: 111.54758645596858,
    date: DateTime(2021, 08, 2, 08, 30),
  ),
  ModelTimeline(
    id: 5,
    status: "Masuk drop point",
    lokasi: "Madiun, Indonesia",
    lat: -7.625841716169849,
    long: 111.54758645596858,
    date: DateTime(2021, 08, 1, 15, 30),
  ),
  ModelTimeline(
    id: 4,
    status: "Keluar drop point",
    lokasi: "Surabaya, Indonesia",
    lat: -7.23782745594702,
    long: 112.72031577771983,
    date: DateTime(2021, 08, 1, 10, 0),
  ),
  ModelTimeline(
    id: 3,
    status: "Masuk drop point",
    lokasi: "Surabaya, Indonesia",
    lat: -7.23782745594702,
    long: 112.72031577771983,
    date: DateTime(2021, 08, 1, 08, 30),
  ),
  ModelTimeline(
    id: 2,
    status: "Keluar drop point",
    lokasi: "Guangdong, Cina",
    lat: 22.352917,
    long: 114.155667,
    date: DateTime(2021, 07, 31, 09, 0),
  ),
];
