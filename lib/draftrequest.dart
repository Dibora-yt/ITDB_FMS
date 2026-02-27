import 'package:flutter/material.dart';
import 'draft_storage.dart';
import 'draft_detail_page.dart';

class DraftRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Draft Requests"), backgroundColor: Colors.cyan),
      body: ListView.builder(
        itemCount: DraftStorage.draftRequests.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.drafts, color: Colors.cyan),
              title: Text(DraftStorage.draftRequests[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DraftDetailPage(index: index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
