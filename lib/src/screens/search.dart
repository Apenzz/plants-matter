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
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await _fetchItemsFromDatabase();
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  Future<void> _fetchItemsFromDatabase() async {
    final dbHelper = DatabaseHelper.instance;
    try {
      final List<Map<String, dynamic>> plants = await dbHelper.queryAllPlants();
      print('Fetched ${plants.length} items from the database');
      setState(() {
        _allItems = plants.map((plant) => plant['pid'].toString()).toList();
        _filteredItems = [];
      });
    } catch (e) {
      print('Error querying database: $e');
    }
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

    void _addPlantToOwned(String plantPid) async {
    await DatabaseHelper.instance.insertOwnedPlant(plantPid);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Plant added to your collection!')),
    );
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
                        trailing: IconButton(
                          icon: const Icon( Icons.add,
                          color: Colors.black,
                          ),
                          onPressed: () => _addPlantToOwned(_filteredItems[index]),
                        ),
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