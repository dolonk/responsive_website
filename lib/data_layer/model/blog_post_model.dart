class BlogPostModel {
  final String id;
  final String title;
  final String excerpt;
  final String imagePath;
  final String author;
  final String authorImage;
  final String publishedDate;
  final String readingTime;
  final List<String> tags;
  final String category;
  final bool isFeatured;
  final int viewCount;
  final String content; // For detail page later

  BlogPostModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.imagePath,
    this.author = 'Dolon Kumar',
    this.authorImage = 'assets/home/hero/dolon.png',
    required this.publishedDate,
    required this.readingTime,
    required this.tags,
    this.category = 'Flutter',
    this.isFeatured = false,
    this.viewCount = 0,
    this.content = '',
  });

  /// Get all blog posts (sample data)
  static List<BlogPostModel> getAllPosts() {
    return [
      // Featured Post
      BlogPostModel(
        id: 'flutter-mvvm-architecture',
        title: 'Building Scalable Flutter Apps with MVVM Architecture',
        excerpt:
            'Learn how to architect production-ready Flutter applications using the MVVM pattern, clean code principles, and best practices for maintainability and scalability.',
        imagePath: 'assets/home/projects/project_1.png',
        publishedDate: 'Nov 10, 2024',
        readingTime: '8 min read',
        tags: ['Flutter', 'Architecture', 'MVVM', 'Best Practices'],
        isFeatured: true,
        viewCount: 1250,
        content: '...', // Full content for detail page
      ),

      // Regular Posts
      BlogPostModel(
        id: 'flutter-animations-guide',
        title: 'Mastering Flutter Animations: A Complete Guide',
        excerpt:
            'Deep dive into Flutter animations with practical examples. Learn implicit animations, explicit animations, and custom animation controllers.',
        imagePath: 'assets/blog/post_1.png',
        publishedDate: 'Nov 5, 2024',
        readingTime: '12 min read',
        tags: ['Flutter', 'Animations', 'UI/UX'],
        viewCount: 890,
      ),

      BlogPostModel(
        id: 'state-management-comparison',
        title: 'State Management in Flutter: Provider vs BLoC vs Riverpod',
        excerpt:
            'Comprehensive comparison of popular state management solutions. Which one should you choose for your next project?',
        imagePath: 'assets/blog/post_2.png',
        publishedDate: 'Oct 28, 2024',
        readingTime: '10 min read',
        tags: ['Flutter', 'State Management', 'Provider', 'BLoC'],
        viewCount: 1520,
      ),

      BlogPostModel(
        id: 'flutter-performance-optimization',
        title: '10 Performance Optimization Tips for Flutter Apps',
        excerpt:
            'Proven techniques to make your Flutter app faster and more responsive. From widget rebuilds to memory management.',
        imagePath: 'assets/blog/post_3.png',
        publishedDate: 'Oct 20, 2024',
        readingTime: '7 min read',
        tags: ['Flutter', 'Performance', 'Optimization'],
        viewCount: 2100,
      ),

      BlogPostModel(
        id: 'firebase-integration-guide',
        title: 'Complete Firebase Integration Guide for Flutter',
        excerpt:
            'Step-by-step tutorial on integrating Firebase Authentication, Firestore, and Cloud Storage in your Flutter app.',
        imagePath: 'assets/blog/post_4.png',
        publishedDate: 'Oct 15, 2024',
        readingTime: '15 min read',
        tags: ['Flutter', 'Firebase', 'Backend'],
        viewCount: 1780,
      ),

      BlogPostModel(
        id: 'responsive-design-flutter',
        title: 'Building Responsive UIs in Flutter: Best Practices',
        excerpt:
            'Learn how to create adaptive layouts that work seamlessly across mobile, tablet, and desktop platforms.',
        imagePath: 'assets/blog/post_5.png',
        publishedDate: 'Oct 8, 2024',
        readingTime: '9 min read',
        tags: ['Flutter', 'Responsive', 'UI/UX'],
        viewCount: 950,
      ),

      BlogPostModel(
        id: 'flutter-testing-guide',
        title: 'Testing in Flutter: Unit, Widget, and Integration Tests',
        excerpt:
            'Complete guide to writing effective tests for your Flutter applications. Ensure code quality and reliability.',
        imagePath: 'assets/blog/post_6.png',
        publishedDate: 'Oct 1, 2024',
        readingTime: '11 min read',
        tags: ['Flutter', 'Testing', 'Quality Assurance'],
        viewCount: 720,
      ),
    ];
  }

  /// Get featured post
  static BlogPostModel? getFeaturedPost() {
    return getAllPosts().firstWhere((post) => post.isFeatured);
  }

  /// Get regular posts (non-featured)
  static List<BlogPostModel> getRegularPosts() {
    return getAllPosts().where((post) => !post.isFeatured).toList();
  }
}
