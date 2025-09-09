import 'package:equatable/equatable.dart';

class Replies extends Equatable {
  final int? count;
  final String? nextToken;

  const Replies({this.count, this.nextToken});

  factory Replies.fromJson(Map<String, dynamic> json) => Replies(
    count: json['count'] as int?,
    nextToken: json['nextToken'] as String?,
  );

  Map<String, dynamic> toJson() => {'count': count, 'nextToken': nextToken};

  @override
  List<Object?> get props => [count, nextToken];
}
