import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:school/models/surahs/surahs.dart';
import 'package:school/models/surahs/surah.dart';
import 'package:school/pages/surah_page.dart';

class QuranPage extends StatefulWidget {
  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  Surahs _surahs;

  Future<List<Surah>> _load;

  Future<String> _loadSurahsAsset() async {
    return await rootBundle.loadString('assets/jsons/surahs.json');
  }

  Future<List<Surah>> _loadSurah() async {
    var surahJsonString = await _loadSurahsAsset();
    final surahJsonResponse = json.decode(surahJsonString);

    _surahs = Surahs.fromJson(surahJsonResponse);

    return _surahs.surah;
  }

  @override
  void initState() {
    _load = _loadSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Rectangle1.png"),
              fit: BoxFit.cover,
            )
        ),
        child: FutureBuilder(
          future: _load,
          builder: (context, AsyncSnapshot<List<Surah>> snapshot) {
            if (snapshot.hasData) {

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var surah = snapshot.data[index];
                    return ListTile(
                      leading: Text(surah.index),
                      title: Text(surah.title,style:TextStyle(fontFamily: 'AeCortoba') ,),
                      subtitle: Text('${surah.type} - ${surah.count} verses'),
                      onTap: () {
                        print(surah.title);

                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurahPage(surah.index, surah.title),
                          ),
                        );
                      },
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
