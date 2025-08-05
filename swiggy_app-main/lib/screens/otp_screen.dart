import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const OTPScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();

  void verifyOTP() async {
    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otpController.text.trim(),
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'OTP sent to ${widget.phoneNumber}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: otpController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Verify & Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
