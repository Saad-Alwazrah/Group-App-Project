import 'package:june15th/repositories/models/cafe.dart';

class Coffee {
  Coffee({
    required this.id,
    required this.category,
    required this.title,
    required this.briefDesc,
    required this.fullDesc,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.wiki,
  });
  late final String id;
  late final String category;
  late final String title;
  late final String briefDesc;
  late final String fullDesc;
  late final String imageUrl;
  late final String createdAt;
  late final String updatedAt;
  late final String wiki;
  final List<Cafe> cafes = [];

  Coffee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    title = json['title'];
    briefDesc = json['brief_desc'];
    fullDesc = json['full_desc'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    wiki = json['wiki'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category'] = category;
    _data['title'] = title;
    _data['brief_desc'] = briefDesc;
    _data['full_desc'] = fullDesc;
    _data['image_url'] = imageUrl;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['wiki'] = wiki;
    return _data;
  }
}
