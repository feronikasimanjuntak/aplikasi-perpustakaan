class GalleryLink {
    GalleryLink({
        this.url,
        required this.label,
        required this.active,
    });

    final String? url;
    final String label;
    final bool active;

    factory GalleryLink.fromJson(Map<String, dynamic> json) => GalleryLink(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
    };
}
