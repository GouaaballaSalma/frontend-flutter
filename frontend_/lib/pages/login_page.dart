import 'package:flutter/material.dart';
import '/pages/teacher_dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      body: Container(
        color: isDark ? const Color(0xFF111621) : const Color(0xFFf6f6f8),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Section
                _buildLogoSection(),
                const SizedBox(height: 32),
                
                // Form Card
                _buildFormCard(isDark),
                const SizedBox(height: 24),
                
                // Secondary Action
                _buildSecondaryAction(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        // Book/Education Icon
        Icon(
          Icons.school_outlined,
          size: 40,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 16),
        Text(
          'Sign in to your account',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFormCard(bool isDark) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111621) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isDark ? Border.all(color: Colors.white.withOpacity(0.1)) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Email Field
          _buildEmailField(isDark),
          const SizedBox(height: 24),
          
          // Password Field
          _buildPasswordField(isDark),
          const SizedBox(height: 24),
          
          // Sign In Button
          _buildSignInButton(),
          const SizedBox(height: 24),
          
          // Social Sign-in Divider
          _buildSocialDivider(isDark),
          const SizedBox(height: 24),
          
          // Social Buttons
          _buildSocialButtons(isDark),
        ],
      ),
    );
  }

  Widget _buildEmailField(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey[300] : const Color(0xFF111318),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            hintStyle: TextStyle(color: const Color(0xFF616e89)),
            filled: true,
            fillColor: isDark ? const Color(0xFF1a202c) : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[600]! : const Color(0xFFdbdee6),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF111318),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[300] : const Color(0xFF111318),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to forgot password page
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: TextStyle(color: const Color(0xFF616e89)),
            filled: true,
            fillColor: isDark ? const Color(0xFF1a202c) : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[600]! : const Color(0xFFdbdee6),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF616e89),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF111318),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // Handle sign in logic
          _handleSignIn();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2463eb),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('Sign In'),
      ),
    );
  }

  Widget _buildSocialDivider(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: isDark ? Colors.grey[600] : Colors.grey[300],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Or continue with',
            style: TextStyle(
              color: isDark ? Colors.grey[400] : Colors.grey[500],
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: isDark ? Colors.grey[600] : Colors.grey[300],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButtons(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: _buildSocialButton(
            icon: Icons.g_mobiledata,
            text: 'Google',
            isDark: isDark,
            onPressed: () {
              // Handle Google sign in
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSocialButton(
            icon: Icons.window_outlined,
            text: 'Microsoft',
            isDark: isDark,
            onPressed: () {
              // Handle Microsoft sign in
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    required bool isDark,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isDark ? const Color(0xFF1a202c) : Colors.white,
        foregroundColor: isDark ? Colors.grey[200] : const Color(0xFF374151),
        side: BorderSide(
          color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            // Navigate to sign up page
          },
          child: Text(
            'Create an Account',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

    // In the _handleSignIn method, replace the print statement with:
  void _handleSignIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    
    // Add your authentication logic here
    print('Email: $email, Password: $password');
    
    // Navigate to dashboard after successful login
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const TeacherDashboard()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}