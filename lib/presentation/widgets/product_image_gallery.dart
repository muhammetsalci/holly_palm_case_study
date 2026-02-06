import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

/// Product image carousel with variant-driven navigation.
/// 
/// Automatically animates to variant-specific image when user selects
/// different variant, providing visual feedback of selection change.
class ProductImageGallery extends StatefulWidget {
  final List<ProductImage> images;
  final String? selectedVariantImageUrl;

  const ProductImageGallery({
    super.key,
    required this.images,
    this.selectedVariantImageUrl,
  });

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ProductImageGallery oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedVariantImageUrl != oldWidget.selectedVariantImageUrl &&
        widget.selectedVariantImageUrl != null) {
      _animateToVariantImage();
    }
  }

  void _animateToVariantImage() {
    if (widget.selectedVariantImageUrl == null) return;

    final imageUrls = widget.images.map((img) => img.url).toList();
    final targetIndex = imageUrls.indexWhere(
      (url) => url == widget.selectedVariantImageUrl,
    );

    if (targetIndex != -1 && targetIndex != _currentPage) {
      _pageController.animateToPage(
        targetIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrls = widget.images.map((img) => img.url).toList();

    if (imageUrls.isEmpty) {
      return _buildPlaceholder();
    }

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildImage(imageUrls[index]);
            },
          ),
        ),
        if (imageUrls.length > 1) ...[
          const SizedBox(height: 12),
          _buildPageIndicators(imageUrls.length),
        ],
      ],
    );
  }

  Widget _buildImage(String url) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 48,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Icon(Icons.image_outlined, size: 64, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildPageIndicators(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
