import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Event {
  final name;
  final date;
  final imgUrl;

  Event(this.name, this.date, this.imgUrl);
}

class EventsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventsScreenState();    
  }
}

class EventsScreenState extends State<EventsScreen> {

  List<Event> events = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Dio().get('https://baconipsum.com/api/?type=meat-and-filler').then((res) => {
      setState(() {
        // events = res.data;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () => {
                Navigator.of(context).pushNamed('/profile')
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/400/200'),
                radius: 20,
              ),
            ),
            Text("Мероприятия"),
            SizedBox(width: 60),
          ]
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: events.map((e) => EventCard(
              name: e.name, 
              date: e.date, 
              imgUrl: e.imgUrl
            )).toList()
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {

  final String name;
  final String date;
  final String imgUrl;

  const EventCard({
    super.key, 
    required this.name,
    required this.date,
    required this.imgUrl
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      onPressed: () { 
        print('clicked');
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
            radius: 50,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              SizedBox(height: 10),
              Text(date),
            ],
          )
        ]),
      ),
    );
  }

}