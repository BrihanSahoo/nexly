import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final ValueChanged<int>? onItemSelected;

  const Navbar({
    super.key,
    this.onItemSelected,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> items = [
    {
      'title': 'Today',
      'icon': Icons.home_rounded,
      'color': Color(0xFF5B8CFF),
    },
    {
      'title': 'Trending',
      'icon': Icons.bolt_rounded,
      'color': Color(0xFFFFC107),
    },
    {
      'title': 'News',
      'icon': Icons.article_rounded,
      'color': Color(0xFFFF5C8A),
    },
  ];

  void selectItem(int index) {
    if (selectedIndex == index) return;

    setState(() {
      selectedIndex = index;
    });

    widget.onItemSelected?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xFF201E1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  items.length,
                  (index) {
                    final isSelected = selectedIndex == index;

                    final Color iconColor = items[index]['color'];

                    return GestureDetector(
                      onTap: () => selectItem(index),
                      behavior: HitTestBehavior.opaque,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.easeInOutCubic,
                        padding: EdgeInsets.symmetric(
                          horizontal: isSelected ? 18 : 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF615F5F)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icon animation
                            AnimatedSlide(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOutCubic,
                              offset: isSelected
                                  ? Offset.zero
                                  : const Offset(-0.4, 0),
                              child: AnimatedScale(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeOutBack,
                                scale: isSelected ? 1.0 : 0.0,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 250),
                                  opacity: isSelected ? 1.0 : 0.0,
                                  child: Icon(
                                    items[index]['icon'],
                                    color: iconColor,
                                    size: 23,
                                  ),
                                ),
                              ),
                            ),

                            AnimatedSize(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeInOut,
                              child: isSelected
                                  ? const SizedBox(width: 8)
                                  : const SizedBox(width: 0),
                            ),

                            // Text
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeInOutCubic,
                              style: TextStyle(
                                fontSize: isSelected ? 17 : 14,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white70,
                              ),
                              child: Text(
                                items[index]['title'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Add button
            GestureDetector(
              onTap: () {
                // Add action
              },
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 300),
                tween: Tween(begin: 1.0, end: 1.0),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF615F5F),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}