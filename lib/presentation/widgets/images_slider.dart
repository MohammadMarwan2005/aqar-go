import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../domain/model/media_file.dart';

// Constants for consistent styling and behavior
// const double _defaultSliderHeight = 300.0;
const double _dotHeight = 8.0;
const double _activeDotWidth = 16.0;
const double _inactiveDotWidth = 8.0;
const double _dotMargin = 4.0;
const double _dotBorderRadius = 4.0;
const Duration _kAnimationDuration = Duration(milliseconds: 150);
const double _fullScreenIndicatorBottomPadding = 32.0;
const double _sliderIndicatorBottomPadding = 16.0;

/// A widget that displays a horizontal slider of images with pagination indicators.
/// Supports both standard and full-screen viewing modes.
@immutable
class ImagesSlider extends StatelessWidget {
  /// List of image URLs to display in the slider
  final List<String> imagesUrls;
  
  /// Optional height for the slider. Defaults to 300.0
  final double? height;

  /// Creates an image slider with the given image URLs
  const ImagesSlider({
    super.key, 
    required this.imagesUrls, 
    this.height,
  });

  /// Creates an image slider from a list of MediaFile objects
  factory ImagesSlider.fromFiles({Key? key, required List<MediaFile> files}) {
    return ImagesSlider(
      key: key,
      imagesUrls: files
          .where((element) => element.imageUrl != null)
          .map((e) => e.imageUrl!)
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultSliderHeight = 9/16 * screenWidth;
    if (imagesUrls.isEmpty) {
      return _buildEmptyState(defaultSliderHeight);
    }

    final pageController = PageController();
    int currentPage = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          height: height ?? defaultSliderHeight,
          child: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemCount: imagesUrls.length,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _openFullScreenGallery(context, index),
                    child: _buildNetworkImage(imagesUrls[index]),
                  );
                },
              ),
              Positioned(
                bottom: _sliderIndicatorBottomPadding,
                left: 0,
                right: 0,
                child: _SliderDots(
                  images: imagesUrls,
                  currentPage: currentPage,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNetworkImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (_, __, ___) => _buildErrorState(),
    );
  }

  Widget _buildErrorState() {
    return const Center(
      child: Icon(
        Icons.broken_image,
        size: 48,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildEmptyState(double defaultSliderHeight) {
    return SizedBox(
      height: height ?? defaultSliderHeight,
      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          size: 48,
          color: Colors.grey,
        ),
      ),
    );
  }

  void _openFullScreenGallery(BuildContext context, int initialIndex) {
    if (imagesUrls.isEmpty) return;
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _FullScreenGallery(
          images: imagesUrls,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

/// A full-screen image gallery that supports zooming and panning.
class _FullScreenGallery extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _FullScreenGallery({
    required this.images,
    this.initialIndex = 0,
  });

  @override
  _FullScreenGalleryState createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<_FullScreenGallery> {
  late final PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Scaffold(
        body: Center(child: Text("No images available".tr(context))),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(widget.images[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            loadingBuilder: (context, event) => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            pageController: _pageController,
          ),
          if (widget.images.length > 1)
            Positioned(
              bottom: _fullScreenIndicatorBottomPadding,
              left: 0,
              right: 0,
              child: _SliderDots(
                images: widget.images,
                currentPage: _currentPage,
              ),
            ),
        ],
      ),
    );
  }
}

/// A row of indicator dots that show the current page in a slider/gallery.
class _SliderDots extends StatelessWidget {
  final List<String> images;
  final int currentPage;

  const _SliderDots({
    required this.images,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    if (images.length <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        images.length,
        (index) => _buildDot(index == currentPage),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: _kAnimationDuration,
      width: isActive ? _activeDotWidth : _inactiveDotWidth,
      height: _dotHeight,
      margin: EdgeInsets.symmetric(horizontal: _dotMargin / 2),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(_dotBorderRadius),
        color: Colors.white.withOpacity(isActive ? 1.0 : 0.5),
      ),
    );
  }
}
