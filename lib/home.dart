import 'package:flutter/material.dart';
import 'package:maintenance_itdb/dots.dart';
import 'package:maintenance_itdb/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> recentRequests = [
    "Request #101 - Pending",
    "Request #102 - Approved",
    "Request #103 - Rejected",
    "Request #104 - Pending",
  ];


  void _onCardTapped(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$title tapped")),
    );
    // Later you can replace this with Navigator.push(...) to open a new page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "ITDB",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // Search action
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Notification action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DotsPage()),
      );
    },
  ),
              // More options action
          
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Four rectangles
            Expanded(
              flex: 2,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCard("All Requests", Colors.blue),
                  _buildCard("Pending Requests", Colors.orange),
                  _buildCard("Approved Requests", Colors.green),
                  _buildCard("Rejected Requests", Colors.red),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Recent Requests section
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Requests",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: recentRequests.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.request_page,
                                color: Colors.cyan),
                            title: Text(recentRequests[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      // Home
    } else if (index == 1) {
      // About
    } else if (index == 2) {
      // Navigate to ProfilePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  },
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ],
),

      );
  }

  // Updated helper method: makes cards clickable
  Widget _buildCard(String title, Color color) {
    return InkWell(
      onTap: () => _onCardTapped(title),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
