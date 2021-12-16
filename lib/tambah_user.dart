// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:learn_graphql/graphql_setting.dart';

class TambahUserPage extends StatefulWidget {
  const TambahUserPage({Key? key}) : super(key: key);

  @override
  _TambahUserPageState createState() => _TambahUserPageState();
}

class _TambahUserPageState extends State<TambahUserPage> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data user nich .. uhuyy"),
        toolbarHeight: 50,
      ),
      body:
      Column(children: [


        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(hintText: "Name"),
          controller: name,

        ),

        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(hintText: "Email"),
          controller: email,

        ),
        
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(hintText: "Address"),
          controller: address,

        ),
        
        MaterialButton(onPressed: () =>{

    addData()




        },child: Text("Addd"),)

      ],),
    );
  }

  void addData()async{

    final MutationOptions options = MutationOptions(
        document: gql(QueryDatabase.addData),
        variables:<String,dynamic>{
          "name" : name.text,
          "email" : email.text,
          "address":address.text,

        });

    final QueryResult result = await QueryDatabase.client.value.mutate(options);

    if (result.hasException) {
      print(result.exception.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.exception.toString())));

      return;
    }

    //if (result.data?["insert_User"]["returning"][0]["email"] ==  email ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil nambah data")));

    //}
  }
}
