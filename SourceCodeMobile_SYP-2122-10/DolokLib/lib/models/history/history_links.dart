class HistoryLinks {
    HistoryLinks({
        required this.first,
        required this.last,
        required this.prev,
        required this.next,
    });

    final String first;
    final String last;
    final String? prev;
    final String? next;

    factory HistoryLinks.fromJson(Map<String, dynamic> json) => HistoryLinks(
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