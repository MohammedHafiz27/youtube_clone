import 'package:equatable/equatable.dart';

import 'search_item.dart';

class SearchModel extends Equatable {
  final String? errorId;
  final String? nextToken;
  final List<SearchItem>? items;

  const SearchModel({this.errorId, this.nextToken, this.items});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    errorId: json['errorId'] as String?,
    nextToken: json['nextToken'] as String?,
    items: (json['items'] as List<dynamic>?)?.map((e) => SearchItem.fromJson(e as Map<String, dynamic>)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'errorId': errorId,
    'nextToken': nextToken,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [errorId, nextToken, items];
}
