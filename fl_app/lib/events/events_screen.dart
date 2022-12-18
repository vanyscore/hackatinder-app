import 'package:dio/dio.dart';
import 'package:fl_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Event {
  final String title;
  final String description;
  final String date;
  final String photoUrl;
  final String address;

  Event({
    required this.title,
    required this.date,
    required this.photoUrl,
    required this.description,
    required this.address,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        address: json['address'] as String,
        date: json['date'] as String,
        description: json['description'] as String,
        photoUrl: json['photo_url'] as String,
        title: json['title'] as String,
      );
}

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final dio = Provider.of<Dio>(context, listen: false);
      final res = await dio.get('/events');
      List<dynamic> list = res.data;
      final arr = list.map((e) => Event.fromJson(e)).toList();
      setState(() {
        events = arr;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: AppColors.main,
        child: const Text(
          '+',
          style: TextStyle(fontSize: 28),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () => {Navigator.of(context).pushNamed('/profile')},
              child: const CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/400/200'),
                radius: 20,
              ),
            ),
            const Text("Мероприятия"),
            const SizedBox(width: 60),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: ListView(
          children: events
              .map(
                (e) =>
                    EventCard(name: e.title, date: e.date, imgUrl: e.photoUrl),
              )
              .toList(),
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
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/team');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(date),
              ],
            )
          ],
        ),
      ),
    );
  }
}
