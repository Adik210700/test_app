import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel>? _users;
  Future<void> fetchPicture() async {
    final dio = Dio();
    final result = await dio.get('https://jsonplaceholder.typicode.com/users');
    _users = (result.data as List<dynamic>)
        .map((e) => UserModel.fromMap(e))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _users == null
                ? Container(
                    height: 300,
                    width: 300,
                    color: Colors.red,
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: _users?.length ?? 0,
                        itemBuilder: (context, index) => ListTile(
                              leading: Text(index.toString()),
                              title: Text(_users?[index].name ?? ''),
                              subtitle: Text(_users?[index].name ?? ''),
                            )),
                  ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                fetchPicture();
              },
              child: Text('fetch pic'),
            ),
          ],
        ),
      ),
    );
  }
}
