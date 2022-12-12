import 'package:flutter/material.dart';
import 'package:loveiscaring/auth/pages/login_page.dart';
import 'package:loveiscaring/auth/pages/register_page.dart';
import 'package:loveiscaring/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'timeline/pages/timeline.dart';
import 'artikel/page/artikel_detail.dart';
import 'artikel/widget/artikel_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
              
                title: 'LoveIsCaring',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: 'Kanit',
                    primarySwatch: Colors.blue,
                ),
                home: const MyHomePage(title: 'Flutter App'),
                initialRoute: "/",
                routes: {
                    "/login": (BuildContext context) => const MyLoginPage(),
                    "/register": (BuildContext context) => const MyRegister(),
                },
            ),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> disorderList = [
    "depression",
    "schizophrenia",
    "anxiety",
    "eating",
    "mood",
    "ptsd"
  ];
  Map<String, String> disorderNameList = {
    "depression": "Depression",
    "schizophrenia": "Schizophrenia",
    "anxiety": "Anxiety Disorder",
    "eating": "Eating Disorder",
    "mood": "Mood Disorder",
    "ptsd": "PTSD",
  };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: scaffoldKey, floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
        leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/logo.png", width: 3, height: 3),
            ),
            onTap: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
          )
        ],
        backgroundColor: const Color(0xfff9f9f9),
        elevation: 16.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          for (String disorder in disorderList)
            ListTile(
              title: Text(disorderNameList[disorder]!),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArtikelDetail(
                            disorder: disorder,
                            disorderName: disorderNameList[disorder]!)));
              },
            ),
          const Divider(),
          ListTile(
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ArtikelCard(
                  imagePath: "assets/images/mentalhealth1.jpg",
                  width: 600,
                  height: 150,
                  titleText: "Depression",
                  descriptionText:
                      "A group of conditions associated with the elevation or lowering of a person's mood, such as depression or bipolar disorder.",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtikelDetail(
                                disorder: "depression",
                                disorderName:
                                    disorderNameList["depression"]!)));
                  },
                  backgroundColor: Colors.white,
                  shadowColor: const Color(0xffff9684)),
              ArtikelCard(
                  imagePath: "assets/images/mentalhealth2.jpg",
                  width: 600,
                  height: 150,
                  titleText: "Schizophrenia",
                  descriptionText:
                      "A disorder that affects a person's ability to think, feel and behave clearly.",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtikelDetail(
                                disorder: "schizophrenia",
                                disorderName:
                                    disorderNameList["schizophrenia"]!)));
                  },
                  backgroundColor: Colors.white,
                  shadowColor: const Color(0xffaca355)),
              ArtikelCard(
                  imagePath: "assets/images/mentalhealth3.jpg",
                  width: 600,
                  height: 150,
                  titleText: "Anxiety Disorder",
                  descriptionText:
                      "A mental health disorder characterised by feelings of worry, anxiety or fear that are strong enough to interfere with one's daily activities.",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtikelDetail(
                                disorder: "anxiety",
                                disorderName: disorderNameList["anxiety"]!)));
                  },
                  backgroundColor: Colors.white,
                  shadowColor: const Color(0xff7f6485)),
              ArtikelCard(
                  imagePath: "assets/images/mentalhealth4.jpg",
                  width: 600,
                  height: 150,
                  titleText: "Eating Disorder",
                  descriptionText:
                      "A mental disorder defined by abnormal eating behaviors that negatively affect a person's physical or mental health.",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtikelDetail(
                                disorder: "eating",
                                disorderName: disorderNameList["eating"]!)));
                  },
                  backgroundColor: Colors.white,
                  shadowColor: const Color(0xffffb8d0)),
              ArtikelCard(
                  imagePath: "assets/images/mentalhealth5.jpg",
                  width: 600,
                  height: 150,
                  titleText: "Mood Disorder",
                  descriptionText:
                      "A mental health class that health professionals use to broadly describe all types of depression and bipolar disorders.",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtikelDetail(
                                disorder: "mood",
                                disorderName: disorderNameList["mood"]!)));
                  },
                  backgroundColor: Colors.white,
                  shadowColor: const Color(0xffe2bea6)),
              ArtikelCard(
                  imagePath: "assets/images/mentalhealth6.jpg",
                  width: 600,
                  height: 150,
                  titleText: "PTSD",
                  descriptionText:
                      "A mental health condition that's triggered by a terrifying event — either experiencing it or witnessing it.",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtikelDetail(
                                disorder: "ptsd",
                                disorderName: disorderNameList["ptsd"]!)));
                  },
                  backgroundColor: Colors.white,
                  shadowColor: const Color(0xff9bb39d)),
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
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TimelinePage()),
            );
          },
          label: const Text('Lihat Timeline'),
          backgroundColor: Color(0xFFCEA16A),
        )
    );
  }
}
