import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:school/models/surah/surah.dart';

class SurahPage extends StatefulWidget {
  final _surahIndex;
  final _surahTitle;

  SurahPage(this._surahIndex, this._surahTitle);
  @override
  _SurahPageState createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  final audioPlayer = AudioPlayer();

  Surah _surah;
  Surah _trans;

  String _surahIndex;
  String _surahTitle;

  List<List<String>> _ayat = List<List<String>>();

  Future<List<List<String>>> getData;

  initState() {
    getData = _loadSurah(widget._surahIndex);
    super.initState();
  }

  Future<void> _playAudio(int index) async {
    var _leadingZerosIndex =
        int.parse(_surahIndex) < 100 && int.parse(_surahIndex) > 10
            ? '0$_surahIndex'
            : int.parse(_surahIndex) < 10 ? '00$_surahIndex' : '$_surahIndex';

    var leadingIndex = _surahIndex == '1'
        ? (index + 1) < 100 && (index + 1) > 10
            ? '0${index + 1}'
            : (index + 1) < 10 ? '00${index + 1}' : '${index + 1}'
        : index < 100 && index > 10
            ? '0$index'
            : index < 10 ? '00$index' : '$index';

    audioPlayer.state == AudioPlayerState.PLAYING
        ? await audioPlayer.stop()
        : await audioPlayer.play(
            'https://raw.githubusercontent.com/aayanraja210/quranjson/master/source/audio/$_leadingZerosIndex/$leadingIndex.mp3',
          );
  }

  Future<String> _loadSurahsAsset(String index) async {
    return await rootBundle.loadString('assets/jsons/surah/surah_$index.json');
  }

  Future<String> _loadTranslationAsset(String index) async {
    return await rootBundle
        .loadString('assets/jsons/translation/en/en_translation_$index.json');
  }

  Future<List<List<String>>> _loadSurah(String index) async {
    _ayat.removeRange(0, _ayat.length);

    var surahJsonString = await _loadSurahsAsset(index);
    final surahJsonResponse = json.decode(surahJsonString);

    var transJsonString = await _loadTranslationAsset(index);
    final transJsonResponse = json.decode(transJsonString);

    _surah = Surah.fromJson(surahJsonResponse);
    _trans = Surah.fromJson(transJsonResponse);

    _surah.verses.forEach((k, v) => _ayat.add(
          [
            v,
            _trans.verses[k],
          ],
        ));
    return _ayat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffaf5f5f),
      body: NestedScrollView(

        headerSliverBuilder: (context, _) {
          return [
            SliverAppBar(
              backgroundColor: Colors.blueGrey,
              title: Text(widget._surahTitle),
              centerTitle: true,
              floating: true,
              snap: true,
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Image.asset(
                        "assets/images/quraan.png",
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            )
          ];
        },
        body: FutureBuilder(
          future: getData,
          builder: (context, AsyncSnapshot<List<List<String>>> snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = snapshot.data[index];
                    return Card(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Text(
                                '${data[0]}۞',
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.rtl,
                                style:
                                    Theme.of(context).textTheme.display1.apply(
                                          fontFamily: 'Saleem',
                                          color: Colors.black,
                                        ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 5.0),
                              child: Text(
                                '$index. ${data[1]}',
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.subhead,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );

                  });
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}
