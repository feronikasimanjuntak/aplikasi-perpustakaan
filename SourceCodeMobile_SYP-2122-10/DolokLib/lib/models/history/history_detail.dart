class HistoryDetail {
  HistoryDetail({
    required this.bukuId,
    required this.gambar,
    required this.judulBuku,
    required this.tanggalPeminjaman,
    required this.denda,
    required this.status,
    required this.tanggalPengembalian,
    required this.createdAt,
    required this.updatedAt,
  });

  final int bukuId;
  final String gambar;
  final String judulBuku;
  final DateTime tanggalPeminjaman;
  final dynamic denda;
  final String status;
  final dynamic tanggalPengembalian;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory HistoryDetail.fromJson(Map<String, dynamic> json) => HistoryDetail(
        bukuId: json["buku_id"],
        gambar: json["gambar"],
        judulBuku: json["judul_buku"],
        tanggalPeminjaman: DateTime.parse(json["tanggal_peminjaman"]),
        denda: json["denda"],
        status: json["status"],
        tanggalPengembalian: json["tanggal_pengembalian"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "buku_id": bukuId,
        "gambar": gambar,
        "judul_buku": judulBuku,
        "tanggal_peminjaman": tanggalPeminjaman.toIso8601String(),
        "denda": denda,
        "status": status,
        "tanggal_pengembalian": tanggalPengembalian,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
