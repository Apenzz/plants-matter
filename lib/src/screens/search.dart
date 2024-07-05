import 'package:flutter/material.dart' hide SearchBar;
import '../widgets/searchbar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Plants'),
      ),
      body: const Column(
        children: [
          SearchBar(),
          Expanded(
            child: Center(
              child: Text('Search results will be displayed here!'),
            ),
          ),
        ],
      ),
    );
  }
}