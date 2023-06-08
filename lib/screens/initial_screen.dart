import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/task.dart';
import '../data/server_status.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key, required this.title});

  final String title;

  @override
  State<InitialScreen> createState() => _InitialScreen();
}

class _InitialScreen extends State<InitialScreen> {
  late List<ServerStatus> servers = [];
  void initState(){
    super.initState();
    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              updateList();
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: servers.length,
        itemBuilder: (context, index) {
          return Task(
            status: servers [index],
          );
        },
      ),
      drawer: const Drawer(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future<void> updateList() async {
    setState(() {
      servers.clear();
    });
    final response = await http.get(Uri.parse('https://search.reserve4me.de/api/status/details'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final json = jsonDecode(response.body);
      final List<dynamic> list = json["data"];
      setState(() {
        list.forEach((element) {
          servers.add(ServerStatus.fromJson(element));
        });
      });      
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
