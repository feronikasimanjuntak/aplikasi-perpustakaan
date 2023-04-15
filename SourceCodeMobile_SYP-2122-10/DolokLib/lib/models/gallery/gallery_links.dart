class GalleryLinks {
    GalleryLinks({
        required this.first,
        required this.last,
        required this.prev,
        required this.next,
    });

    final String first;
    final String last;
    final dynamic prev;
    final dynamic next;

    factory GalleryLinks.fromJson(Map<String, dynamic> json) => GalleryLinks(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}