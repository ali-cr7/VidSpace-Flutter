// ...existing code...
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_clone/core/widgets/custom_button.dart';
import 'package:youtube_clone/core/widgets/custom_text_from_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();
  final TextEditingController _confirmC = TextEditingController();
  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _passC.dispose();
    _confirmC.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loading = false);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final youtubeRed = const Color(0xFFFF0000);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Create account'),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 520),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.06)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  youtubeRed,
                                  youtubeRed.withOpacity(0.9),
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.person_add,
                              size: 56,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Name using CustomTextFormField
                          CustomTextFormField(
                            controller: _nameC,
                            labelText: 'Full name',
                            prefixIcon: Icons.person,
                            obscureText: false,
                            validator: (v) => (v == null || v.isEmpty)
                                ? 'Enter your name'
                                : null,
                          ),
                          const SizedBox(height: 12),

                          // Email using CustomTextFormField
                          CustomTextFormField(
                            controller: _emailC,
                            labelText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            obscureText: false,
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'Enter email';
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v))
                                return 'Enter valid email';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          // Password using CustomTextFormField
                          CustomTextFormField(
                            // obscureText: true,
                            controller: _passC,
                            labelText: 'Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                            validator: (v) {
                              if (v == null || v.isEmpty)
                                return 'Enter password';
                              if (v.length < 6) return 'Password too short';
                              return null;
                            },
                          ),

                          // Small toggle to show/hide passwords
                          const SizedBox(height: 12),

                          // Confirm password using CustomTextFormField
                          CustomTextFormField(
                            controller: _confirmC,
                            labelText: 'Confirm password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: _obscure,
                            validator: (v) {
                              if (v == null || v.isEmpty)
                                return 'Confirm password';
                              if (v != _passC.text)
                                return 'Passwords do not match';
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // Glassy red "Create account" button
                          CustomButton(
                            loading: _loading,
                            onPressed: _signup,
                            text: 'Create account',
                          ),

                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Already have an account? Sign in',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
