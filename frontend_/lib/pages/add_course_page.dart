import 'package:flutter/material.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _attachExam = false;
  List<CourseModule> _modules = [
    CourseModule(
      title: 'Module 1: Introduction to Web Design',
      isExpanded: true,
      lessons: [
        CourseLesson(title: 'Lesson 1.1: History of the Web'),
        CourseLesson(title: 'Lesson 1.2: HTML & CSS Basics'),
      ],
    ),
    CourseModule(
      title: 'Module 2: Advanced CSS Techniques',
      isExpanded: false,
      lessons: [],
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
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Page Title
                      Text(
                        'Add New Course',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: isDark ? Colors.white : const Color(0xFF111318),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Form Card
                      _buildFormCard(isDark),
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
            color: isDark ? Colors.white.withOpacity(0.1) : const Color(0xFFf0f1f4),
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
        _buildNavLink('My Courses', isActive: true, isDark: isDark),
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
        fontWeight: FontWeight.w500,
        color: isActive 
            ? const Color(0xFF2463eb)
            : (isDark ? Colors.grey[300] : const Color(0xFF111318)),
      ),
    );
  }

  Widget _buildActionButtons(bool isDark) {
    return Row(
      children: [
        // Create Button
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF2463eb),
          ),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text(
              'Create',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        
        // Notifications
        _buildIconButton(
          icon: Icons.notifications,
          isDark: isDark,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        
        // Help
        _buildIconButton(
          icon: Icons.help,
          isDark: isDark,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        
        // User Avatar
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuD-8LxrlCFTggAqNJyQxx2U-zQ164aI1H2Mo0PhGuy_YK_zU8TWZF0RIIYvXoammMGb_T4eYGx4RI8thFgJBnFjpi9TA4ql8vslVgJi1M7lA2DVZaLLzYplxLFjyJRfXzQ37gEUvkkSAAYspGZ58AVY80Nq6n8otc6s__t83AZXEnBWf6tJG3w5ar1Gh1v1EJgd6ao-poTDxrmft9Sj3LThO49BzeFBgb30q0xqtSdlZXgrAQ7q8JT2b3H5wUZ-LJOVBrcEf9E_FFA',
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
    required bool isDark,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDark ? Colors.white.withOpacity(0.1) : const Color(0xFFf6f6f8),
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 20,
        color: isDark ? Colors.white : const Color(0xFF111318),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildFormCard(bool isDark) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111621).withOpacity(0.7) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Title & Description
          _buildBasicInfoSection(isDark),
          const SizedBox(height: 32),
          
          // Thumbnail Upload
          _buildThumbnailSection(isDark),
          const SizedBox(height: 32),
          
          // Course Content
          _buildCourseContentSection(isDark),
          const SizedBox(height: 32),
          
          // Settings
          _buildSettingsSection(isDark),
          const SizedBox(height: 32),
          
          // Action Buttons
          _buildActionButtonsSection(isDark),
        ],
      ),
    );
  }

  Widget _buildBasicInfoSection(bool isDark) {
    return Column(
      children: [
        // Course Title
        _buildFormField(
          label: 'Course Title',
          hintText: 'Enter the title of your course',
          controller: _titleController,
          isDark: isDark,
        ),
        const SizedBox(height: 24),
        
        // Course Description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[200] : const Color(0xFF111318),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 144,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1a202c) : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark ? Colors.grey[700]! : const Color(0xFFdbdee6),
                ),
              ),
              child: TextField(
                controller: _descriptionController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Provide a detailed description of the course',
                  hintStyle: TextStyle(color: const Color(0xFF616e89)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF111318),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey[200] : const Color(0xFF111318),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: const Color(0xFF616e89)),
            filled: true,
            fillColor: isDark ? const Color(0xFF1a202c) : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[700]! : const Color(0xFFdbdee6),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF2463eb),
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

  Widget _buildThumbnailSection(bool isDark) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Course Thumbnail',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.grey[200] : const Color(0xFF111318),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isDark ? Colors.grey[500]!.withOpacity(0.5) : Colors.grey[900]!.withOpacity(0.25),
            // Removed BorderStyle.dashed to use solid border
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.upload_file,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle file upload
                  },
                  child: Text(
                    'Upload a file',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2463eb),
                    ),
                  ),
                ),
                Text(
                  ' or drag and drop',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'PNG, JPG, GIF up to 10MB',
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.grey[500] : const Color(0xFF616e89),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

  Widget _buildCourseContentSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Course Content',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.grey[200] : const Color(0xFF111318),
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF2463eb).withOpacity(0.1),
              ),
              child: TextButton.icon(
                onPressed: _addModule,
                icon: Icon(
                  Icons.add,
                  size: 18,
                  color: const Color(0xFF2463eb),
                ),
                label: Text(
                  'Add Module',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2463eb),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: _modules.asMap().entries.map((entry) {
            final index = entry.key;
            final module = entry.value;
            return _buildModuleItem(module, index, isDark);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildModuleItem(CourseModule module, int index, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
        color: isDark ? const Color(0xFF111621) : const Color(0xFFf6f6f8),
      ),
      child: Column(
        children: [
          // Module Header
          ListTile(
            leading: Icon(
              Icons.drag_indicator,
              color: Colors.grey[500],
            ),
            title: Text(
              module.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : const Color(0xFF111318),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, size: 20, color: Colors.grey[600]),
                  onPressed: () => _editModule(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 20, color: Colors.grey[600]),
                  onPressed: () => _deleteModule(index),
                ),
                IconButton(
                  icon: Icon(
                    module.isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey[500],
                  ),
                  onPressed: () => _toggleModule(index),
                ),
              ],
            ),
          ),
          // Lessons (if expanded)
          if (module.isExpanded) _buildLessonsList(module, index, isDark),
        ],
      ),
    );
  }

  Widget _buildLessonsList(CourseModule module, int moduleIndex, bool isDark) {
  return Padding(
    padding: const EdgeInsets.only(left: 56, right: 16, bottom: 16),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: Column(
            children: [
              // Solid border instead of dashed (simpler approach)
              Container(
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Column(
                    children: module.lessons.asMap().entries.map((entry) {
                      final lessonIndex = entry.key;
                      final lesson = entry.value;
                      return _buildLessonItem(lesson, moduleIndex, lessonIndex, isDark);
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 36,
                margin: const EdgeInsets.only(left: 8),
                child: TextButton.icon(
                  onPressed: () => _addLesson(moduleIndex),
                  icon: Icon(
                    Icons.add,
                    size: 16,
                    color: isDark ? Colors.white : const Color(0xFF111318),
                  ),
                  label: Text(
                    'Add Lesson',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF111318),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: isDark ? const Color(0xFF1a202c) : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _buildLessonItem(CourseLesson lesson, int moduleIndex, int lessonIndex, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDark ? const Color(0xFF1a202c) : Colors.white,
      ),
      child: Row(
        children: [
          Icon(
            Icons.description,
            size: 16,
            color: isDark ? Colors.grey[300] : const Color(0xFF616e89),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              lesson.title,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey[300] : const Color(0xFF616e89),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, size: 16, color: Colors.grey[600]),
            onPressed: () => _editLesson(moduleIndex, lessonIndex),
          ),
          IconButton(
            icon: Icon(Icons.delete, size: 16, color: Colors.grey[600]),
            onPressed: () => _deleteLesson(moduleIndex, lessonIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.grey[200] : const Color(0xFF111318),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDark ? const Color(0xFF111621) : const Color(0xFFf6f6f8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Attach Exam to this Course',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.grey[200] : const Color(0xFF111318),
                ),
              ),
              Switch(
                value: _attachExam,
                onChanged: (value) {
                  setState(() {
                    _attachExam = value;
                  });
                },
                activeColor: const Color(0xFF2463eb),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtonsSection(bool isDark) {
    return Row(
      children: [
        Text(
          'Draft saved at 10:15 AM',
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.grey[500] : const Color(0xFF616e89),
          ),
        ),
        const Spacer(),
        Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDark ? Colors.white.withOpacity(0.1) : const Color(0xFFf6f6f8),
          ),
          child: TextButton(
            onPressed: _saveDraft,
            style: TextButton.styleFrom(
              foregroundColor: isDark ? Colors.white : const Color(0xFF111318),
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
            child: Text(
              'Save Draft',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF2463eb),
          ),
          child: TextButton(
            onPressed: _publishCourse,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
            child: Text(
              'Publish',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Action Methods
  void _addModule() {
    setState(() {
      _modules.add(CourseModule(
        title: 'Module ${_modules.length + 1}: New Module',
        isExpanded: false,
        lessons: [],
      ));
    });
  }

  void _editModule(int index) {
    // Implement module editing
    print('Edit module: $index');
  }

  void _deleteModule(int index) {
    setState(() {
      _modules.removeAt(index);
    });
  }

  void _toggleModule(int index) {
    setState(() {
      _modules[index] = _modules[index].copyWith(
        isExpanded: !_modules[index].isExpanded,
      );
    });
  }

  void _addLesson(int moduleIndex) {
    setState(() {
      _modules[moduleIndex].lessons.add(
        CourseLesson(title: 'Lesson ${_modules[moduleIndex].lessons.length + 1}: New Lesson'),
      );
    });
  }

  void _editLesson(int moduleIndex, int lessonIndex) {
    // Implement lesson editing
    print('Edit lesson: $moduleIndex, $lessonIndex');
  }

  void _deleteLesson(int moduleIndex, int lessonIndex) {
    setState(() {
      _modules[moduleIndex].lessons.removeAt(lessonIndex);
    });
  }

  void _saveDraft() {
    // Implement save draft functionality
    print('Save draft');
  }

  void _publishCourse() {
    // Implement publish functionality
    print('Publish course');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

// Data Models
class CourseModule {
  final String title;
  final bool isExpanded;
  final List<CourseLesson> lessons;

  CourseModule({
    required this.title,
    required this.isExpanded,
    required this.lessons,
  });

  CourseModule copyWith({
    String? title,
    bool? isExpanded,
    List<CourseLesson>? lessons,
  }) {
    return CourseModule(
      title: title ?? this.title,
      isExpanded: isExpanded ?? this.isExpanded,
      lessons: lessons ?? this.lessons,
    );
  }
}

class CourseLesson {
  final String title;

  CourseLesson({required this.title});
}