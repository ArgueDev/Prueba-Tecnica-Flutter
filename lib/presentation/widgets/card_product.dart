import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String title;
  final String image;
  final String precio;

  const CardProduct({
    super.key,
    required this.title,
    required this.image,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12, 
            blurRadius: 6, 
            offset: Offset(2, 2)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            '\$$precio',
            style: TextStyle(
              color: Colors.green, 
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
