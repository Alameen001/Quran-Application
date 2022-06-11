import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class Qurancontent extends StatefulWidget {
  Qurancontent({Key? key, required this.surahno}) : super(key: key);
  int surahno;

  @override
  State<Qurancontent> createState() => _QurancontentState();
}



class _QurancontentState extends State<Qurancontent> {
  bool playing = true;

  dynamic count;
  void initstate() {
    count = widget.surahno.toString().padLeft(3, "0");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      
  
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            elevation: 3,
            toolbarHeight: 70,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${quran.getPlaceOfRevelation(widget.surahno)}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, fontFamily: "font2"),
                    ),
                    Text(
                      '${quran.getSurahNameArabic(widget.surahno)}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // color: Color.fromARGB(255, 0, 6, 8),
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Ayath No\n    ${quran.getVerseCount(widget.surahno).toString()}',
                      style: TextStyle(fontSize: 15, fontFamily: "font2"),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            centerTitle: true,
            flexibleSpace: Container(),
          ),
          body: ListView(children: [
            Center(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.only(left: 70),
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    quran.basmala,
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.white,
                    ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: quran.getVerseCount(widget.surahno),
                  itemBuilder: (context, index) {
                    int verseno = index + 1;
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            quran.getVerse(widget.surahno, verseno,
                                verseEndSymbol: true),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
