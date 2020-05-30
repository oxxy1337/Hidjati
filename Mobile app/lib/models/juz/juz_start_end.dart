class JuzStartEnd {
  String index;
  String verse;
  String name;

  JuzStartEnd({
    this.index,
    this.verse,
    this.name,
  });

  factory JuzStartEnd.fromJson(Map<String, dynamic> parsedJson) {

    return JuzStartEnd(
      index: parsedJson['index'],
      verse: parsedJson['verse'],
      name: parsedJson['name'],
    );
  }

}