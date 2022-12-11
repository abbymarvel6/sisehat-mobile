import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sisehat_mobile/halaman_utama/all_pages/home_page.dart';
import 'package:sisehat_mobile/halaman_utama/models/feedbackModels.dart';

class feedbackPage extends StatefulWidget {
  const feedbackPage({super.key, required this.title});

  final String title;

  @override
  State<feedbackPage> createState() => _feedbackPageState(title: title);
}

class _feedbackPageState extends State<feedbackPage> {
  _feedbackPageState({required this.title});

  final String title;

  Future<List<FeedbackModels>> fetchWatchList() async {
    var url =
        Uri.parse('https://web-production-0ada.up.railway.app/json_function');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<FeedbackModels> listTodo = [];
    for (var d in data) {
      if (d != null) {
        listTodo.add(FeedbackModels.fromJson(d));
      }
    }

    return listTodo;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 224, 204),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(1000, 77, 106, 109),
          title: Text('FEEDBACK APP!'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(title: title)),
                  );
                },
              );
            },
          ),
        ),
        // appBar: AppBar(
        //   title: Text('FEEDBACK APP!'),
        //   backgroundColor: Color.fromARGB(1000, 77, 106, 109),
        // ),
        body: FutureBuilder(
            future: fetchWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak Ada feedback :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 186, 179, 163),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 72, 65, 65),
                                      blurRadius: 2.0)
                                ]),
                            child: ListTile(
                              title: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            "from : ${snapshot.data![index].fields.name}",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 72, 65, 65),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    TextSpan(
                                        text: "\n\n",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 72, 65, 65))),
                                    TextSpan(
                                        text:
                                            "Message: ${snapshot.data![index].fields.message}",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 72, 65, 65),
                                            fontSize: 20)),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ));
                }
              }
            }));
  }
}
