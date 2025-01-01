import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline Pengiriman'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TimelineEvent(
              date: "21 Nov",
              time: "10:00",
              title: "Tiba di Tujuan",
              description:
                  "Pesanan Anda telah diantarkan\nDiterima oleh : Asrul Halis",
              isActive: true,
            ),
            TimelineEvent(
              date: "18 Nov",
              time: "08:00",
              title: "Dalam Pengiriman",
              description: "Pesanan sedang diantar ke alamat tujuan",
              isActive: false,
            ),
            TimelineEvent(
              date: "15 Nov",
              time: "12:10",
              title: "Sedang di cetak",
              description: "Paket anda sekarang berada di Makassar",
              isActive: false,
            ),
            TimelineEvent(
              date: "15 Nov",
              time: "23:12",
              title: "Antrian ke - 6",
              description:
                  "Nunggu antrian cetak, Lorem ipsum dolor sit amet...",
              isActive: false,
            ),
            TimelineEvent(
              date: "8 Nov",
              time: "12:00",
              title: "Sedang Di desain",
              description: "Lorem ipsum dolor sit amet",
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineEvent extends StatelessWidget {
  final String date;
  final String time;
  final String title;
  final String description;
  final bool isActive;

  TimelineEvent({
    required this.date,
    required this.time,
    required this.title,
    required this.description,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Garis vertikal
            Container(
              width: 4,
              height:
                  100, // Adjust this height to make sure it connects the circles
              color: Colors.grey,
            ),
            // Lingkaran
            Positioned(
              top: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isActive ? Colors.blue : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$date\n$time",
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.blue : Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 24), // Spasi antara event
            ],
          ),
        ),
      ],
    );
  }
}
