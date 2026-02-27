import 'package:flutter/material.dart';
import 'draft_storage.dart';

class DraftDetailPage extends StatelessWidget {
  final int index;

  DraftDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    final draft = DraftStorage.draftRequests[index];

    return Scaffold(
      appBar: AppBar(title: Text("Draft Details"), backgroundColor: Colors.cyan),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Draft Information:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(draft, style: TextStyle(fontSize: 16)),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    DraftStorage.draftRequests.removeAt(index);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Draft deleted")),
                    );
                  },
                  child: Text("Delete"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    DraftStorage.pendingRequests.add(draft);
                    DraftStorage.draftRequests.removeAt(index);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Moved to Pending Requests")),
                    );
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
