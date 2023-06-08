import 'package:flutter/material.dart';
import 'package:monitor/data/server_status.dart';

class Task extends StatelessWidget {
  final ServerStatus status;
  const Task({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
            color: Colors.white70),
            height: 140,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [Row(
                  children:  [
                    Icon(Icons.access_alarms),
                    Text('${status.name}', style: TextStyle(fontSize: 30, color: Colors.green),),
                  ],
                )],),
              ),
              Padding(
                padding:  EdgeInsets.all(15.0),
                child: Column(children:  [Text('${status.status}', style: TextStyle(fontSize: 30, color: Colors.green),)],),
              )
            ],
          )
        ],
      ),
    );
  }
}
