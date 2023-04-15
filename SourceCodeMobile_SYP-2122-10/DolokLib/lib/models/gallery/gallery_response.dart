import 'package:DolokLib/models/gallery/gallery.dart';
import 'package:DolokLib/models/gallery/gallery_links.dart';
import 'package:DolokLib/models/gallery/gallery_meta.dart';

class GalleryResponse {
    GalleryResponse({
        required this.data,
        required this.links,
        required this.meta,
    });

    final List<Gallery> data;
    final GalleryLinks links;
    final GalleryMeta meta;

    factory GalleryResponse.fromJson(Map<String, dynamic> json) => GalleryResponse(
        data: List<Gallery>.from(json["data"].map((x) => Gallery.fromJson(x))),
        links: GalleryLinks.fromJson(json["links"]),
        meta: GalleryMeta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}