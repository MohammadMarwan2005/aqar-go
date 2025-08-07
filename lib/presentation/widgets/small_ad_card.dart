import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:flutter/material.dart';

/// A compact card widget for displaying property ads in a horizontal scroll view
class SmallAdCard extends StatelessWidget {
  final Ad ad;
  final VoidCallback onTap;
  final double width;

  const SmallAdCard({
    super.key,
    required this.ad,
    required this.onTap,
    this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = ad.property.images.firstOrNull?.imageUrl;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: width + 100,
        child: Container(
          margin: const EdgeInsets.only(right: 12, bottom: 8, top: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: imageUrl != null
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildPlaceholderImage(),
                        )
                      : _buildPlaceholderImage(),
                ),
              ),

              // Property Details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ad.property.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.square_foot, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          '${ad.property.area} m²',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const Spacer(),
                        Text(
                          '${ad.property.price}} \$',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Icon(Icons.home, size: 40, color: Colors.grey),
      ),
    );
  }
}
