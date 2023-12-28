import 'package:flutter/material.dart';


class AnimalSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;

  AnimalSearchDelegate({required this.onSearch});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
Widget buildResults(BuildContext context) {

  Future.delayed(Duration.zero, () => onSearch(query));
  
  return Container();
}
  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.photo_library),
      title: Text('Search Animal İmages'),
    
    );
  }
}
