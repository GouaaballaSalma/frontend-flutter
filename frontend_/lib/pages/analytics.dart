import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  String _selectedTimeRange = 'Last 7 Days';
  String _selectedCourseFilter = 'All Courses';
  
  final List<String> _timeRanges = ['Last 7 Days', 'Last 30 Days', 'Last 3 Months', 'Last Year'];
  final List<String> _courseFilters = ['All Courses', 'Algebra 101', 'History of Art', 'Chemistry Basics'];

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Page Header avec filtres
                      _buildPageHeaderWithFilters(isDark),
                      const SizedBox(height: 32),
                      
                      // Analytics Overview Cards
                      _buildOverviewCards(isDark),
                      const SizedBox(height: 32),
                      
                      // Emotion Distribution and Frustration Timeline
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: _buildEmotionDistribution(isDark),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            flex: 3,
                            child: _buildFrustrationTimeline(isDark),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      
                      // Course Level Emotional Insights avec boutons d'export
                      _buildCourseInsightsWithExport(isDark),
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
        _buildNavLink('Dashboard', isActive: false, isDark: isDark, onTap: () {
          Navigator.pop(context);
        }),
        const SizedBox(width: 36),
        _buildNavLink('Courses', isActive: false, isDark: isDark, onTap: () {}),
        const SizedBox(width: 36),
        _buildNavLink('Students', isActive: false, isDark: isDark, onTap: () {}),
        _buildNavLink('Analytics', isActive: true, isDark: isDark, onTap: () {}),
      ],
    );
  }

  Widget _buildNavLink(String text, {bool isActive = false, required bool isDark, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: isActive 
                  ? const Color(0xFF2463eb)
                  : (isDark ? Colors.grey[300] : const Color(0xFF616e89)),
            ),
          ),
        ),
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

  Widget _buildPageHeaderWithFilters(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Analytics Overview',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: isDark ? Colors.white : const Color(0xFF111318),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Monitor student engagement and well-being with AI-powered insights.',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                  ),
                ),
              ],
            ),
            
            // Boutons de filtres
            Row(
              children: [
                // Time Range Filter
                _buildFilterDropdown(
                  value: _selectedTimeRange,
                  items: _timeRanges,
                  isDark: isDark,
                  onChanged: (value) {
                    setState(() {
                      _selectedTimeRange = value!;
                    });
                  },
                ),
                const SizedBox(width: 16),
                
                // Course Filter
                _buildFilterDropdown(
                  value: _selectedCourseFilter,
                  items: _courseFilters,
                  isDark: isDark,
                  onChanged: (value) {
                    setState(() {
                      _selectedCourseFilter = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterDropdown({
    required String value,
    required List<String> items,
    required bool isDark,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: 160,
      height: 40,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1a202c) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            icon: Icon(
              Icons.expand_more,
              size: 20,
              color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
            ),
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white : const Color(0xFF111318),
            ),
            dropdownColor: isDark ? const Color(0xFF1a202c) : Colors.white,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewCards(bool isDark) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 1.2,
      children: [
        _buildStatCard(
          title: 'Total Students Monitored',
          value: '128',
          change: '+3% from last week',
          isPositive: true,
          isDark: isDark,
        ),
        _buildStatCard(
          title: 'Total Learning Hours',
          value: '1,452',
          change: '+8% from last week',
          isPositive: true,
          isDark: isDark,
        ),
        _buildStatCard(
          title: 'Frustration Events (Week)',
          value: '312',
          change: '-3% from last week',
          isPositive: false,
          isDark: isDark,
        ),
        _buildStatCard(
          title: 'Average Course Completion',
          value: '78%',
          change: '+2% from last week',
          isPositive: true,
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String change,
    required bool isPositive,
    required bool isDark,
  }) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111318),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: isPositive ? const Color(0xFF10b981) : const Color(0xFFef4444),
              ),
              const SizedBox(width: 4),
              Text(
                change,
                style: TextStyle(
                  fontSize: 14,
                  color: isPositive ? const Color(0xFF10b981) : const Color(0xFFef4444),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

 Widget _buildEmotionDistribution(bool isDark) {
  final List<PieChartSectionData> pieChartSections = [
    PieChartSectionData(
      color: const Color(0xFF10b981), // Green for Happy
      value: 45,
      title: '45%',
      radius: 40,
      titleStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xFF6b7280), // Grey for Neutral
      value: 25,
      title: '25%',
      radius: 40,
      titleStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xFFef4444), // Red for Sad/Angry
      value: 15,
      title: '15%',
      radius: 40,
      titleStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xFFf59e0b), // Orange for Surprise
      value: 10,
      title: '10%',
      radius: 40,
      titleStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xFF8b5cf6), // Purple for Fear/Disgust
      value: 5,
      title: '5%',
      radius: 40,
      titleStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];

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
        Text(
          'Emotion Distribution',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : const Color(0xFF111318),
          ),
        ),
        const SizedBox(height: 24),
        
        // Pie Chart with Legend
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pie Chart
            Expanded(
              flex: 2,
              child: Container(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                    sections: pieChartSections,
                  ),
                ),
              ),
            ),
            
            const SizedBox(width: 24),
            
            // Legend
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _buildEmotionLegendItem('Happy', 45, const Color(0xFF10b981), isDark),
                  const SizedBox(height: 12),
                  _buildEmotionLegendItem('Neutral', 25, const Color(0xFF6b7280), isDark),
                  const SizedBox(height: 12),
                  _buildEmotionLegendItem('Sad / Angry', 15, const Color(0xFFef4444), isDark),
                  const SizedBox(height: 12),
                  _buildEmotionLegendItem('Surprise', 10, const Color(0xFFf59e0b), isDark),
                  const SizedBox(height: 12),
                  _buildEmotionLegendItem('Fear / Disgust', 5, const Color(0xFF8b5cf6), isDark),
                ],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 32),
        
        
        const SizedBox(height: 16),
        
   
      ],
    ),
  );
}

