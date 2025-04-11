import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/auth_service.dart';
import 'dart:convert';
import 'login.dart';
import 'registration.dart';

class ApiTestScreen extends StatefulWidget {
  @override
  _ApiTestScreenState createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  String _status = 'Not tested yet';
  bool _isLoading = false;
  String _errorDetails = '';

  Future<void> _testConnection() async {
    setState(() {
      _isLoading = true;
      _status = 'Testing connection...';
      _errorDetails = '';
    });

    try {
      final response = await http.get(
        Uri.parse('http://192.168.103.190:3000/api'),
        headers: {'Content-Type': 'application/json'},
      ).timeout(
        Duration(seconds: 5),
      );
      
      setState(() {
        if (response.statusCode == 200) {
          _status = '✅ Server is reachable!';
          _errorDetails = 'Response: ${response.body}';
        } else {
          _status = '❌ Server responded with error';
          _errorDetails = 'Status Code: ${response.statusCode}\nResponse: ${response.body}';
        }
      });
    } catch (e) {
      setState(() {
        _status = '❌ Connection failed';
        _errorDetails = 'Error: $e\n\nTroubleshooting:\n1. Make sure your backend is running on port 3000\n2. Check if your backend has CORS enabled\n3. Make sure your phone and computer are on the same WiFi network';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Connection Test'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Testing connection to:\nhttp://192.168.103.190:3000/api',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _testConnection,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text('Test Connection'),
              ),
              SizedBox(height: 20),
              Text(
                _status,
                style: TextStyle(
                  fontSize: 16,
                  color: _status.startsWith('✅') ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              if (_errorDetails.isNotEmpty) ...[
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _errorDetails,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
              if (_status.startsWith('✅')) ...[
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text('Go to Login'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrationScreen()),
                        );
                      },
                      child: Text('Go to Register'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
} 