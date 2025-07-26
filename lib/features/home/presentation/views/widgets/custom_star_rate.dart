import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final void Function(int rating)? onRatingChanged;
  final int initialRating;

  const StarRating({super.key, this.onRatingChanged, this.initialRating = 0});

  @override
  StarRatingState createState() => StarRatingState();
}

class StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isSelected = index < _rating;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
          ), // مسافة خفيفة بين النجوم
          child: GestureDetector(
            onTap: () {
              setState(() {
                _rating = index + 1;
              });
              widget.onRatingChanged?.call(_rating);
            },
            child: Icon(
              isSelected ? Icons.star : Icons.star_border,
              color: isSelected ? Colors.amber : Colors.grey,
              size: 28,
            ),
          ),
        );
      }),
    );
  }
}
