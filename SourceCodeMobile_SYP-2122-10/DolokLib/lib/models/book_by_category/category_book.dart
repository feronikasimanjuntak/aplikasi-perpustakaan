class CategoryBook {
    CategoryBook({
        required this.id,
        required this.namaKategori,
        required this.deskripsi,
        required this.createdAt,
        required this.updatedAt,
    });

    final int id;
    final String? namaKategori;
    final String? deskripsi;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory CategoryBook.fromJson(Map<String, dynamic> json) => CategoryBook(
        id: json["id"],
        namaKategori: json["nama_kategori"],
        deskripsi: json["deskripsi"],
        createdAt: (json['created_at'] != null)
          ? DateTime.parse(json["created_at"]) : null,
        updatedAt: (json['updated_at'] != null)
          ? DateTime.parse(json["updated_at"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
        "deskripsi": deskripsi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}