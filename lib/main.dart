import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclistview/feed/bloc/bloc.dart';
import 'package:flutterbloclistview/feed/view/feed_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<FeedBloc>(
        create: (context) => FeedBloc()..add(FetchFeeds(1)),
        child: FeedView(),
      ),
    );
  }
}

