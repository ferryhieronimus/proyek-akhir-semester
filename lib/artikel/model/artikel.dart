import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Artikel artikelFromJson(String str) => Artikel.fromJson(json.decode(str));

String artikelToJson(Artikel data) => json.encode(data.toJson());

Future<Artikel> fetchArtikel(String disorderName) async {
  // var uri = Uri.parse("http://localhost:8000/artikel/${disorderName}_json/");

  // var response = await http.get(
  //   uri,
  //   headers: {
  //     "Access-Control-Allow-Origin": "*",
  //     "Content-Type": "application/json",
  //     'Accept': '*/*',
  //   },
  // );

  // debugPrint(response.body);

  // var data = jsonDecode(utf8.decode(response.bodyBytes));
  String dummy = "";

  if (disorderName == "depression") {
    dummy =
        '{"title": "Depression", "subtitle": "gangguan mental dengan rasa cemas berlebih", "deskripsi": "Depresi atau dalam istilah medis disebut sebagai gangguan depresi mayor adalah gangguan mental yang mempengaruhi perasaan, cara berpikir dan cara bertindak seseorang. Individu yang mengalami depresi cenderung merasa sedih dan kehilangan minat untuk melakukan aktivitas yang biasa dilakukan. Kondisi ini kemudian dapat menyebabkan berbagai masalah emosional dan fisik hingga menurunkan kinerja pengidapnya. Efek depresi dapat berlangsung lama atau bahkan berulang dan mampu memengaruhi kemampuan seseorang menjalani aktivitas sehari-hari. Depresi dapat memburuk dan bertahan lebih lama bila tak ditangani dengan tepat. Dalam kasus yang parah depresi memicu pengidapnya untuk melukai diri sendiri hingga menimbulkan pikiran bunuh diri.", "subpencegah": "Hidup dengan depresi memang berat, tetapi pengobatan dapat membantu untuk meningkatkan kualitas hidup pengidapnya. Cobalah untuk menemui ahli medis untuk meminta beberapa metode pengobatan agar menjadi lebih baik. Apabila depresi masih tergolong ringan, perawatan diri sendiri mungkin masih bisa membantu. Jika perawatan diri sendiri sudah tidak efektif, pengidapnya mungkin memerlukan konseling psikiater atau obat yang diresepkan dokter. Beberapa cara yang bisa dilakukan dokter untuk membantu pengidap mengatasi depresi yang dialaminya, antara lain:", "tips": ["Perawatan diri sendiri", "Psikoterapi", "Hindari kebiasaan menyendiri dengan mencari komunitas yang baik.", "Terapi stimulasi otak", "Menghindari rokok dan alkohol.", "Berolahraga secara teratur, minimal 3\u20135 kali dalam seminggu dengan durasi sekitar 30 menit"], "tipe": 1, "islogin": true}';
  } else if (disorderName == "anxiety") {
    dummy =
        '{"title": "Anxiety Disorder", "subtitle": "gangguan mental dengan rasa cemas berlebih", "deskripsi": "Anxiety disorder adalah gangguan mental yang menyebabkan rasa cemas dan takut berlebih. Hal tersebut membuat Anda menjadi tidak semangat untuk melakukan kegiatan sehari-hari, termasuk hobi yang biasa digemari. Lebih lanjut, rasa cemas ini akan berlangsung intens dalam jangka waktu yang panjang. Seringkali dengan ketakutan ini membuat penderitanya cepat lemas secara fisik. WHO menyatakan jika terdapat 301 juta orang memiliki gangguan mental ini di dunia, dimana 58 juta penderita anxiety disorder adalah anak-anak dan remaja. Menurut data Kementerian Kesehatan RI, gangguan kecemasan berada di peringkat 2 dari 10 penyakit yang paling banyak diderita oleh masyarakat Indonesia dari tahun 1990-an sampai 2017.", "subpencegah": "Kecemasan yang Anda miliki dapat mengganggu keseharian jika tidak dicegah dengan pola hidup yang sehat. Maka dari itu, cara ini bisa dilakukan untuk menjaga mental Anda agar aman dari rasa cemas.", "tips": ["Tidur cukup.", "Aktif berolahraga.", "Melakukan meditasi untuk melatih pernapasan dan mengendalikan emosi.", "Mengatur pola makan sehat.", "Menghindari rokok dan alkohol.", "Membatasi jumlah konsumsi kafein, seperti kopi dan teh."], "tipe": 0, "islogin": false}';
  } else if (disorderName == "schizophrenia") {
    dummy =
        '{"title": "Schizophrenia", "subtitle": "gangguan mental yang dapat memengaruhi tingkah laku, emosi, dan komunikasi.", "deskripsi": "Skizofrenia sering disamakan dengan psikosis, padahal keduanya berbeda. Psikosis hanyalah salah satu gejala dari gangguan mental, seperti gangguan bipolar, delusi, depresi berat, dan skizofrenia. Meski gejala psikosis dapat muncul pada skizofrenia, tidak semua penderita skizofrenia pasti mengalaminya. Gejala skizofrenia terbagi menjadi dua kategori, yakni gejala positif dan gejala negatif. Gejala positif ditandai dengan perubahan persepsi yang mengakibatkan penderita berperilaku tidak wajar. Gejala tersebut bisa berupa halusinasi, delusi (waham), atau perilaku tidak normal. Sementara itu, gejala negatif ditandai dengan ketidakmampuan penderita dalam bersosialisasi. Gejala ini ditandai dengan kecenderungan penderita yang menarik diri dari pergaulan dan tidak peduli dengan penampilan. Penyebab skizofrenia sendiri belum diketahui secara pasti. Namun, ada faktor yang diduga dapat meningkatkan terjadinya skizofrenia, di antaranya faktor genetik dan pengaruh lingkungan.", "subpencegah": "Sampai saat ini, belum ada obat yang dapat menyembuhkan skizofrenia. Namun, ada pengobatan yang dapat mengendalikan dan mengurangi gejala. Penanganan tersebut dapat berupa:", "tips": ["Pemberian obat-obatan antipsikotik", "Psikoterapi", "Terapi elektrokonvulsif"], "tipe": 2, "islogin": true}';
  } else if (disorderName == "eating") {
    dummy =
        '{"title": "Eating disorder", "subtitle": "gangguan mental yang ditandai dengan pola makan yang tidak sehat atau tidak wajar.", "deskripsi": "Eating disorder adalah serangkaian gangguan mental yang ditandai dengan pola makan yang tidak sehat atau tidak wajar. Kondisi ini dapat memberikan dampak negatif bagi kesehatan fisik dan mental. Tak hanya berdampak secara emosional, gangguan makan dapat memengaruhi kemampuan tubuh untuk mendapatkan gizi yang cukup dan menghambat kehidupan sehari-hari. Bila dibiarkan berlarut-larut, gangguan makan bisa menimbulkan bahaya pada organ-organ tubuh seperti jantung, lambung, dan tulang. Bahkan, pengidapnya juga berisiko mengalami komplikasi yang serius sampai kematian. Eating disorder paling sering ditemui pada remaja dan orang dewasa muda. Meski demikian, baik pria maupun wanita dari semua kelompok usia tak lepas dari risiko penyakit ini.", "subpencegah": "Perawatan untuk gangguan makan umumnya melibatkan beberapa pendekatan yang berbeda. Mengingat dampaknya bisa berpengaruh terhadap kesehatan fisik, dibutuhkan kerja sama antara psikolog, dokter spesialis kejiwaan, dan ahli gizi. Selain rutin menjalani perawatan dari dokter secara disiplin, pasien juga harus senantiasa menjaga kondisinya dengan:", "tips": ["Menerapkan pola makan sehat yang telah dianjurkan oleh dokter", "Mengurangi kebiasaan mengisolasi diri dari keluarga dan teman-teman", "Menghentikan penggunaan pil diet atau obat pencahar", "Mengelola stres dengan berolahraga atau melakukan aktivitas lain yang disenangi"], "tipe": 3, "islogin": true}';
  } else if (disorderName == "mood") {
    dummy =
        '{"title": "Mood disorder", "subtitle": "gangguan mental yang memengaruhi keadaan emosi seseorang", "deskripsi": " Mood disorder adalah gangguan kesehatan mental yang memengaruhi keadaan emosi seseorang. Gangguan ini menyebabkan seseorang mengalami kebahagiaan yang ekstrem, kesedihan yang ekstrem, atau keduanya secara bergantian, dalam waktu yang lama.", "subpencegah": "Sebagian besar kasus gangguan mood berhasil diatasi dengan berbagai jenis pengobatan. Melalui pengobatan ini, penderitanya dapat menjalankan aktivitas secara produktif serta menikmati hidup yang stabil dan sehat. Tergantung pada jenis dan tingkat keparahan yang dialami, berikut adalah beberapa cara atau prosedur pengobatan yang umum dilakukan untuk mengobati mood disorder:", "tips": ["Konsumsi obat dan menjalankan terapi secara teratur seperti yang disarankan dokter atau psikiater. Hindari berhenti atau mengganti konsumsi obat tanpa sepengetahuan dokter.", "Tidur atau istirahat yang cukup untuk mencegah mood swing.", "Terapkan pola makan sehat dan bergizi seimbang. Bila perlu konsumsi makanan untuk mengatasi depresi dan perubahan mood yang mungkin bisa membantu.", "Tetap aktif, seperti rutin olahraga. Olahraga bisa meningkatkan mood, sehingga cocok dilakukan penderita gangguan ini."], "tipe": 4, "islogin": true}';
  } else if (disorderName == "ptsd") {
    dummy =
        '{"title": "Post-traumatic stress disorder (PTSD)", "subtitle": "gangguan mental yang muncul setelah seseorang mengalami atau menyaksikan peristiwa yang bersifat traumatis atau sangat tidak menyenangkan", "deskripsi": "PTSD merupakan gangguan kecemasan yang membuat penderitanya teringat pada kejadian traumatis. Beberapa peristiwa traumatis yang dapat memicu PTSD adalah perang, kecelakaan, bencana alam, dan pelecehan seksual. Meski demikian, tidak semua orang yang teringat pada kejadian traumatis berarti terserang PTSD. Ada kriteria khusus yang digunakan untuk menentukan apakah seseorang mengalami PTSD.", "subpencegah": "PTSD tidak bisa dicegah, tetapi ada beberapa cara yang dapat dilakukan bila Anda mengalami kejadian traumatis, misalnya:", "tips": ["Bicarakan kepada keluarga, teman, atau terapis mengenai kejadian traumatis yang Anda alami.", "Konsultasikan ke dokter jika Anda tidak dapat mengatasi perasaan yang timbul setelah mengalami kejadian tidak menyenangkan."], "tipe": 5, "islogin": true}';
  }

  debugPrint(dummy);
  final Map<String, dynamic> data = jsonDecode(dummy);

  debugPrint(data.length.toString());
  Artikel artikel = Artikel.fromJson(data);

  return artikel;
}

class Artikel {
  Artikel({
    required this.title,
    required this.subtitle,
    required this.deskripsi,
    required this.subpencegah,
    required this.tips,
    required this.tipe,
    required this.islogin,
  });

  String title;
  String subtitle;
  String deskripsi;
  String subpencegah;
  List<String> tips;
  int tipe;
  bool islogin;

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        title: json["title"],
        subtitle: json["subtitle"],
        deskripsi: json["deskripsi"],
        subpencegah: json["subpencegah"],
        tips: List<String>.from(json["tips"].map((x) => x)),
        tipe: json["tipe"],
        islogin: json["islogin"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "deskripsi": deskripsi,
        "subpencegah": subpencegah,
        "tips": List<dynamic>.from(tips.map((x) => x)),
        "tipe": tipe,
        "islogin": islogin,
      };
}
