import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom Card App',
      home: CardListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  final List<Map<String, String>> items = const [
    {
      'image':
          'https://ntvb.tmsimg.com/assets/p8681514_b_h10_aa.jpg?w=960&h=540',
      'title': 'Game of Thrones',
      'subtitle': 'Web Series',
      'description':
          "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.",
    },

    {
      'image':
          'https://musicart.xboxlive.com/7/696b5100-0000-0000-0000-000000000002/504/image.jpg',
      'title': 'The Hobbit',
      'subtitle': 'juvenile fantasy',
      'description':
          'A reluctant Hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home and the gold within it from the dragon Smaug',
    },

    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaRQ5s4gDv6P9fMLCtCwXokcOvaxkFv4iVTc9lHwhl2mQA_8--9PgPa7__CQ-nyWoMtSQ&usqp=CAU',
      'title': 'The Lord of the Rings',
      'subtitle': 'film series',
      'description':
          'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favorite Movies'),
        backgroundColor: const Color.fromARGB(255, 67, 171, 184),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomCard(
              imageUrl: item['image']!,
              title: item['title']!,
              subtitle: item['subtitle']!,
              description: item['description']!,
            ),
          );
        },
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.97);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Tapped on "${widget.title}"')));
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  widget.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
