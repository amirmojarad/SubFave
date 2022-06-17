
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/words.dart';
import 'package:subfave/models/word.dart';

class WordsGridList extends StatelessWidget {
  const WordsGridList({
    Key? key,
    required this.width,
    required this.height,
    required this.items,
  }) : super(key: key);

  final double width;
  final double height;
  final List<Word> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width - 50,
      height: height - 300,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 6,
          crossAxisSpacing: 12,
          crossAxisCount: 12,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          var word =items[index];
          bool isSelected = context
              .watch<WordsProvider>()
              .isWordSelected(word);
          return Container(
            child: Material(
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  if (context
                      .read<WordsProvider>()
                      .isWordSelected(word)) {
                    context
                        .read<WordsProvider>()
                        .removeWordFromSelectedWords(word);
                  } else {
                    context
                        .read<WordsProvider>()
                        .addWordToSelectedWords(word);
                  }
                },
                child: Center(
                  child: Text(
                    word.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 14),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.background,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                          offset: Offset(-3, 7),
                          color: Theme.of(context).dividerColor)
                    ]
                  : [],
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).selectedRowColor
                    : Theme.of(context).colorScheme.primary,
                width: isSelected ? 4 : 3,
              ),
            ),
          );
        },
      ),
    );
  }
}
