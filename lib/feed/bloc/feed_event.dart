import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {

  const FeedEvent();

  @override
  List<Object> get props => [];
}

class FetchFeeds extends FeedEvent {
  final int albumId;

  const FetchFeeds(this.albumId);

  @override
  List<Object> get props => [albumId];
}