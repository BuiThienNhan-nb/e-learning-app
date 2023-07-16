import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SearchResultQueryParams {
  final String keyword;
  SearchResultQueryParams({
    required this.keyword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'keyword': keyword,
    };
  }

  factory SearchResultQueryParams.fromMap(Map<String, dynamic> map) {
    return SearchResultQueryParams(
      keyword: (map['keyword'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResultQueryParams.fromJson(String source) =>
      SearchResultQueryParams.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
