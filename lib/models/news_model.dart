class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String image;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.image,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
class FeaturedNews {
  final String title;
  final String imageUrl;

  FeaturedNews({
    required this.title,
    required this.imageUrl,
  });

  factory FeaturedNews.fromJson(Map<String, dynamic> json) {
    return FeaturedNews(
      title: json['title'] ?? '',
      imageUrl: json['image'] ?? '', // Giả sử ảnh tin nổi bật lưu tại 'image'
    );
  }
}

