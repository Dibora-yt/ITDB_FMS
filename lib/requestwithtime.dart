import 'package:flutter/material.dart';
import 'package:maintenance_itdb/draft_storage.dart';

class RequestWithTimePage extends StatefulWidget {
  const RequestWithTimePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RequestWithTimePageState createState() => _RequestWithTimePageState();
}

class _RequestWithTimePageState extends State<RequestWithTimePage> {
  String? selectedOrganization;
  DateTime? selectedDate;
  TimeOfDay? leaveTime;
  TimeOfDay? returnTime;
  final TextEditingController reasonController = TextEditingController();

  // Draft storage (for demo purposes)

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _pickLeaveTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) setState(() => leaveTime = picked);
  }

  Future<void> _pickReturnTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) setState(() => returnTime = picked);
  }

  void _saveToDraft() {
  final draft = "Draft Request (Time): Org=${selectedOrganization ?? "N/A"}, "
      "Reason=${reasonController.text}, "
      "Date=${selectedDate?.toLocal().toString().split(' ')[0] ?? "N/A"}, "
      "Leave=${leaveTime?.format(context) ?? "N/A"}, "
      "Return=${returnTime?.format(context) ?? "N/A"}";

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
              value: selectedOrganization,
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
              title: Text(selectedDate == null
                  ? "Select Date"
                  : "Date: ${selectedDate!.toLocal()}".split(' ')[0]),
              trailing: Icon(Icons.calendar_today, color: Colors.cyan),
              onTap: _pickDate,
            ),
            ListTile(
              title: Text(leaveTime == null
                  ? "Select Leave Time"
                  : "Leave Time: ${leaveTime!.format(context)}"),
              trailing: Icon(Icons.access_time, color: Colors.cyan),
              onTap: _pickLeaveTime,
            ),
            ListTile(
              title: Text(returnTime == null
                  ? "Select Return Time"
                  : "Return Time: ${returnTime!.format(context)}"),
              trailing: Icon(Icons.access_time, color: Colors.cyan),
              onTap: _pickReturnTime,
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
