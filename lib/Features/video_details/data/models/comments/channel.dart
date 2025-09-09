import 'package:equatable/equatable.dart';

import 'avatar.dart';

class Channel extends Equatable {
  final String? type;
  final String? id;
  final String? name;
  final String? handle;
  final bool? isVideoOwner;
  final bool? isVerified;
  final bool? isVerifiedArtist;
  final List<Avatar>? avatar;

  const Channel({
    this.type,
    this.id,
    this.name,
    this.handle,
    this.isVideoOwner,
    this.isVerified,
    this.isVerifiedArtist,
    this.avatar,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    type: json['type'] as String?,
    id: json['id'] as String?,
    name: json['name'] as String?,
    handle: json['handle'] as String?,
    isVideoOwner: json['isVideoOwner'] as bool?,
    isVerified: json['isVerified'] as bool?,
    isVerifiedArtist: json['isVerifiedArtist'] as bool?,
    avatar: (json['avatar'] as List<dynamic>?)
        ?.map((e) => Avatar.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'id': id,
    'name': name,
    'handle': handle,
    'isVideoOwner': isVideoOwner,
    'isVerified': isVerified,
    'isVerifiedArtist': isVerifiedArtist,
    'avatar': avatar?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      type,
      id,
      name,
      handle,
      isVideoOwner,
      isVerified,
      isVerifiedArtist,
      avatar,
    ];
  }
}
