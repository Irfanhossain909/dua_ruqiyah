import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Model for video items
class VideoItem {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final String category;

  VideoItem({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.category,
  });
}

class SelfRuqiyahScreen extends StatefulWidget {
  const SelfRuqiyahScreen({Key? key}) : super(key: key);

  @override
  State<SelfRuqiyahScreen> createState() => _SelfRuqiyahScreenState();
}

class _SelfRuqiyahScreenState extends State<SelfRuqiyahScreen> {
  String selectedCategory = 'All Videos';

  // List of videos
  final List<VideoItem> videos = [
    VideoItem(
      id: '1',
      title: 'MENTAL SLAVERY EXPOSED! | Nouman Ali Khan',
      thumbnailUrl: 'assets/images/mental_slavery.jpg',
      duration: '00:43:59',
      category: 'Ruqyah',
    ),
    VideoItem(
      id: '2',
      title: 'THIS LECTURE IS CAPABLE OF CHANGING ANY MUSLIM - MOHAMMAD HOBLOS',
      thumbnailUrl: 'assets/images/changing_muslim.jpg',
      duration: '00:43:59',
      category: 'Duas',
    ),
    VideoItem(
      id: '3',
      title: 'PROPHET (ﷺ) WARNED EVERY MUSLIM OF 2 WOLVES',
      thumbnailUrl: 'assets/images/two_wolves.jpg',
      duration: '00:43:59',
      category: 'Ruqyah',
    ),
    VideoItem(
      id: '4',
      title: 'THE LIFE OF SIN - VERY EMOTIONAL STORY',
      thumbnailUrl: 'assets/images/life_of_sin.jpg',
      duration: '00:43:59',
      category: 'Name 4',
    ),
  ];

  // Get filtered videos based on selected category
  List<VideoItem> getFilteredVideos() {
    if (selectedCategory == 'All Videos') {
      return videos;
    } else {
      return videos
          .where((video) => video.category == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Ruqyah Videos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Category tabs
          _buildCategoryTabs(),

          // Video list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: getFilteredVideos().length,
              itemBuilder: (context, index) {
                final video = getFilteredVideos()[index];
                return _buildVideoCard(video);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Build category tabs
  Widget _buildCategoryTabs() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _buildTabButton('All Videos'),
            _buildTabButton('Duas'),
            _buildTabButton('Ruqyah'),
            _buildTabButton('Recitation'),
            _buildTabButton('Name 4'),
          ],
        ),
      ),
    );
  }

  // Build tab button
  Widget _buildTabButton(String category) {
    final isSelected = selectedCategory == category;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF8BC34A) : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? const Color(0xFF8BC34A) : Colors.black54,
          ),
        ),
      ),
    );
  }

  // Build video card
  Widget _buildVideoCard(VideoItem video) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail with duration
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    video.thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback for missing assets during development
                      return Container(
                        color: Colors.grey.shade300,
                        child: Center(
                          child: Icon(
                            Icons.video_library,
                            size: 50,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    video.duration,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Video title
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              video.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
