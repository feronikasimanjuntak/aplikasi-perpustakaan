import 'package:DolokLib/consts/borrow_status.dart';
import 'package:DolokLib/models/history/history_detail.dart';

class History {
  History({
    required this.id,
    required this.tanggalPeminjaman,
    required this.idUser,
    required this.statusString,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.detail,
  });

  final int id;
  final DateTime tanggalPeminjaman;
  final String idUser;
  final String statusString;
  final BorrowStatus status;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<HistoryDetail> detail;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        tanggalPeminjaman: DateTime.parse(json["tanggal_peminjaman"]),
        idUser: json["id_user"],
        statusString: json["status"],
        status: mapBorrowStatus(json["status"]),
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        detail: List<HistoryDetail>.from(
            json["detail"].map((x) => HistoryDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal_peminjaman": tanggalPeminjaman.toIso8601String(),
        "id_user": idUser,
        "status_string": statusString,
        "status": status.name,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };

  static BorrowStatus mapBorrowStatus(String value) {
    switch (value) {
      case 'menunggu':
        return BorrowStatus.Menunggu;
      case 'dikonfirmasi peminjaman':
        return BorrowStatus.DikonfirmasiPeminjaman;
      case 'dipinjam':
        return BorrowStatus.Dipinjam;
      case 'menunggu perpanjangan':
        return BorrowStatus.MenungguPerpanjangan;
      case 'sudah diperpanjang':
        return BorrowStatus.SudahDiperpanjang;
      case 'dikonfirmasi pengembalian':
        return BorrowStatus.DikonfirmasiPengembalian;
      default:
        return BorrowStatus.Dikembalikan;
    }
  }
}
