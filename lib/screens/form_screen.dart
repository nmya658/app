import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'age': '',
    'gender': '',
    'jaundice': '',
    'family_asd': '',
    'score': 0,
  };

  List<String> questions = [
    'Does your child look at you when you call his/her name?',
    'Does your child smile back when you smile?',
    'Does your child make eye contact during interactions?',
    'Does your child use gestures to communicate?',
    'Does your child show interest in other children?',
  ];

  Map<int, int> responses = {};

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      int totalScore = responses.values.fold(0, (sum, val) => sum + val);
      _formData['score'] = totalScore;
      print("Form data: $_formData");
      Navigator.pushNamed(context, '/realeye', arguments: _formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("In-App Autism Form"), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Child's Age"),
              keyboardType: TextInputType.number,
              onSaved: (value) => _formData['age'] = value!,
              validator: (value) => value!.isEmpty ? 'Enter age' : null,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Gender"),
              items: ['Male', 'Female'].map((gender) {
                return DropdownMenuItem(value: gender, child: Text(gender));
              }).toList(),
              onChanged: (value) => _formData['gender'] = value!,
              validator: (value) => value == null ? 'Select gender' : null,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Born with Jaundice?"),
              items: ['Yes', 'No'].map((val) {
                return DropdownMenuItem(value: val, child: Text(val));
              }).toList(),
              onChanged: (value) => _formData['jaundice'] = value!,
              validator: (value) => value == null ? 'Select one' : null,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Family History of ASD?"),
              items: ['Yes', 'No'].map((val) {
                return DropdownMenuItem(value: val, child: Text(val));
              }).toList(),
              onChanged: (value) => _formData['family_asd'] = value!,
              validator: (value) => value == null ? 'Select one' : null,
            ),
            SizedBox(height: 30),
            Text("Answer the following (0 = Never, 1 = Sometimes, 2 = Often)", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...List.generate(questions.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${index + 1}. ${questions[index]}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (score) {
                      return Row(
                        children: [
                          Radio(
                            value: score,
                            groupValue: responses[index],
                            onChanged: (value) {
                              setState(() {
                                responses[index] = value!;
                              });
                            },
                          ),
                          Text(score.toString()),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                ],
              );
            }),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text("Continue to Eye Test"),
            ),
          ]),
        ),
      ),
    );
  }
}
