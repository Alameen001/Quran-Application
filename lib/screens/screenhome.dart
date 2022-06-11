import 'package:flutter/material.dart';

import 'package:quran/quran.dart' as quran;
import 'package:quranapp1/screens/drowr.dart';
import 'package:quranapp1/screens/surathindex.dart';

class Screenhome extends StatefulWidget {
  const Screenhome({Key? key}) : super(key: key);

  @override
  State<Screenhome> createState() => _ScreenhomeState();
}

class _ScreenhomeState extends State<Screenhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Surah'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 114,
        itemBuilder: (BuildContext c, int i) {
          int surahno = i + 1;
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Qurancontent(surahno: surahno);
                },
              ));
            },
            title: Text(
              quran.getSurahName(surahno),
            ),
            subtitle: Text(quran.getSurahNameEnglish(surahno)),
            trailing: Text(
              quran.getSurahNameArabic(surahno),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 2,
            ),
          );
        },
      ),
    );
  }
}
