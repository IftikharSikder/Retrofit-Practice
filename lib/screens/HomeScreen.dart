import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_practice/models/user.dart';
import 'package:retrofit_practice/services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final restClient = RestClient(Dio());

    Future<List<Users>> getUser(){
      return restClient.getUsers();
    }

    return Scaffold(
      body: FutureBuilder(
          future: getUser(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasData){
              final users = snapshot.data!;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context,index){
                    final user = users[index];
                    return ListTile(
                      title: Text(user.title.toString()),
                    );
                  }
              );
            }
            return SizedBox.shrink();
          }
      ),
    );
  }
}
