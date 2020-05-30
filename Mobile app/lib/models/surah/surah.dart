class Surah {
  String name;
  Map<dynamic, dynamic> verses;

  Surah({
    this.name,
    this.verses,
  });

  factory Surah.fromJson(Map<String, dynamic> parsedJson) {
    var verses = parsedJson['verse'];

    return Surah(
      name: parsedJson['name'],
      verses: verses,
    );
  }
}
