class LinkModel {
    LinkModel({
      required this.url,
      required this.label,
      required this.active,
    });

    final String? url;
    final String label;
    final bool active;

    factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
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
