import 'package:flutter/material.dart';
import 'draft_storage.dart';

class PendingRequestsPage extends StatelessWidget {
  const PendingRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pending Requests"), backgroundColor: Colors.cyan),
      body: DraftStorage.pendingRequests.isEmpty
          ? Center(
              child: Text(
                "No pending requests yet.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: DraftStorage.pendingRequests.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.pending_actions, color: Colors.orange),
                    title: Text(DraftStorage.pendingRequests[index]),
                  ),
                );
              },
            ),
    );
  }
}
