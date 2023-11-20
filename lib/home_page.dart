import 'package:flutter/material.dart';
import 'package:latihan_responsi/blogs_model.dart';
import 'package:latihan_responsi/blogs_page.dart';
import 'package:latihan_responsi/news_page.dart';
import 'package:latihan_responsi/reports_model.dart';
import 'package:latihan_responsi/reports_page.dart';

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final String description;
  final VoidCallback onTap;

  const MenuItem({
    required this.imagePath,
    required this.label,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  imagePath,
                  height: 300.0,
                  width: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                label,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama'),
        backgroundColor: Colors.red, // Sesuaikan dengan warna tema
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItem(
                imagePath: 'assets/news.jpg',
                label: 'News',
                description:
                'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageListNews()),
                  );
                },
              ),
              MenuItem(
                imagePath: 'assets/blogg.png',
                label: 'Blog',
                description:
                'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageListBlogs()),
                  );
                },
              ),
              MenuItem(
                imagePath: 'assets/report.png',
                label: 'Reports',
                description:
                'Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageListReports()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // Latar belakang body
    );
  }
}
