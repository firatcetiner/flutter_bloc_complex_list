import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclistview/post/bloc/bloc.dart';

class PostWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      condition: (prev, current) => prev.isFavorite != current.isFavorite,
      builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(state.photo.id.toString(), style: TextStyle(fontSize: 25),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.network(state.photo.url),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(state.photo.thumbnailUrl, height: 50, width: 50),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(state.photo.title),
                      ),
                    ),
                    IconButton(
                      color: state.isFavorite ? Colors.red : Colors.grey,
                      icon: Icon(state.isFavorite ? Icons.favorite : Icons.favorite_border),
                      onPressed: () {
                        state.isFavorite ? BlocProvider.of<PostBloc>(context).add(FavoritePost(choice: false))
                        : BlocProvider.of<PostBloc>(context).add(FavoritePost(choice: true));
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Divider(height: 0, thickness: 1, color: Colors.grey[300]),
              )
            ],
          )
        );
      },
    );
  }
}
