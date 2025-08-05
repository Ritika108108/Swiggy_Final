import 'package:flutter/material.dart';

class SearchFilterBar extends StatefulWidget {
  final Function(String) onSearch;
  final Function(String) onCategorySelected;
  final Function(RangeValues) onPriceRangeChanged;

  const SearchFilterBar({
    required this.onSearch,
    required this.onCategorySelected,
    required this.onPriceRangeChanged,
    super.key,
  });

  @override
  State<SearchFilterBar> createState() => _SearchFilterBarState();
}

class _SearchFilterBarState extends State<SearchFilterBar> {
  final TextEditingController _controller = TextEditingController();
  String selectedCategory = 'All';
  RangeValues selectedRange = const RangeValues(50, 500);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔍 Search Box
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Search food items...',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: widget.onSearch,
        ),

        const SizedBox(height: 10),

        // 📂 Categories
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: ['All', 'North Indian', 'South Indian', 'Chinese', 'Pizza']
                .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: selectedCategory == category,
                        onSelected: (selected) {
                          setState(() {
                            selectedCategory = category;
                            widget.onCategorySelected(category);
                          });
                        },
                      ),
                    ))
                .toList(),
          ),
        ),

        const SizedBox(height: 10),

        // 💸 Price Range Slider
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Price Range"),
            Text("₹${selectedRange.start.toInt()} - ₹${selectedRange.end.toInt()}")
          ],
        ),
        RangeSlider(
          values: selectedRange,
          min: 50,
          max: 500,
          divisions: 9,
          onChanged: (values) {
            setState(() {
              selectedRange = values;
              widget.onPriceRangeChanged(values);
            });
          },
        ),
      ],
    );
  }
}
