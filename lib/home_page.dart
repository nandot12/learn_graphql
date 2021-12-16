// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:learn_graphql/graphql_setting.dart';
import 'package:learn_graphql/tambah_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> listData = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar GraphQl nih,semangat cuyyy...!!!"),
        toolbarHeight: 50,
      ),

      body: Column(
        children: [

          MaterialButton(onPressed: () =>

          {
          Navigator.push(context, MaterialPageRoute(builder: (_) => TambahUserPage() ))

          }
              ,

            child: Text("tambah User"),
          )
          ,
          SizedBox(height: 20,),

          ListView.builder(shrinkWrap: true,
              itemCount: listData.length,
              itemBuilder:(context,index){
            return Card(
              child: Column(
                children: [
                  Text(listData[index]["name"]),
                  SizedBox(height: 10,),
                  Text(listData[index]["email"]),

                ],
              ),


            );
          })
        ],
      ),
    );
  }

  void getUser() async {

    final QueryOptions options = QueryOptions(
      document: gql(QueryDatabase.getUser),
    );

    QueryResult result = await QueryDatabase.client.value.query(options);

    print(result);
    if (result.data?.isNotEmpty == true) {
      final List<dynamic> data = result.data?["User"];

      setState(() {
        listData = data;

        print(data);
      });
    }
    else{
      print(result.exception.toString());
    }
  }
}
