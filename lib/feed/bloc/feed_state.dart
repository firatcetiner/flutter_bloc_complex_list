import 'package:equatable/equatable.dart';
import 'package:flutterbloclistview/photo_model.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedLoaded extends FeedState {
  final List<PhotoModel> photos;
  const FeedLoaded(this.photos);

  @override
  List<Object> get props => photos;
}

class FeedFailure extends FeedState {
  final String errorMessage;
  const FeedFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class FeedLoading extends FeedState {}