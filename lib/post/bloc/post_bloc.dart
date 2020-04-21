import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclistview/photo_model.dart';

import 'bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  final PhotoModel photo;

  PostBloc({this.photo});

  @override
  PostState get initialState => PostState(isFavorite: false, photo: photo);

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    yield* _mapFavoriteButtonPressedToState(event);
  }

  Stream<PostState> _mapFavoriteButtonPressedToState(FavoritePost event) async* {
    yield state.favorite(event.choice);
  }

}