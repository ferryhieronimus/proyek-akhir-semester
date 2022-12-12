import 'package:loveiscaring/timeline/function/fetch_timeline.dart';
import 'package:loveiscaring/timeline/pages/add_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);
  List<int> listColor = [
    0xFFFF9684, 0xFFACA355, 0xFF7F6485,
    0xFFFFB8D0, 0xFFE2BEA6, 0xFF9BB39D
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'About',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xfff9f9f9),
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flexible(
            child:
              Column(
                children: [
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          height: 80,
                          width: 80,
                        ),
                        Image.asset(
                          "assets/images/g20.png",
                          height: 80,
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "love. is. caring",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Text(
                    "by Kelompok PBP D-12",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text("G20 adalah kelompok informal dari 19 negara dan Uni Eropa, serta pewakilan dari International Monetary Fund (IMF) dan World Bank (WB). G20 merupakan forum ekonomi utama dunia yang memiliki posisi strategis karena secara kolektif mewakili sekitar 65% penduduk dunia, 79% perdagangan global, dan setidaknya 85% perekonomian dunia.\n\nPemerintah Indonesia memiliki tiga isu prioritas yakni kesehatan global, transformasi ekonomi digital, dan transisi energi. Pada pertemuan G20 yang akan diselenggarakan pada tanggal 15—16 November 2022, akan dibahas dua arus isu, yakni Finance Track dan Sherpa Track. Finance Track adalah jalur pembahasan dalam forum G20 yang berfokus pada topik ekonomi dan keuangan, sedangkan Sherpa Track adalah jalur pembahasan dalam forum G20 yang berfokus pada topik di luar topik Finance Track, seperti antikorupsi, ekonomi digital, pertanian, pendidikan, pariwisata, dan lain-lain.\n\nSalah satu topik yang dibahas pada isu Sherpa Track yang menarik perhatian kami adalah topik mengenai kesehatan. Seperti yang kita tahu, pandemi COVID 19 telah mengubah kondisi dunia secara total, baik dalam sisi ekonomi, budaya, pendidikan, politik, maupun kesehatan. Sektor kesehatan yang terganggu tidak hanya mengenai sektor penyakit yang berhubungan langsung dengan COVID 19, tetapi juga dari sisi kesehatan mental.\n\nWalaupun WHO menyebutkan bahwa tingkat prevalence dari anxiety dan depression meningkat 25% selama pandemi COVID 19, jumlah orang yang memiliki gejala mental health disorder berjumlah 792 juta orang. Angka yang tidak bisa dibilang kecil. Di Indonesia, terdapat 277 ribu kasus kesehatan jiwa di Indonesia. Namun, angka tersebut bisa menjadi jauh lebih besar. Hal tersebut disebabkan orang yang memiliki gejala mental health disorder cenderung tidak menceritakan keluh kesahnya. Hal tersebut disebabkan oleh banyak faktor, salah satunya adalah mengenai stigma mengenai kesehatan mental di masyarakat dan kesadaran akan kesehatan mental itu sendiri.\n\nKesehatan mental merupakan hal yang penting untuk disadari oleh semua orang. Maka dari itu, kami dari kelompok PBP D12 membuat website dengan tujuan untuk meningkatkan kesadaran akan kesehatan mental dan menyediakan wadah bagi orang yang ingin menceritakan keluh kesahnya. Di website ini, akan ada halaman yang berisikan informasi yang berkaitan dengan kesehatan mental. Selain itu, akan ada cards dimana seseorang bisa menceritakan dan menampilkan cerita tersebut kepada banyak orang.",
                    style: TextStyle(fontFamily: 'Helvetica'),),
                  const SizedBox(height: 15),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 20,
                    width: 20,
                  ),
                  const Text(
                    "love. is. caring",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Text(
                    "by Kelompok PBP D-12",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
          ),
        ),
      )
    );
  }
}