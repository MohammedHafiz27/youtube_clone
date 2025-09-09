import 'package:equatable/equatable.dart';

import 'channel.dart';
import 'replies.dart';

class Item extends Equatable {
  final String? type;
  final String? id;
  final String? contentText;
  final bool? isPinned;
  final bool? isHearted;
  final Channel? channel;
  final String? publishedTimeText;
  final String? voteCountText;
  final Replies? replies;

  const Item({
    this.type,
    this.id,
    this.contentText,
    this.isPinned,
    this.isHearted,
    this.channel,
    this.publishedTimeText,
    this.voteCountText,
    this.replies,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    type: json['type'] as String?,
    id: json['id'] as String?,
    contentText: json['contentText'] as String?,
    isPinned: json['isPinned'] as bool?,
    isHearted: json['isHearted'] as bool?,
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    publishedTimeText: json['publishedTimeText'] as String?,
    voteCountText: json['voteCountText'] as String?,
    replies: json['replies'] == null
        ? null
        : Replies.fromJson(json['replies'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'id': id,
    'contentText': contentText,
    'isPinned': isPinned,
    'isHearted': isHearted,
    'channel': channel?.toJson(),
    'publishedTimeText': publishedTimeText,
    'voteCountText': voteCountText,
    'replies': replies?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      type,
      id,
      contentText,
      isPinned,
      isHearted,
      channel,
      publishedTimeText,
      voteCountText,
      replies,
    ];
  }
}
