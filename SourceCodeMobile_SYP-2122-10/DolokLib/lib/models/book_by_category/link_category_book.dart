class LinkCategoryBook {
    LinkCategoryBook({
        required this.url,
        required this.label,
        required this.active,
    });

    final String? url;
    final String label;
    final bool active;

    factory LinkCategoryBook.fromJson(Map<String, dynamic> json) => LinkCategoryBook(
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
