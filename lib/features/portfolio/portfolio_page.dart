// lib/features/portfolio/portfolio_page.dart

/*import 'package:flutter/material.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'widgets/hero/portfolio_hero_section.dart';
import 'widgets/filter_bar/filter_bar_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  String _selectedFilter = 'All'; // Track selected filter

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: DColors.secondaryBackground,
      child: Column(
        children: [
          // Section 1: Hero Section
          const PortfolioHeroSection(),

          // Section 2: Filter Bar (will be sticky with scroll listener)
          FilterBarSection(
            selectedFilter: _selectedFilter,
            onFilterChanged: (filter) {
              setState(() {
                _selectedFilter = filter;
              });
              debugPrint('Filter changed to: $filter');
            },
          ),

          // Section 3: Project Grid (Will add next)
          Container(
            height: 500, // Temporary placeholder
            color: DColors.secondaryBackground,
            child: Center(
              child: Text(
                'Selected Filter: $_selectedFilter\n\nProject Grid will be here',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';
import 'widgets/hero/portfolio_hero_section.dart';
import 'widgets/filter_bar/filter_bar_section.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
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

  @override
  void initState() {
    super.initState();
    // Listen to scroll after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupScrollListener();
    });
  }

  // Find the ScrollController from BaseScreen's SingleChildScrollView
  void _setupScrollListener() {
    final scrollController = PrimaryScrollController.of(context);
    scrollController.addListener(() {
      _onScroll(scrollController);
    });
  }

  void _onScroll(ScrollController controller) {
    // Get filter bar position
    final RenderBox? renderBox = _filterBarKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final filterBarTop = position.dy;

      // Show sticky filter when original filter bar scrolls past AppBar
      // AppBar height is approximately 80-100px
      final shouldShowSticky = filterBarTop < 80;

      if (shouldShowSticky != _showStickyFilter) {
        setState(() {
          _showStickyFilter = shouldShowSticky;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return Stack(
      children: [
        // Main content
        BaseScreen(
          backgroundColor: DColors.secondaryBackground,
          child: Column(
            children: [
              // Hero Section
              const PortfolioHeroSection(),

              // Section 2: Original Filter Bar (with key for position tracking)
              Container(
                key: _filterBarKey,
                child: FilterBarSection(
                  selectedFilter: _selectedFilter,
                  onFilterChanged: (filter) {
                    setState(() {
                      _selectedFilter = filter;
                    });
                    debugPrint('Filter changed to: $filter');
                  },
                ),
              ),

              // ✅ Section 3: Project Grid
              ProjectGridSection(selectedFilter: _selectedFilter),
            ],
          ),
        ),

        // Sticky Filter Bar (appears on scroll)
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
              child: FilterBarSection(
                selectedFilter: _selectedFilter,
                onFilterChanged: (filter) {
                  setState(() {
                    _selectedFilter = filter;
                  });
                  debugPrint('Filter changed to: $filter (sticky)');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
