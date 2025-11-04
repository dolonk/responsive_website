import 'package:flutter/material.dart';
import 'widgets/load_more/load_more_section.dart';
import 'widgets/hero/portfolio_hero_section.dart';
import 'widgets/filter_bar/filter_bar_section.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/data_layer/model/project_model.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/features/portfolio/widgets/project_grid/project_grid_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  String _selectedFilter = 'All';
  bool _showStickyFilter = false;
  final GlobalKey _filterBarKey = GlobalKey();

  // Load More state
  int _displayedCount = 6;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupScrollListener();
    });
  }

  void _setupScrollListener() {
    final scrollController = PrimaryScrollController.of(context);
    scrollController.addListener(() {
      _onScroll(scrollController);
    });
  }

  void _onScroll(ScrollController controller) {
    final RenderBox? renderBox = _filterBarKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final filterBarTop = position.dy;
      final shouldShowSticky = filterBarTop < 80;

      if (shouldShowSticky != _showStickyFilter) {
        setState(() {
          _showStickyFilter = shouldShowSticky;
        });
      }
    }
  }

  /// Get total count of filtered projects
  int _getTotalProjectCount() {
    final allProjects = ProjectModel.getAllProjects();
    if (_selectedFilter == 'All') {
      return allProjects.length;
    }
    return allProjects.where((project) => project.category == _selectedFilter).length;
  }

  /// Handle Load More action
  void _handleLoadMore() {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay (remove in production if data is local)
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _displayedCount += 6;
        _isLoading = false;
      });
    });
  }

  /// Handle filter change - reset displayed count
  void _handleFilterChange(String filter) {
    setState(() {
      _selectedFilter = filter;
      _displayedCount = 6; // Reset to initial count when filter changes
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalCount = _getTotalProjectCount();

    return Stack(
      children: [
        // Main content
        BaseScreen(
          backgroundColor: DColors.secondaryBackground,
          child: Column(
            children: [
              // Hero Section
              const PortfolioHeroSection(),

              // Original Filter Bar
              Container(
                key: _filterBarKey,
                child: FilterBarSection(
                  selectedFilter: _selectedFilter,
                  onFilterChanged: _handleFilterChange,
                ),
              ),

              // Project Grid
              ProjectGridSection(selectedFilter: _selectedFilter, displayedCount: _displayedCount),

              // Load More
              LoadMoreSection(
                displayedCount: _displayedCount,
                totalCount: totalCount,
                isLoading: _isLoading,
                onLoadMore: _handleLoadMore,
              ),
            ],
          ),
        ),

        // Sticky Filter Bar
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          top: _showStickyFilter ? 80 : -200,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showStickyFilter ? 1.0 : 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: DColors.background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha((255 * 0.15).round()),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: FilterBarSection(selectedFilter: _selectedFilter, onFilterChanged: _handleFilterChange),
            ),
          ),
        ),
      ],
    );
  }
}
