import 'package:flutter/material.dart' hide SearchBar;
import '../widgets/searchbar.dart';
import '../dbhelper/database_helper.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({super.key});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  List<String> _allItems = [];
  List<String> _filteredItems = [];
  
  @override  
  void initState() {
    super.initState();
    _fetchItemsFromDatabase();
  }

  Future<void> _fetchItemsFromDatabase() async {
    final dbHelper = DatabaseHelper.instance;
    final List<Map<String, dynamic>> plants = await dbHelper.queryAllPlants();
    
    setState(() {
      _allItems = plants.map((plant) => plant['pid'].toString()).toList();
      _filteredItems = [];
    });
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = [];
      } else {
        _filteredItems = _allItems.where((item) {
          return item.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Plants'),
      ),
      body: Column(
        children: [
          SearchBar(
            controller: _controller,
            onChanged: _filterItems,
          ),
                    Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return FutureBuilder<String?>(
                  future: DatabaseHelper.instance.getImageByPid(_filteredItems[index]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListTile(
                        leading: const CircularProgressIndicator(),
                        title: Text(_filteredItems[index]),
                      );
                    } else if (snapshot.hasError) {
                      return ListTile(
                        leading: const Icon(Icons.error),
                        title: Text(_filteredItems[index]),
                      );
                    } else if (snapshot.hasData) {
                      return ListTile(
                        leading: ClipOval(
                          child: Image.asset(
                            snapshot.data!,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(_filteredItems[index]),
                      );
                    } else {
                      return ListTile(
                        leading: const Icon(Icons.image_not_supported),
                        title: Text(_filteredItems[index]),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}