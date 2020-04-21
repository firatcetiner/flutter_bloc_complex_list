import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {

  const PostEvent();

  @override
  List<Object> get props => [];

}

class FavoritePost extends PostEvent {
  final int postId;
  final bool choice;

  const FavoritePost({this.postId, this.choice});

  @override
  List<Object> get props => [postId, choice];
}