import 'package:flutter/material.dart';

class DhikrScreen extends StatelessWidget {
  const DhikrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Dhikr',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SearchBar(
              hintText: 'Search by Dua',
              leading: const Icon(Icons.search, color: Colors.green),
              backgroundColor: MaterialStateProperty.all(
                Colors.green.shade50.withOpacity(0.5),
              ),
              elevation: MaterialStateProperty.all(0),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                DhikrItem(
                  title: 'One hundred times (Tasbih)',
                  subtitle: '100 Time Duas',
                ),
                DhikrItem(
                  title: 'Surah Ikhlas, Falaq and Nas',
                  subtitle: '3 Time Duas',
                ),
                DhikrItem(
                  title: 'Upon seeing a good or a bad dream',
                  subtitle: '3 Time Duas',
                ),
                DhikrItem(
                  title: 'The reward of freeing of a slave',
                  subtitle: '10 Time Duas',
                ),
                DhikrItem(
                  title: 'Asking for forgiveness',
                  subtitle: '100 Time Duas',
                ),
                DhikrItem(
                  title:
                      'The reward of freeing the four slaves of Bani Ismail (AS)',
                  subtitle: '10 Time Duas',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DhikrItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const DhikrItem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.green.shade50.withOpacity(0.5),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(Icons.mic, color: Colors.green.shade700),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        onTap: () {
          // Handle dhikr item tap
        },
      ),
    );
  }
}
