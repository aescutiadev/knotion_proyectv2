import 'package:equatable/equatable.dart';

class SerieDetailImages extends Equatable {
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

  const SerieDetailImages({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
    required this.imageTags,
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
