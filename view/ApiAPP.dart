import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Api_Page extends StatefulWidget {
  const Api_Page({Key? key}) : super(key: key);

  @override
  State<Api_Page> createState() => _Api_PageState();
}

class _Api_PageState extends State<Api_Page> {
  Future getData() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    var result = jsonDecode(response.body);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data[index]['image']),
                ),
                title: Text(snapshot.data[index]['description'], maxLines: 1),
                subtitle: Text(snapshot.data[index]['category']),
              );
            },
          );
        } else {
          return Center(
              child: Lottie.asset(
            'assets/image/98432-loading.json',
          ));
        }
      },
    ));
  }
}
