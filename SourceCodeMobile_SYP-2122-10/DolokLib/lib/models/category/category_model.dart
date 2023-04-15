class CategoryModel {
    CategoryModel({
        required this.id,
        required this.namaKategori,
        required this.deskripsi,
        required this.dibuatOleh,
        required this.dibuatPada,
    });

    final int id;
    final String? namaKategori;
    final String deskripsi;
    final String dibuatOleh;
    final DateTime dibuatPada;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        namaKategori: json["nama_katgori"],
        deskripsi: json["deskripsi"],
        dibuatOleh: json["dibuat_oleh"],
        dibuatPada: DateTime.parse(json["dibuat_pada"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
        "deskripsi": deskripsi,
        "dibuat_oleh": dibuatOleh,
        "dibuat_pada": dibuatPada.toIso8601String(),
    };
}