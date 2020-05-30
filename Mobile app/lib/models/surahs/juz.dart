class Juz {
  String index;

  Juz({
    this.index,
  });

  factory Juz.fromJson(Map<String, dynamic> parsedJson) {

    return Juz(
      index: parsedJson['index'],
    );

  }
}
