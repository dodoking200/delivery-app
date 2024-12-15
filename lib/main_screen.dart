import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Sample data for stores and products
  // final List<Map<String, String>> stores = [
  //   {'name': 'Store 1', 'image': 'https://via.placeholder.com/150'},
  //   {'name': 'Store 2', 'image': 'https://via.placeholder.com/150'},
  //   {'name': 'Store 3', 'image': 'https://via.placeholder.com/150'},
  //   {'name': 'Store 4', 'image': 'https://via.placeholder.com/150'},
  //   {'name': 'Store 5', 'image': 'https://via.placeholder.com/150'},
  //   {'name': 'Store 6', 'image': 'https://via.placeholder.com/150'},
  //   {'name': 'Store 7', 'image': 'https://via.placeholder.com/150'},
  //   {'name': 'Store 8', 'image': 'https://via.placeholder.com/150'},
  //   {'name': 'Store 9', 'image': 'https://via.placeholder.com/150'},
  // ];

  // final List<Map<String, String>> products = [
  //   {'name': 'Product 1', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 2', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 3', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 4', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 5', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 6', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 7', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 8', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 9', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 10', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 11', 'image': 'https://via.placeholder.com/100'},
  //   {'name': 'Product 12', 'image': 'https://via.placeholder.com/100'},
  // ];
  List<dynamic> products = []; // Assuming the API returns a list of products
  List<dynamic> stores = []; // Assuming the API returns a list of products
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.201.103:8000/api/products'));

    if (response.statusCode == 200) {
      // Decode JSON response into a Map or List
      final jsonData = jsonDecode(response.body); // This converts the JSON string into a Dart object

      // Access the data property (if your API returns it in a field called "data")
      products = jsonData['data'];

      print(products); // Now 'products' contains the list of product data
    } else {
      print('Failed to fetch data');
    }
  }
  Future<void> fetchData2() async {
    final response = await http.get(Uri.parse('http://192.168.201.103:8000/api/stores'));

    if (response.statusCode == 200) {
      // Decode JSON response into a Map or List
      final jsonData = jsonDecode(response.body); // This converts the JSON string into a Dart object

      // Access the data property (if your API returns it in a field called "data")
      stores = jsonData['data'];

      print(stores); // Now 'products' contains the list of product data
    } else {
      print('Failed to fetch data');
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchData2();
    fetchData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF950),
        leading: IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Main Page',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Display Stores in a Horizontal List
            SizedBox(
              height: 150, // Set a fixed height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: Column(
                        children: [
                          // Image.network(
                          //   stores[index]['image']!,
                          //   height: 100,
                          //   width: 100,
                          //   fit: BoxFit.cover,
                          // ),
                          SizedBox(height: 5),
                          Text(
                            stores[index]['name']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10), // Add spacing between Stores and Products
            // Display Products in a Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        // Image.network(
                        //   products[index]['image']!,
                        //   height: 70,
                        //   fit: BoxFit.cover,
                        // ),
                        SizedBox(height: 5),
                        Text(
                          products[index]['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
              label:'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store, color: Colors.black),
            label:'Stores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket, color: Colors.black),
            label:'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black),
            label:'Favorites',
          ),
        ],
        backgroundColor: Color(0xFFFFF950),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed, // Prevents shifting behavior
        elevation: 0,// Removes shadow
        selectedItemColor: Colors.black, // Ensure selected item remains black
        unselectedItemColor: Colors.black, // Ensure unselected items are black
        onTap: _onItemTapped,
      ),
    );
  }
}