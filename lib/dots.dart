import 'package:flutter/material.dart';
import 'package:maintenance_itdb/draftrequest.dart';
import 'package:maintenance_itdb/pendding_request.dart';
import 'package:maintenance_itdb/requestwithdate.dart';
import 'package:maintenance_itdb/requestwithtime.dart';

class DotsPage extends StatefulWidget {
  const DotsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DotsPageState createState() => _DotsPageState();
}

class _DotsPageState extends State<DotsPage> {
  bool showRequestStatus = false;
  bool showRequests = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Options"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Request Status expandable section
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.cyan),
              title: Text("Request"),
              trailing: Icon(
                showRequestStatus ? Icons.expand_less : Icons.expand_more,
                color: Colors.cyan,
              ),
              onTap: () {
                setState(() {
                  showRequestStatus = !showRequestStatus;
                });
              },
            ),
            if (showRequestStatus) ...[
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: ListTile(
                  title: Text("Request with Time"),
                   onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RequestWithTimePage()),
        );
      },
    ),
  ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: ListTile(
                  title: Text("Request with Date"),
                  onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RequestWithDatePage()),
        );
      },
    ),
  ),
],


            Divider(),

            // Requests expandable section
            ListTile(
              leading: Icon(Icons.list, color: Colors.cyan),
              title: Text("Request status"),
              trailing: Icon(
                showRequests ? Icons.expand_less : Icons.expand_more,
                color: Colors.cyan,
              ),
              onTap: () {
                setState(() {
                  showRequests = !showRequests;
                });
              },
            ),
            if (showRequests) ...[
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: ListTile(
                  title: Text("Draft request"),
                  onTap: () {
                  Navigator.push(
                  context,
                 MaterialPageRoute(builder: (context) => DraftRequestsPage()),
    );
  },
),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: ListTile(
                  title: Text("Pending request"),
                    onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PendingRequestsPage()),
    );
  },
),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: ListTile(
                  title: Text("On Progress request"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("On Progress request clicked")),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: ListTile(
                  title: Text("Approved request"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Approved request clicked")),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: ListTile(
                  title: Text("Rejected request"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Rejected request clicked")),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: ListTile(
                  title: Text("All Requests "),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("All Requests clicked")),
                    );
                  },
                ),
              ),
            ],

            Divider(),

            // Other clickable options
            ListTile(
              leading: Icon(Icons.archive, color: Colors.cyan),
              title: Text("Archived Request"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Archived Request clicked")),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.cyan),
              title: Text("Profile"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Profile clicked")),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.cyan),
              title: Text("Change Password"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Change Password clicked")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
