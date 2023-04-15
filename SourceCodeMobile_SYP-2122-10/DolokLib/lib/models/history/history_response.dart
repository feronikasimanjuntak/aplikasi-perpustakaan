import 'package:DolokLib/models/history/history.dart';
import 'package:DolokLib/models/history/history_links.dart';
import 'package:DolokLib/models/history/history_meta.dart';

class HistoryResponse {
    HistoryResponse({
        required this.data,
        required this.links,
        required this.meta,
    });

    final List<History> data;
    final HistoryLinks links;
    final HistoryMeta meta;

    factory HistoryResponse.fromJson(Map<String, dynamic> json) => HistoryResponse(
        data: List<History>.from(json["data"].map((x) => History.fromJson(x))),
        links: HistoryLinks.fromJson(json["links"]),
        meta: HistoryMeta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<History>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}