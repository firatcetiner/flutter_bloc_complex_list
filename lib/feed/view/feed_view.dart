import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclistview/feed/bloc/bloc.dart';
import 'package:flutterbloclistview/post/bloc/bloc.dart';
import 'package:flutterbloclistview/post/post_widget.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeds'),
      ),
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if(state is FeedLoaded) {
            if(state.photos.isEmpty) {
              return Center(
                child: Text('No photos found.'),
              );
            }
            return ListView.builder(
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                return BlocProvider<PostBloc>(
                  create: (context) => PostBloc(
                    photo: state.photos[index],
                  ),
                  child: PostWidget(),
                );
              },
            );
          }
          if(state is FeedFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
