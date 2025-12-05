import 'package:flutter/material.dart';

class CreateExamPage extends StatefulWidget {
  const CreateExamPage({super.key});

  @override
  State<CreateExamPage> createState() => _CreateExamPageState();
}

class _CreateExamPageState extends State<CreateExamPage> {
  final _examTitleController = TextEditingController();
  String? _selectedCourse;
  final List<ExamQuestion> _questions = [];
  int? _editingQuestionIndex;
  final Map<int, TextEditingController> _questionControllers = {};
  final Map<int, List<TextEditingController>> _optionControllers = {};
  
  final List<String> _courses = [
    'Introduction to Web Development',
    'Advanced Web Development',
    'Data Science with Python',
    'Digital Marketing Fundamentals',
    'Introduction to Graphic Design',
  ];

  @override
  void initState() {
    super.initState();
    // Ajouter une question par défaut
    _addQuestion(QuestionType.multipleChoice);
  }

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
                      // Page Header
                      _buildPageHeader(isDark),
                      const SizedBox(height: 32),
                      
                      // Exam Creation Form
                      _buildExamForm(isDark),
                      const SizedBox(height: 24),
                      
                      // Questions Section
                      _buildQuestionsSection(isDark),
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
        _buildNavLink('My Courses', isActive: false, isDark: isDark),
        const SizedBox(width: 36),
        _buildNavLink('Students', isActive: true, isDark: isDark),
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
            image: const DecorationImage(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create New Exam',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: isDark ? Colors.white : const Color(0xFF111318),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Build and customize your exam with different question types.',
          style: TextStyle(
            fontSize: 16,
            color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
          ),
        ),
      ],
    );
  }

  Widget _buildExamForm(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111621) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exam Title Section
          Text(
            'Exam Title',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF111318),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter the title of the exam.',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1a202c) : const Color(0xFFf0f1f4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: _examTitleController,
              decoration: InputDecoration(
                hintText: 'e.g., Midterm Exam - Web Development',
                hintStyle: TextStyle(
                  color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              style: TextStyle(
                color: isDark ? Colors.white : const Color(0xFF111318),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 32),
          
          // Select Course Section
          Text(
            'Select Course',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF111318),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1a202c) : const Color(0xFFf0f1f4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                value: _selectedCourse,
                onChanged: (value) {
                  setState(() {
                    _selectedCourse = value;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF111318),
                  fontSize: 16,
                ),
                dropdownColor: isDark ? const Color(0xFF1a202c) : Colors.white,
                icon: Icon(
                  Icons.expand_more,
                  color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                ),
                items: _courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                hint: Text(
                  'Select a course',
                  style: TextStyle(
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsSection(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111621) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Questions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF111318),
                ),
              ),
              const Spacer(),
              Text(
                'Total: ${_questions.length} question${_questions.length != 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          if (_questions.isEmpty) _buildEmptyQuestionsState(isDark),
          
          // Display existing questions
          ..._questions.asMap().entries.map((entry) {
            final index = entry.key;
            final question = entry.value;
            return _buildQuestionCard(question, index, isDark);
          }),
          
          // Question Type Selector
          _buildQuestionTypeSelector(isDark),
        ],
      ),
    );
  }

  Widget _buildEmptyQuestionsState(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.question_answer_outlined,
            size: 48,
            color: isDark ? Colors.grey[600] : Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No questions added yet',
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Click "Add Question" to begin building your exam.',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[500] : Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(ExamQuestion question, int index, bool isDark) {
    final isEditing = _editingQuestionIndex == index;
    
    // Initialiser les contrôleurs si nécessaire
    if (!_questionControllers.containsKey(index)) {
      _questionControllers[index] = TextEditingController(text: question.question);
    }
    
    if (question.type == QuestionType.multipleChoice && 
        question.options != null &&
        !_optionControllers.containsKey(index)) {
      _optionControllers[index] = question.options!
          .map((option) => TextEditingController(text: option))
          .toList();
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1a202c) : const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Q${index + 1}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF111318),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF374151) : const Color(0xFFe5e7eb),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _getQuestionTypeText(question.type),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.grey[300] : const Color(0xFF4b5563),
                  ),
                ),
              ),
              const Spacer(),
              
              // Bouton d'édition/sauvegarde
              if (!isEditing)
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 20,
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                  onPressed: () {
                    setState(() {
                      _editingQuestionIndex = index;
                    });
                  },
                ),
              
              if (isEditing)
                IconButton(
                  icon: Icon(
                    Icons.check,
                    size: 20,
                    color: const Color(0xFF2463eb),
                  ),
                  onPressed: () {
                    _saveQuestionEdit(index);
                  },
                ),
              
              // Bouton suppression
              IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: isDark ? Colors.red[300] : Colors.red[600],
                ),
                onPressed: () {
                  _deleteQuestion(index);
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Affichage/Édition de la question
          if (!isEditing)
            Text(
              question.question,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : const Color(0xFF111318),
              ),
            ),
          
          if (isEditing)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF2d3748) : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
                ),
              ),
              child: TextField(
                controller: _questionControllers[index],
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter your question...',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.grey[400] : Colors.grey[500],
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(12),
                ),
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF111318),
                  fontSize: 14,
                ),
              ),
            ),
          
          const SizedBox(height: 12),
          
          // Display options for multiple choice questions
          if (question.type == QuestionType.multipleChoice && question.options != null)
            Column(
              children: question.options!.asMap().entries.map((entry) {
                final optionIndex = entry.key;
                final option = entry.value;
                
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      // Bouton radio pour sélectionner la réponse correcte
                      GestureDetector(
                        onTap: () {
                          if (isEditing) {
                            setState(() {
                              _questions[index] = ExamQuestion(
                                type: question.type,
                                question: question.question,
                                options: question.options,
                                correctAnswer: optionIndex,
                                points: question.points,
                              );
                            });
                          }
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark ? Colors.grey[500]! : Colors.grey[400]!,
                              width: 2,
                            ),
                          ),
                          child: question.correctAnswer == optionIndex
                              ? Center(
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF2463eb),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // Affichage ou édition de l'option
                      if (!isEditing)
                        Expanded(
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark ? Colors.grey[300] : const Color(0xFF616e89),
                            ),
                          ),
                        ),
                      
                      if (isEditing)
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF2d3748) : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
                              ),
                            ),
                            child: TextField(
                              controller: _optionControllers[index]?[optionIndex] ??
                                  TextEditingController(text: option),
                              decoration: InputDecoration(
                                hintText: 'Option ${optionIndex + 1}',
                                hintStyle: TextStyle(
                                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                              ),
                              style: TextStyle(
                                color: isDark ? Colors.white : const Color(0xFF111318),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      
                      const SizedBox(width: 8),
                      
                      // Indicateur "Correct" pour la bonne réponse
                      if (question.correctAnswer == optionIndex)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF166534) : const Color(0xFFdcfce7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Correct',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: isDark ? const Color(0xFF4ade80) : const Color(0xFF166534),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          
          // Bouton annuler l'édition
          if (isEditing)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _editingQuestionIndex = null;
                  });
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionTypeSelector(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1a202c) : const Color(0xFFf0f1f4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<QuestionType>(
                  value: QuestionType.multipleChoice,
                  onChanged: (value) {
                    _addQuestion(value!);
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  style: TextStyle(
                    color: isDark ? Colors.white : const Color(0xFF111318),
                    fontSize: 16,
                  ),
                  dropdownColor: isDark ? const Color(0xFF1a202c) : Colors.white,
                  icon: Icon(
                    Icons.expand_more,
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                  items: QuestionType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(_getQuestionTypeText(type)),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF2463eb),
            ),
            child: TextButton.icon(
              onPressed: () {
                _addQuestion(QuestionType.multipleChoice);
              },
              icon: const Icon(
                Icons.add_circle,
                size: 20,
                color: Colors.white,
              ),
              label: const Text(
                'Add Question',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getQuestionTypeText(QuestionType type) {
    switch (type) {
      case QuestionType.multipleChoice:
        return 'Multiple Choice';
      case QuestionType.trueFalse:
        return 'True/False';
      case QuestionType.shortAnswer:
        return 'Short Answer';
      case QuestionType.essay:
        return 'Essay';
      default:
        return 'Multiple Choice';
    }
  }

  void _addQuestion(QuestionType type) {
    final question = ExamQuestion(
      type: type,
      question: _getSampleQuestion(type),
      options: type == QuestionType.multipleChoice
          ? ['<css>', '<style>', '<script>', '<link>']
          : null,
      correctAnswer: type == QuestionType.multipleChoice ? 1 : null,
    );
    
    setState(() {
      _questions.add(question);
    });
  }

  void _saveQuestionEdit(int index) {
    final questionController = _questionControllers[index];
    final optionControllers = _optionControllers[index];
    
    if (questionController != null) {
      final updatedQuestion = _questions[index];
      List<String>? updatedOptions;
      
      if (optionControllers != null && updatedQuestion.type == QuestionType.multipleChoice) {
        updatedOptions = optionControllers
            .map((controller) => controller.text.trim())
            .where((option) => option.isNotEmpty)
            .toList();
      }
      
      setState(() {
        _questions[index] = ExamQuestion(
          type: updatedQuestion.type,
          question: questionController.text.trim(),
          options: updatedOptions ?? updatedQuestion.options,
          correctAnswer: updatedQuestion.correctAnswer,
          points: updatedQuestion.points,
        );
        _editingQuestionIndex = null;
      });
    }
  }

  void _deleteQuestion(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Question'),
          content: Text('Are you sure you want to delete question ${index + 1}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _questions.removeAt(index);
                  _questionControllers.remove(index);
                  _optionControllers.remove(index);
                  // Réorganiser les indices
                  if (_editingQuestionIndex == index) {
                    _editingQuestionIndex = null;
                  }
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Delete', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  String _getSampleQuestion(QuestionType type) {
    switch (type) {
      case QuestionType.multipleChoice:
        return 'Which HTML tag is used to define an internal style sheet?';
      case QuestionType.trueFalse:
        return 'JavaScript is a statically-typed language.';
      case QuestionType.shortAnswer:
        return 'What does CSS stand for?';
      case QuestionType.essay:
        return 'Explain the difference between GET and POST HTTP methods.';
      default:
        return 'Sample question';
    }
  }

  @override
  void dispose() {
    _examTitleController.dispose();
    // Disposer tous les contrôleurs de questions
    for (var controller in _questionControllers.values) {
      controller.dispose();
    }
    for (var optionList in _optionControllers.values) {
      for (var controller in optionList) {
        controller.dispose();
      }
    }
    super.dispose();
  }
}

// Data Models
class ExamQuestion {
  final QuestionType type;
  final String question;
  final List<String>? options;
  final int? correctAnswer;
  final int points;

  ExamQuestion({
    required this.type,
    required this.question,
    this.options,
    this.correctAnswer,
    this.points = 1,
  });
}

enum QuestionType {
  multipleChoice,
  trueFalse,
  shortAnswer,
  essay,
}