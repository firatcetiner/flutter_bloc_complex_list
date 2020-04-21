import 'package:equatable/equatable.dart';
import 'package:flutterbloclistview/photo_model.dart';

class PostState extends Equatable {
  final PhotoModel photo;
  final bool isFavorite;
  const PostState({this.photo, this.isFavorite});

  @override
  List<Object> get props => [photo, isFavorite];

  PostState favorite(bool favorite) {
    return PostState(
      photo: photo,
      isFavorite: favorite
    );
  }
}