import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swiggy_app/screens/home_page.dart';
import 'otp_screen.dart';

class PhoneAuthUI extends StatefulWidget {
  const PhoneAuthUI({super.key});

  @override
  State<PhoneAuthUI> createState() => _PhoneAuthUIState();
}

class _PhoneAuthUIState extends State<PhoneAuthUI> {
  final TextEditingController phoneController = TextEditingController();
  String completePhone = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendOTP() async {
  final phone = completePhone;

  if (phone.isEmpty || phone.length < 10) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Please enter a valid phone number")),
  );
  return;
}

  await _auth.verifyPhoneNumber(
    phoneNumber: phone,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    },
    verificationFailed: (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Verification failed")),
      );
    },
    codeSent: (verificationId, resendToken) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OTPScreen(
            phoneNumber: phone,
            verificationId: verificationId,
          ),
        ),
      );
    },
    codeAutoRetrievalTimeout: (id) {},
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset('assets/images/burger.png', height: 160),
              const SizedBox(height: 30),
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please enter your phone number to continue',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              IntlPhoneField(
                controller: phoneController,
                initialCountryCode: 'IN',
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                onChanged: (phone) {
                  completePhone = phone.completeNumber;
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: sendOTP,
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