Widget _buildEmotionLegendItem(String emotion, int percentage, Color color, bool isDark) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            emotion,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[300] : const Color(0xFF111318),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$percentage%',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF111318),
            ),
          ),
        ),
      ],
    ),
  );
}
  Widget _buildDayChartBar(String day, double height, Color color, bool isDark) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${height.toInt()}%',
            style: TextStyle(
              fontSize: 10,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            day,
            style: TextStyle(
              fontSize: 10,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrustrationTimeline(bool isDark) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Frustration Timeline',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF111318),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF374151) : const Color(0xFFf3f4f6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.timeline, size: 16, color: Color(0xFFef4444)),
                    const SizedBox(width: 6),
                    Text(
                      '12 Spikes',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF111318),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '-3% from last week',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
            ),
          ),
          const SizedBox(height: 32),
          
          // Last 7 Days Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last 7 Days',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF111318),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Frustration Chart
          Container(
            height: 180,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildFrustrationBar(40, isDark),
                _buildFrustrationBar(60, isDark),
                _buildFrustrationBar(85, isDark),
                _buildFrustrationBar(55, isDark),
                _buildFrustrationBar(70, isDark),
                _buildFrustrationBar(95, isDark),
                _buildFrustrationBar(45, isDark),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Mon', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Tue', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Wed', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Thu', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Fri', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Sat', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Sun', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFrustrationBar(double height, bool isDark) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${height.toInt()}',
              style: TextStyle(
                fontSize: 10,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: height,
              width: 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFef4444),
                    const Color(0xFFf97316),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseInsightsWithExport(bool isDark) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Course Level Emotional Insights',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF111318),
                ),
              ),
              
              // Boutons d'export
              Row(
                children: [
                  // Bouton Export PDF
                  _buildExportButton(
                    icon: Icons.picture_as_pdf,
                    text: 'Export PDF',
                    isDark: isDark,
                    onPressed: () {
                      _exportPDF();
                    },
                  ),
                  const SizedBox(width: 12),
                  
                  // Bouton Export CSV
                  _buildExportButton(
                    icon: Icons.table_chart,
                    text: 'Export CSV',
                    isDark: isDark,
                    onPressed: () {
                      _exportCSV();
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Table
          SingleChildScrollView(
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
                      'COURSE NAME',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'AVG MOOD',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'FRUSTRATION %',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ENGAGEMENT %',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'AI RECOMMENDATION',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.grey[400] : const Color(0xFF616e89),
                      ),
                    ),
                  ),
                ],
                rows: [
                  _buildCourseRow(
                    'Algebra 101',
                    'Neutral',
                    22,
                    65,
                    'Review Lesson 5',
                    isDark,
                  ),
                  _buildCourseRow(
                    'History of Art',
                    'Happy',
                    8,
                    88,
                    'Add Bonus Content',
                    isDark,
                  ),
                  _buildCourseRow(
                    'Chemistry Basics',
                    'Frustrated',
                    41,
                    45,
                    'Simplify Quiz #2',
                    isDark,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExportButton({
    required IconData icon,
    required String text,
    required bool isDark,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDark ? const Color(0xFF1a202c) : const Color(0xFFf0f1f4),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
        ),
      ),
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 16,
          color: isDark ? Colors.grey[300] : const Color(0xFF616e89),
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.grey[300] : const Color(0xFF616e89),
            fontWeight: FontWeight.w500,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  DataRow _buildCourseRow(
    String courseName,
    String mood,
    int frustrationPercent,
    int engagementPercent,
    String recommendation,
    bool isDark,
  ) {
    Color moodColor = const Color(0xFF6b7280); // Default neutral
    if (mood == 'Happy') {
      moodColor = const Color(0xFF10b981);
    } else if (mood == 'Frustrated') {
      moodColor = const Color(0xFFef4444);
    }

    return DataRow(
      cells: [
        DataCell(
          Text(
            courseName,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white : const Color(0xFF111318),
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: moodColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                mood,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey[300] : const Color(0xFF111318),
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            '$frustrationPercent%',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF111318),
            ),
          ),
        ),
        DataCell(
          Text(
            '$engagementPercent%',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF111318),
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1e3a8a) : const Color(0xFFdbeafe),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              recommendation,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isDark ? const Color(0xFF93c5fd) : const Color(0xFF1e40af),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _exportPDF() {
    // Fonctionnalité d'export PDF
    // Dans une vraie app, vous utiliseriez un package comme printing
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Export PDF'),
          content: const Text('PDF export functionality would be implemented here.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _exportCSV() {
    // Fonctionnalité d'export CSV
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Export CSV'),
          content: const Text('CSV export functionality would be implemented here.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}