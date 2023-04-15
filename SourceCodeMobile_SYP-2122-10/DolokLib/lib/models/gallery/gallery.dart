class Gallery {
    Gallery({
        required this.foto,
        required this.keterangan,
        required this.createdAt,
        required this.updatedAt,
    });

    final String foto;
    final String keterangan;
    final dynamic createdAt;
    final dynamic updatedAt;

    factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        foto: json["foto"],
        keterangan: json["keterangan"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "foto": foto,
        "keterangan": keterangan,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}