import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Api service/api_service.dart';
import '../Model/Api_Model.dart';

class Lotte extends StatefulWidget {
  const Lotte({Key? key}) : super(key: key);

  @override
  State<Lotte> createState() => _LotteState();
}

class _LotteState extends State<Lotte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ApiService.getData(),
      builder: (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SafeArea(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ListTile(
                  title: Text(product.title.toString()),
                  subtitle: Text(product.rating!.rate.toString()),
                );
              },
              itemCount: snapshot.data!.length,
            ),
          );
        } else {
          return Center(child: Lottie.asset('assets/image/98432-loading.json'));
        }
      },
    ));
  }
}
