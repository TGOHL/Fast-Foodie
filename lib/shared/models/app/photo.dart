// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhotoModel {
  final String id;
  final String prefix;
  final String suffix;
  final int width;
  final int height;
  PhotoModel({
    required this.id,
    required this.prefix,
    required this.suffix,
    required this.width,
    required this.height,
  });

  String get imageUrl => '$prefix${width}x$height$suffix';

  PhotoModel copyWith({
    String? id,
    String? prefix,
    String? suffix,
    int? width,
    int? height,
  }) {
    return PhotoModel(
      id: id ?? this.id,
      prefix: prefix ?? this.prefix,
      suffix: suffix ?? this.suffix,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'prefix': prefix,
      'suffix': suffix,
      'width': width,
      'height': height,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      id: map['id'] as String,
      prefix: map['prefix'] as String,
      suffix: map['suffix'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoModel.fromJson(String source) => PhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhotoModel(id: $id, prefix: $prefix, suffix: $suffix, width: $width, height: $height)';
  }

  @override
  bool operator ==(covariant PhotoModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.prefix == prefix && other.suffix == suffix && other.width == width && other.height == height;
  }

  @override
  int get hashCode {
    return id.hashCode ^ prefix.hashCode ^ suffix.hashCode ^ width.hashCode ^ height.hashCode;
  }
}
