import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/about_dialog.dart';
import '../widgets/animal_tile.dart';
import '../widgets/search_delegate.dart';
import '../services/pixabay_api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List images = [];
  String searchQuery = 'animals';

  @override
  void initState() {
    super.initState();
    fetchImages(searchQuery);
  }

  fetchImages(String query) async {
    images = await PixabayApi.fetchImages(query);
    setState(() {});
  }

  void showAboutDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) => CustomAboutDialog(),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hayvan Resimleri '),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: AnimalSearchDelegate(
                  onSearch: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                    fetchImages(query);
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Hayvan Kategorileri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            AnimalTile(title: 'Kediler', query: 'cats', onTap: fetchImages),
            AnimalTile(title: 'Köpekler', query: 'dogs', onTap: fetchImages),
            AnimalTile(title: 'Kuşlar', query: 'birds', onTap: fetchImages),
            AnimalTile(title: 'Balıklar', query: 'fish', onTap: fetchImages),
            AnimalTile(title: 'Aslanlar', query: 'lions', onTap: fetchImages),
            ListTile(
              title: Text('Hakkında'),
              onTap: showAboutDialog,
            ),
          ],
        ),
      ),
      body: images.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(images[index]['webformatURL']);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
