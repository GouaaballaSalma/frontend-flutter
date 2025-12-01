import 'package:flutter/material.dart';
import '/pages/add_course_page.dart';

class CourseManagementPage extends StatefulWidget {
  const CourseManagementPage({super.key});

  @override
  State<CourseManagementPage> createState() => _CourseManagementPageState();
}

class _CourseManagementPageState extends State<CourseManagementPage> {
  final _searchController = TextEditingController();
  List<Course> _courses = [
    Course(
      title: 'Introduction to Graphic Design',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAN3iiCFJocNzPdGMTEUfQp2yuGAh4Q83TL6VHXn7G5MP_0YjeoHwUtz4JarU4CtABtB_g_4cUVxNY3hQnSN5dsGZpOl1RAPNAirJi3K7gDgVPOqZcKhAoZctkE9ytslrGHmKu3XGmtOouxmw8R5fZ6H1Zz_0YUAQvxZe4VUqdk_NHpbH7iGhZ3VaAms1B0PWoZ3nejf0caxY83HFQya1JMGByA9jVCufNBxUr3P6L2YRoy2xMASkhHYvkPlFNCcDYhhz5ST5xFzcQ',
      students: 154,
      status: CourseStatus.published,
      createdDate: 'Jan 15, 2024',
    ),
    Course(
      title: 'Advanced Web Development',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBVpWTphDeEM1qQVSO7fqha0DDEIudc8QBYK91a29DLWVkyqfvfLoubujh_QBbMLwPUV5tRbpqAR46BGBa7RXl_Yge4W66D3FH5ZcNa8JSoCOB1ifnTkp4xVAketqo8ZtYrQf4t2oXngV20VGSCRQXjkvr2Q-lg0CLZtsq7S__12CXxVCH-cN6-oGULRqVlgaA4rL9A6gWzmA8b8HApf4DlJd38brrIUhH-oQFgtUJRSHvW1Oq1HfFIb4s4k6z4VqG3wJolav-Kkmo',
      students: 88,
      status: CourseStatus.published,
      createdDate: 'Dec 02, 2023',
    ),
    Course(
      title: 'Data Science with Python',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAUPGjNVwJhAdgNfZEPIodLoZ225gcLO0VzMmNLEg7_RRC2IHJUmCMK_WWLhvvKOT0qUguNWtge01XNYcFyyMF1obDeXnDxEMe3giq1sN79WpxByT1uZiGBft-Hpmj8cEsEOFC4bsqq5NQLUl3vOI_AXOjPBowmNajqMNzqSUmSTKlPdNuAmMKSWI_oUFxlzXV7gS8jY91CsDCrASKM_J3PWG13Pwqa7xBZJ2GLxv2kE_feIY05L3kuaNQ6uOfhqZyNZkseNw-5Rh8',
      students: 210,
      status: CourseStatus.draft,
      createdDate: 'Nov 21, 2023',
    ),
    Course(
      title: 'Digital Marketing Fundamentals',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAxLRh1UlB9TvpNf0nt3tkcLqpKxnbPa6QGyJtQkBPxRx1uBhz3ouZM1cJhWgVL24FN_J6Iwt_OuYXbjmGo4Uousbx4qWL4W5RQX-aLkbUVMyP8jIy-qlrUU0F-VQDbAXNZBieDOkC93oUeO7CmiehmN_65dXzwjtIYuRCiVWZLbLMRef7ZqHThwZcOQ9SsT4aHRFILoRbdMYp84idslI0h24_UFHfAFu6ITJdZR6Q-2WjkTaQI5dXQQPWAUkUGx2fV3d8xSock00w',
      students: 12,
      status: CourseStatus.archived,
      createdDate: 'Aug 05, 2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF111621) : const Color(0xFFf6f6f8),
      body: Column(
        children: [
          // Top Navigation Bar
          _buildTopNavBar(isDark),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    children: [
                      // Page Header
                      _buildPageHeader(isDark),
                      const SizedBox(height: 24),
                      
                      // Search and Filters
                      _buildSearchAndFilters(isDark),
                      const SizedBox(height: 24),
                      
                      // Courses Table
                      _buildCoursesTable(isDark),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNavBar(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111621) : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      child: Row(
        children: [
          // Logo and Brand
          _buildBrandSection(isDark),
          const Spacer(),
          
          // Navigation Links
          _buildNavigationLinks(isDark),
          const SizedBox(width: 32),
          
          // Action Buttons
          _buildActionButtons(isDark),
        ],
      ),
    );
  }

  Widget _buildBrandSection(bool isDark) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          color: const Color(0xFF2463eb),
          child: const Icon(
            Icons.school,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'E-Learning Platform',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF111318),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationLinks(bool isDark) {
    return Row(
      children: [
        _buildNavLink('Dashboard', isActive: false, isDark: isDark),
        const SizedBox(width: 36),
        _buildNavLink('Courses', isActive: true, isDark: isDark),
        const SizedBox(width: 36),
        _buildNavLink('Students', isActive: false, isDark: isDark),
        const SizedBox(width: 36),
        _buildNavLink('Analytics', isActive: false, isDark: isDark),
      ],
    );
  }

  Widget _buildNavLink(String text, {bool isActive = false, required bool isDark}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
        color: isActive 
            ? const Color(0xFF2463eb)
            : (isDark ? Colors.grey[300] : const Color(0xFF616e89)),
      ),
    );
  }

  Widget _buildActionButtons(bool isDark) {
    return Row(
      children: [
        // Notifications
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDark ? const Color(0xFF1a202c) : const Color(0xFFf0f1f4),
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications),
            iconSize: 20,
            color: isDark ? Colors.grey[200] : const Color(0xFF111318),
            onPressed: () {},
            padding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(width: 16),
        
        // User Avatar
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAoL-6FniSR1nBwFqUZamxYjivUPlP5dApzZWKovGhcUmkVqy6oqxXRAdUfG15eNxo6w-qoxkP0EvzO2dw-aTBpuKIuQb4jCRivjsCAdviqFI04XYb8M9nASogPkuiZhMvT1UXI22SWXYiFHIfwjmirF3PR495ncHOq9UudYhyi-T-IVQLLnhVNiYKwF6mLw8U15qyQjagVUr-JHECxlTYw3K5LwaLIaO_18hpeZTVEoPl0nFaC1a-6ZeqcHubBeXHFMrM6SY38oR8',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageHeader(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Management',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: isDark ? Colors.white : const Color(0xFF111318),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Manage, edit, and analyze your course performance.',
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
              ),
            ),
          ],
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF2463eb),
          ),
          child: TextButton.icon(
            onPressed: () {
              // Navigate to add course page
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddCoursePage()),
              );
            },
            icon: const Icon(
              Icons.add_circle,
              size: 20,
              color: Colors.white,
            ),
            label: const Text(
              'Create New Course',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchAndFilters(bool isDark) {
    return Column(
      children: [
        // Search Bar
        Row(
          children: [
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF111621) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by course title...',
                    hintStyle: TextStyle(
                      color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(
                    color: isDark ? Colors.grey[200] : const Color(0xFF111318),
                    fontSize: 16,
                  ),
                  onChanged: (value) {
                    // Implement search functionality
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Filters
        Row(
          children: [
            _buildFilterButton(
              text: 'Status: All',
              isDark: isDark,
              onPressed: () {},
            ),
            const SizedBox(width: 12),
            _buildFilterButton(
              text: 'Category',
              isDark: isDark,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterButton({
    required String text,
    required bool isDark,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111621) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: isDark ? Colors.grey[200] : const Color(0xFF111318),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.expand_more,
              size: 20,
              color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoursesTable(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111621) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 800),
          child: DataTable(
            headingRowColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return isDark ? Colors.grey[800]!.withOpacity(0.5) : Colors.grey[50];
              },
            ),
            dataRowColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return isDark ? const Color(0xFF111621) : Colors.white;
              },
            ),
            columns: [
              DataColumn(
                label: Text(
                  'COURSE TITLE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'STUDENTS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'STATUS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'ACTIONS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                ),
              ),
            ],
            rows: _courses.map((course) => _buildCourseRow(course, isDark)).toList(),
          ),
        ),
      ),
    );
  }

  DataRow _buildCourseRow(Course course, bool isDark) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(course.thumbnailUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : const Color(0xFF111318),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Created on ${course.createdDate}',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            course.students.toString(),
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: _getStatusColor(course.status, isDark),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _getStatusText(course.status),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _getStatusTextColor(course.status, isDark),
              ),
            ),
          ),
        ),
        DataCell(
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 20,
              color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
            ),
            onPressed: () {
              _showCourseActions(course);
            },
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(CourseStatus status, bool isDark) {
    switch (status) {
      case CourseStatus.published:
        return isDark ? const Color(0xFF166534) : const Color(0xFFdcfce7);
      case CourseStatus.draft:
        return isDark ? const Color(0xFF374151) : const Color(0xFFf3f4f6);
      case CourseStatus.archived:
        return isDark ? const Color(0xFF854d0e) : const Color(0xFFfef9c3);
    }
  }

  Color _getStatusTextColor(CourseStatus status, bool isDark) {
    switch (status) {
      case CourseStatus.published:
        return isDark ? const Color(0xFF4ade80) : const Color(0xFF166534);
      case CourseStatus.draft:
        return isDark ? const Color(0xFFd1d5db) : const Color(0xFF374151);
      case CourseStatus.archived:
        return isDark ? const Color(0xFFfacc15) : const Color(0xFF854d0e);
    }
  }

  String _getStatusText(CourseStatus status) {
    switch (status) {
      case CourseStatus.published:
        return 'Published';
      case CourseStatus.draft:
        return 'Draft';
      case CourseStatus.archived:
        return 'Archived';
    }
  }

  void _showCourseActions(Course course) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Course'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to edit course
                },
              ),
              ListTile(
                leading: const Icon(Icons.visibility),
                title: const Text('View Course'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to view course
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Manage Students'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to manage students
                },
              ),
              ListTile(
                leading: const Icon(Icons.archive),
                title: const Text('Archive Course'),
                onTap: () {
                  Navigator.pop(context);
                  // Archive course
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Delete Course', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  // Delete course
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// Data Models
class Course {
  final String title;
  final String thumbnailUrl;
  final int students;
  final CourseStatus status;
  final String createdDate;

  Course({
    required this.title,
    required this.thumbnailUrl,
    required this.students,
    required this.status,
    required this.createdDate,
  });
}

enum CourseStatus {
  published,
  draft,
  archived,
}