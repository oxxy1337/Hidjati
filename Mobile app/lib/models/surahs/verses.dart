class Verses {
  String start;
  String end;

  Verses({this.start, this.end});

  factory Verses.fromJson(Map<String, dynamic> parsedJson) {
    return Verses(
      start: parsedJson['start'],
      end: parsedJson['end'],
    );
  }
}
