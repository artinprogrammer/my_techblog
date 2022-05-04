// hashtag model
class HashTagModel {
  String title;

  // constructor
  HashTagModel({required this.title});
}

// blog model
class BlogModel {
  int id;
  String imageUrl;
  String title;
  String writter;
  String writterImageUrl;
  String date;
  String content;
  String views;


  BlogModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.writter,
    required this.writterImageUrl,
    required this.date,
    required this.content,
    required this.views,
  });
}
