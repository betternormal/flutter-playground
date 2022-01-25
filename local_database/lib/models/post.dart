class Post {
  final int? id;
  final String price;
  final String content;

  Post({this.id, required this.price, required this.content});

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json['id'],
    price: json['price'],
    content: json['content'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'content': content,
    };
  }
}