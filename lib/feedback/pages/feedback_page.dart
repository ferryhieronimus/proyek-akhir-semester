import 'package:flutter/material.dart';
import 'package:loveiscaring/feedback/function/fetch_feedback.dart';
import 'package:loveiscaring/feedback/pages/feedback_card.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';




class MyFeedbackPage extends StatefulWidget {
    const MyFeedbackPage({super.key});

    @override
    State<MyFeedbackPage> createState() => _MyFeedbackPageState();
}

class _MyFeedbackPageState extends State<MyFeedbackPage> {
    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'Feedback',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xfff9f9f9),
        elevation: 4.0,
                //backgroundColor: Color.fromARGB(0, 222, 194, 145) ,
            ),
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Container(width: MediaQuery.of(context).size.width,
                    color: Colors.brown[100],
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20), 
                      child: Row(children: [
                        Image.asset("assets/images/Mental_Disorder_Silhouette.png", height: 150),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Mental health...is not a destination, but a process. It's about how you drive, not where you're going.",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontStyle: FontStyle.italic, 
                                  fontWeight: FontWeight.bold
                                  ) 
                                ),

                                SizedBox(height: 20),

                                Text("- Noam Shpancer",
                                style: TextStyle(
                                  // fontFamily: "Kanit",
                                  fontWeight: FontWeight.bold
                                  ) 
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text("Feedback", style: 
                    TextStyle(
                      // fontFamily: "Kanit",
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                      ),
                    ),
                  const Text("create you feedback", style: 
                  TextStyle(
                    // fontFamily: "Kanit",
                    // fontWeight: FontWeight.bold,
                    fontSize: 15
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    child: Text('Tambah Card Baru',
                      style: TextStyle(color: Colors.white),),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                    ),
                    onPressed: () {
                      print('Pressed');
                      showModalBottomSheet<void>(
                        context: context,
                        builder:(BuildContext context) {
                          return Container(
                            height: 200,
                            color: Colors.orange[200],
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[

                                  const Text('Rate Your Experience'),
                                  ElevatedButton(
                                    child: const Text('Close BottomSheet'),
                                    onPressed: () => Navigator.pop(context),
                                  )
                                ]
                              )
                            )
                          );
                        }
                        );
                      
                    },
                  ),

                FutureBuilder(
                  future: fetchFeedback(request),
                  builder: (context, AsyncSnapshot snapshot) {
                    if(snapshot.data == null) {
                      print('test');
                      return const Center(
                        child: CircularProgressIndicator(),
                        
                      );
                    } else {
                      if (snapshot.data!.length < 0) {
                        print('test');
                        return Column(
                          children: const[
                            Text('Tidak ada Feeedback')
                          ],
                        );
                      } else {
                        
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, i) => Container(
                            margin: const EdgeInsets.symmetric( horizontal: 16, vertical: 8),
                            child: GestureDetector(
                              child: Column(children: [
                                FeedbackdetailPage(
                                  username: snapshot.data[i].fields.username, 
                                  deskripsi: snapshot.data[i].fields.desc, 
                                )
                              ]),
                            ),
                          ));
                      }
                    }

                  }
                )                  
                ],
            ),
          ),
      );
    }
} 