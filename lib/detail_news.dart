import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news_model.dart'; // Pastikan model dan file yang dibutuhkan di-import dengan benar

class PageDetailNews extends StatelessWidget {
  final Results news;

  const PageDetailNews({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News'),
        backgroundColor: Colors.red, // Sesuaikan dengan warna tema
      ),
      backgroundColor: Colors.white, // Latar belakang body
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title!,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Warna teks yang sesuai
              ),
            ),
            SizedBox(height: 10),
            Text(
              news.summary!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87, // Warna teks yang sesuai
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Published at: ${news.publishedAt!}',
              style: TextStyle(
                color: Colors.grey, // Warna teks yang sesuai
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _launchURL(news.url ?? '');
        },
        icon: Icon(Icons.image_search_outlined),
        label: Text("See More"),
        backgroundColor: Colors.red, // Warna tombol sesuai dengan tema
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
