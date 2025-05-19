import 'package:cinema_app/presentation/views/movies/favorites_view.dart';
import 'package:cinema_app/presentation/views/movies/home_view.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[HomeView(), SizedBox(), FavoritesView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: pageIndex,
      ),
    );
  }
}
