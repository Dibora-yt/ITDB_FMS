import 'package:flutter/material.dart';
import 'package:maintenance_itdb/draft_storage.dart';

class RequestWithDatePage extends StatefulWidget {
  const RequestWithDatePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RequestWithDatePageState createState() => _RequestWithDatePageState();
}

class _RequestWithDatePageState extends State<RequestWithDatePage> {
  String? selectedOrganization;
  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController reasonController = TextEditingController();

  // Draft storage (for demo purposes)

  Future<void> _pickStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => startDate = picked);
  }

  Future<void> _pickEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: startDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => endDate = picked);
  }

void _saveToDraft() {
  final draft = "Draft Request (Date): Org=${selectedOrganization ?? "N/A"}, "
      "Reason=${reasonController.text}, "
      "Start=${startDate?.toLocal().toString().split(' ')[0] ?? "N/A"}, "
      "End=${endDate?.toLocal().toString().split(' ')[0] ?? "N/A"}";

  DraftStorage.draftRequests.add(draft);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Saved to Draft Requests")),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Request Form"), backgroundColor: Colors.cyan),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              initialValue: selectedOrganization,
              hint: Text("Select Organization"),
              items: ["Other", "Organization A", "Organization B"]
                  .map((org) => DropdownMenuItem(value: org, child: Text(org)))
                  .toList(),
              onChanged: (value) => setState(() => selectedOrganization = value),
            ),
            SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: "Request Reason",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(startDate == null
                  ? "Select Start Date"
                  : "Start Date: ${startDate!.toLocal()}".split(' ')[0]),
              trailing: Icon(Icons.calendar_today, color: Colors.cyan),
              onTap: _pickStartDate,
            ),
            ListTile(
              title: Text(endDate == null
                  ? "Select End Date"
                  : "End Date: ${endDate!.toLocal()}".split(' ')[0]),
              trailing: Icon(Icons.calendar_today, color: Colors.cyan),
              onTap: _pickEndDate,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              onPressed: _saveToDraft,
              child: Text("Save to Draft"),
            ),
          ],
        ),
      ),
    );
  }
}
