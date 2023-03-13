import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class SerieImage extends Equatable {
  final String? iconUrl;
  final String? mediumUrl;
  final String? screenUrl;
  final String? screenLargeUrl;
  final String? smallUrl;
  final String? superUrl;
  final String? thumbUrl;
  final String? tinyUrl;
  final String? originalUrl;
  final String? imageTags;

  const SerieImage({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  @override
  List<Object?> get props => [
        iconUrl,
        mediumUrl,
        screenUrl,
        screenLargeUrl,
        smallUrl,
        superUrl,
        thumbUrl,
        tinyUrl,
        originalUrl,
        imageTags,
      ];
}
