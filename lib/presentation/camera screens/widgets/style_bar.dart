import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/style_bubble_item.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/style_selection_ring.dart';

class StyleBar extends StatefulWidget {
  final List<Map<String, String>> styles; // list of styles {title and imageUrl}
  final void Function(String? styleName) onStyleChanged;
  final EdgeInsets padding;

  const StyleBar({
    super.key,
    required this.styles,
    required this.onStyleChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
  });

  @override
  State<StyleBar> createState() => _StyleBarState();
}

class _StyleBarState extends State<StyleBar> {
  static const _stylesPerScreen = 5; // styles per screen
  static const _viewportFractionPerItem = 1.0 / _stylesPerScreen;

  late final PageController _controller;
  late int _page;
  int get styleCount => widget.styles.length;

  // imageUrl of style of index i
  String? styleImageUrl(int index) => widget.styles[index]['imageUrl'];

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      //when page is changed, onStyleChnanged will be called with styleName
      //to be displayed on top of screen
      widget.onStyleChanged(widget.styles[page]['title']);
    }
  }

  //when StyleItem is tapped, animate to that style
  void _onStyleTapped(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 450),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      controller: _controller,
      axisDirection: AxisDirection.right,
      physics: const PageScrollPhysics(),
      viewportBuilder: (context, viewportOffset) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final itemSize = constraints.maxWidth * _viewportFractionPerItem;
            viewportOffset
              ..applyViewportDimension(constraints.maxWidth)
              ..applyContentDimensions(0.0, itemSize * (styleCount - 1));

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _buildCarousel(
                  viewportOffset: viewportOffset,
                  itemSize: itemSize,
                ),
                _buildSelectionRing(itemSize),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildCarousel({
    required ViewportOffset viewportOffset,
    required double itemSize,
  }) {
    return Container(
      height: itemSize,
      margin: widget.padding,
      child: Flow(
        delegate: CarouselFlowDelegate(
          viewportOffset: viewportOffset,
          filtersPerScreen: _stylesPerScreen,
        ),
        children: [
          for (int i = 0; i < styleCount; i++)
            StyleItem(
              itemSize: itemSize,
              onStyleSelected: () => _onStyleTapped(i),
              imageUrl: styleImageUrl(i)!,
            ),
        ],
      ),
    );
  }

  Widget _buildSelectionRing(double itemSize) {
    return SelectionRing(
      itemSize: itemSize,
      padding: widget.padding,
    );
  }
}

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;

    // All available painting width
    final size = context.size.width;

    // The distance that a single item "page" takes up from the perspective
    // of the scroll paging system. We also use this size for the width and
    // height of a single item.
    final itemExtent = size / filtersPerScreen;

    // The current scroll position expressed as an item fraction, e.g., 0.0,
    // or 1.0, or 1.3, or 2.9, etc. A value of 1.3 indicates that item at
    // index 1 is active, and the user has scrolled 30% towards the item at
    // index 2.
    final active = viewportOffset.pixels / itemExtent;

    // Index of the first item we need to paint at this moment.
    // At most, we paint 3 items to the left of the active item.
    final min = math.max(0, active.floor() - 3).toInt();

    // Index of the last item we need to paint at this moment.
    // At most, we paint 3 items to the right of the active item.
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    // Generate transforms for the visible items and sort by distance.
    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();
      final itemScale = 0.5 + (percentFromCenter * 0.5);
      final opacity = 0.25 + (percentFromCenter * 0.75);

      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(
        index,
        transform: itemTransform,
        opacity: opacity,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.viewportOffset != viewportOffset;
  }
}
