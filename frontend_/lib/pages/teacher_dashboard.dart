import 'package:flutter/material.dart';
import '/pages/add_course_page.dart';
import '/pages/course_management_page.dart';
import '/pages/add_exam.dart';
import '/pages/analytics.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  bool _darkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF2463eb),
          surface: Color(0xFFf6f6f8),
        ),
        scaffoldBackgroundColor: const Color(0xFFf6f6f8),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2463eb),
          surface: Color(0xFF111621),
        ),
        scaffoldBackgroundColor: const Color(0xFF111621),
      ),
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: Column(
          children: [
            _buildTopNavBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWelcomeSection(),
                        const SizedBox(height: 40),
                        _buildStatsSection(),
                        const SizedBox(height: 48),
                        _buildQuickActionsSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: _darkMode ? const Color(0xFF1a1f2e) : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: _darkMode 
                ? Colors.white.withOpacity(0.1) 
                : const Color(0xFFe5e7eb),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        children: [
          _buildBrandSection(),
          const Spacer(),
          _buildNavigationLinks(),
          const SizedBox(width: 40),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildBrandSection() {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF2463eb),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(
            Icons.school,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'E-Learning Platform',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _darkMode ? Colors.white : const Color(0xFF111318),
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationLinks() {
    return Row(
      children: [
        _buildNavLink('Dashboard', isActive: true, onTap: () {}),
        const SizedBox(width: 32),
        _buildNavLink(
          'My Courses',
          isActive: false,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CourseManagementPage(),
              ),
            );
          },
        ),
        const SizedBox(width: 32),
        _buildNavLink('Students', isActive: false, onTap: () {}),
        const SizedBox(width: 32),
        _buildNavLink('Analytics', isActive: false, onTap: () {}),
      ],
    );
  }

  Widget _buildNavLink(String text, {bool isActive = false, VoidCallback? onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive 
                    ? const Color(0xFF2463eb) 
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive
                  ? (_darkMode ? Colors.white : const Color(0xFF111318))
                  : (_darkMode 
                      ? Colors.white.withOpacity(0.6) 
                      : const Color(0xFF6b7280)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        _buildIconButton(
          icon: _darkMode ? Icons.light_mode : Icons.dark_mode,
          onPressed: _toggleDarkMode,
        ),
        const SizedBox(width: 12),
        _buildIconButton(
          icon: Icons.notifications_outlined,
          onPressed: () {},
          showBadge: true,
        ),
        const SizedBox(width: 16),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF2463eb).withOpacity(0.3),
              width: 2,
            ),
            image: const DecorationImage(
              image: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuASUcFCim-VQ0GUCbt4tbOBXw_aLh4Br5NFSkFffH7HTjd6fcVf9pXO5I3cZzIagA_S8O06yEpAG5WDQojYsU7RtfyAAALKS7AhLcLWK2JtLev4TDqT8WnNS7wJajCn8eapx2TPur816-MOLOiVpDJ7VPN_qFYdhJHKcEnLqtVHjq2sxSorxt7aBgwfsX1ERCnCV-V2mnadJ2PEh_LRBdU5h7T1ba9rFqusSHms0ma7GiH3h9uQIwcrYSSWiLtKsJsp9nIbehDqQ5U',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool showBadge = false,
  }) {
    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _darkMode 
                ? Colors.white.withOpacity(0.08) 
                : const Color(0xFFf3f4f6),
          ),
          child: IconButton(
            icon: Icon(icon),
            iconSize: 20,
            color: _darkMode ? Colors.white : const Color(0xFF111318),
            onPressed: onPressed,
            padding: EdgeInsets.zero,
          ),
        ),
        if (showBadge)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFFef4444),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back, Anne! 👋',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: _darkMode ? Colors.white : const Color(0xFF111318),
            height: 1.2,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Here's a summary of your activity.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: _darkMode 
                ? Colors.white.withOpacity(0.6) 
                : const Color(0xFF6b7280),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 800 ? 3 : 1;
        
        return GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.4,
          ),
          children: [
            _buildStatCard(
              icon: Icons.school_outlined,
              title: 'Total Courses',
              value: '12',
              change: '+2 this month',
              isPositive: true,
            ),
            _buildStatCard(
              icon: Icons.people_outline,
              title: 'Total Students',
              value: '284',
              change: '+18 this month',
              isPositive: true,
            ),
            _buildStatCard(
              icon: Icons.quiz_outlined,
              title: 'Exams Created',
              value: '35',
              change: '+5 this month',
              isPositive: true,
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required String change,
    required bool isPositive,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _darkMode ? const Color(0xFF1a1f2e) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: _darkMode 
            ? Border.all(color: Colors.white.withOpacity(0.1)) 
            : null,
        boxShadow: _darkMode
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2463eb).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF2463eb),
                  size: 24,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isPositive
                      ? const Color(0xFF10b981).withOpacity(0.1)
                      : const Color(0xFFef4444).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 12,
                      color: isPositive 
                          ? const Color(0xFF10b981) 
                          : const Color(0xFFef4444),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      change,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isPositive 
                            ? const Color(0xFF10b981) 
                            : const Color(0xFFef4444),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: _darkMode ? Colors.white : const Color(0xFF111318),
                  height: 1.2,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _darkMode 
                      ? Colors.white.withOpacity(0.6) 
                      : const Color(0xFF6b7280),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: _darkMode ? Colors.white : const Color(0xFF111318),
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildActionButton(
              icon: Icons.add,
              text: 'Add New Course',
              isPrimary: true,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddCoursePage(),
                  ),
                );
              },
            ),
            _buildActionButton(
              icon: Icons.edit_document,
              text: 'Create New Exam',
              isPrimary: true,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateExamPage(),
                  ),
                );
              },
            ),
            _buildActionButton(
              icon: Icons.visibility,
              text: 'View All Students',
              isPrimary: false,
              onPressed: () {},
            ),
            _buildActionButton(
              icon: Icons.bar_chart,
              text: 'View Analytics',
              isPrimary: false,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AnalyticsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String text,
    required bool isPrimary,
    required VoidCallback onPressed,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isPrimary
              ? const Color(0xFF2463eb)
              : (_darkMode
                  ? Colors.white.withOpacity(0.08)
                  : const Color(0xFFf3f4f6)),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: const Color(0xFF2463eb).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: isPrimary
                        ? Colors.white
                        : (_darkMode 
                            ? Colors.white 
                            : const Color(0xFF2463eb)),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isPrimary
                          ? Colors.white
                          : (_darkMode 
                              ? Colors.white 
                              : const Color(0xFF2463eb)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}