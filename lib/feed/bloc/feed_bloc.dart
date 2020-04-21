import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclistview/photo_model.dart';
import 'package:http/http.dart' show get;
import 'bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {

  @override
  FeedState get initialState => FeedLoading();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    yield* _mapFetchPhotosToState(event);
  }

  Stream<FeedState> _mapFetchPhotosToState(FetchFeeds event) async* {
    try {
      List<PhotoModel> photos = List<PhotoModel>();
      for(var i = 0; i < 5; i++) {
        final response = await get('https://jsonplaceholder.typicode.com/albums/${event.albumId}/photos');
        final results = jsonDecode(response.body).map<PhotoModel>((json) => PhotoModel.fromJson(json)).toList();
        print(results.length);
        photos.addAll(results);
      }
      yield FeedLoaded(photos);
    } catch(e) {
      yield FeedFailure(e.toString());
    }
  }

}