import 'package:flutter/material.dart';
import 'package:mesaj_app/Service/local_json.dart';
import 'package:mesaj_app/Service/service_model.dart';
import 'package:mesaj_app/constants/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ServiceModel>> veriler;
  int geciciIndex = 0;
  @override
  void initState() {
    super.initState();
    veriler = VerileriOkuma().verileriGetir(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.grey200,
      appBar: baslik(),
      body: bodyColumn(),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.yellow,
          unselectedItemColor: Renkler.grey,
          currentIndex: geciciIndex,
          onTap: (gelendeger) {
            setState(() {
              geciciIndex = gelendeger;
            });
          },
          items: bottomNavigationItem),
    );
  }

  List<BottomNavigationBarItem> get bottomNavigationItem {
    /* List<BottomNavigationBarItem> gecici = [];
    for (var i = 0; i < 5; i++) {
      switch (i) {
        case 0:
          gecici.add(BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined), label: Mesajlar.home));
          return gecici;
        case 1:
          gecici.add(BottomNavigationBarItem(
              icon: const Icon(Icons.search_outlined), label: Mesajlar.search));
          return gecici;
        case 2:
          gecici.add(BottomNavigationBarItem(
              icon: const Icon(Icons.add_rounded), label: Mesajlar.add));
          return gecici;
        case 3:
          gecici.add(BottomNavigationBarItem(
              icon: const Icon(Icons.monitor_heart_outlined),
              label: Mesajlar.heart));
          return gecici;
        case 4:
          gecici.add(BottomNavigationBarItem(
              icon: const Icon(Icons.person_rounded), label: Mesajlar.profile));
          return gecici;
      }
    }
    return gecici; */
    return [
      BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined), label: Mesajlar.home),
      BottomNavigationBarItem(
          icon: const Icon(Icons.search_outlined), label: Mesajlar.search),
      BottomNavigationBarItem(
          icon: const Icon(Icons.add_rounded), label: Mesajlar.add),
      BottomNavigationBarItem(
          icon: const Icon(Icons.monitor_heart_outlined),
          label: Mesajlar.heart),
      BottomNavigationBarItem(
          icon: const Icon(Icons.person_rounded), label: Mesajlar.profile),
    ];
  }

  Padding bodyColumn() {
    return Padding(
      padding: Paddingler.l10T30r10b10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Paddingler.onlyLeft10,
            child: Text(
              Mesajlar.messages,
              style: YaziStilleri.fontSize20Bold,
            ),
          ),
          SizedBox(
            height: Uzunluklar.width20,
          ),
          Expanded(child: bodyFutureServis()),
        ],
      ),
    );
  }

  AppBar baslik() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Icon(
          Icons.precision_manufacturing_outlined,
          color: Renkler.grey,
        )
      ],
      title: Container(
        padding: Paddingler.onlyLeft10,
        height: Uzunluklar.height40,
        decoration: BoxDecoration(
          color: Renkler.grey300,
          borderRadius: Radiuslar.circular10,
        ),
        child: Row(
          children: [
            Icon(
              Icons.search_outlined,
              color: Renkler.grey,
            ),
            SizedBox(
              width: Uzunluklar.width10,
            ),
            Text(Mesajlar.search,
                style: TextStyle(
                  color: Renkler.grey,
                )),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ServiceModel>> bodyFutureServis() {
    return FutureBuilder<List<ServiceModel>>(
      future: veriler,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ServiceModel> geciciServis = snapshot.data!;
          return ListView.builder(
            itemCount: geciciServis.length,
            itemBuilder: (context, index) {
              var oAnkiServis = geciciServis[index];
              return Card(
                child: ListTile(
                  title: Text(
                    oAnkiServis.name!,
                    style: YaziStilleri.bold,
                  ),
                  subtitle: Text(
                    oAnkiServis.mesaj!,
                    style: YaziStilleri.overFlowEllipsis,
                  ),
                  leading: Container(
                    width: Uzunluklar.height50,
                    height: Uzunluklar.height50,
                    decoration: BoxDecoration(
                      borderRadius: Radiuslar.circular20,
                      image: DecorationImage(
                          image: NetworkImage(oAnkiServis.resimPath!),
                          fit: BoxFit.cover),
                    ),
                  ),
                  trailing: Container(
                    width: Uzunluklar.width30,
                    height: Uzunluklar.width30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Renkler.red, borderRadius: Radiuslar.circular10),
                    child: Text(
                      oAnkiServis.mesajSayisi.toString(),
                      style: YaziStilleri.colorWhite,
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(Mesajlar.hataMesaji),
          );
        } else {
          return Center(
            child: LinearProgressIndicator(
              color: Renkler.red,
              value: 2,
            ),
          );
        }
      },
    );
  }
}
