import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid App',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: ImageGridScreen(),
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  ImageGridScreen({super.key});

  final List<String> imageUrls = [
    'https://media.gettyimages.com/id/1451381152/photo/lusail-city-qatar-lionel-messi-of-argentina-kisses-the-fifa-world-cup-qatar-2022-winners.jpg?s=612x612&w=gi&k=20&c=ws8NcwYXGnqDjeFKa2qRtxu7vgxn7N_Qo2bawazijR0=',
    'https://c8.alamy.com/comp/2M43P2K/argentina-captain-lionel-messi-lifts-the-fifa-world-cup-trophy-following-victory-over-france-in-the-fifa-world-cup-final-match-at-the-lusail-stadium-in-lusail-qatar-picture-date-sunday-december-18-2022-2M43P2K.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnaF5LEJgeS9Vy3yqdcmI9So0nzSVVo9JqsQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3iWLo-OXxwQZV2wyeRt6v4t5PXnteKexOUA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrjisMrEnbznJk1G-kxbe4yOGJuXY5JeG0LA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkM5sb7EgGSIj824jiZLN6ixK1zIBA_0TRJ5AOycG3QFwLjIPmmTx2mjH1SCFJWUW8Ujk&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjBge7v-KK9u9U2AEahe_HB7N09W9_lrUDiHlZUyO5sGAVIm__5WVJdEqWrFTH3KHoOTQ&usqp=CAU',
    'https://media.assettype.com/outlookindia/import/uploadimage/library/16_9/16_9_5/IMAGE_1670101281.webp?w=640&h=360&fit=crop&crop=smart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lionel Messi World Cup 2022'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(imageUrls[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
