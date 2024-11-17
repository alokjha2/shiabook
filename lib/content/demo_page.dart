import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  final int page;

  const DemoPage({Key? key, required this.page}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  bool isSwitched = false;
  double _scale = 1.0;
  Map<String, Color> highlights = {};
  Color currentHighlightColor = Colors.yellow.withOpacity(0.3);

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  void _showHighlightColorPicker(String selectedText, BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            children: [
              _buildColorOption(Colors.yellow.withOpacity(0.3), selectedText),
              _buildColorOption(Colors.green.withOpacity(0.3), selectedText),
              _buildColorOption(Colors.blue.withOpacity(0.3), selectedText),
              _buildColorOption(Colors.pink.withOpacity(0.3), selectedText),
              _buildColorOption(Colors.orange.withOpacity(0.3), selectedText),
              TextButton(
                onPressed: () {
                  setState(() {
                    highlights.remove(selectedText);
                  });
                  Navigator.pop(context);
                },
                child: const Text('Remove Highlight'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildColorOption(Color color, String selectedText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          highlights[selectedText] = color;
          currentHighlightColor = color;
        });
        Navigator.pop(context);
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildHighlightableText(String text) {
    List<TextSpan> _buildTextSpans(String content) {
      List<TextSpan> spans = [];
      int currentIndex = 0;

      // Sort highlights by their position in the text to ensure proper ordering
      var sortedHighlights = highlights.entries.toList()
        ..sort((a, b) => content.indexOf(a.key).compareTo(content.indexOf(b.key)));

      for (var highlight in sortedHighlights) {
        String key = highlight.key;
        int index = content.indexOf(key, currentIndex);
        
        if (index == -1) continue;

        // Add non-highlighted text before the highlight
        if (index > currentIndex) {
          spans.add(TextSpan(
            text: content.substring(currentIndex, index),
          ));
        }

        // Add highlighted text
        spans.add(TextSpan(
          text: key,
          style: TextStyle(
            backgroundColor: highlight.value,
          ),
        ));

        currentIndex = index + key.length;
      }

      // Add remaining text
      if (currentIndex < content.length) {
        spans.add(TextSpan(
          text: content.substring(currentIndex),
        ));
      }

      return spans;
    }

    return SelectableText.rich(
      TextSpan(
        children: _buildTextSpans(text),
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Droid Sans',
        ),
      ),
      onSelectionChanged: (selection, cause) {
        if (selection.textInside(text).isNotEmpty) {
          String selectedText = selection.textInside(text);
          if (selectedText.trim().isNotEmpty) {
            _showHighlightColorPicker(selectedText, context);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: InteractiveViewer(
        minScale: 0.5,
        maxScale: 10.0,
        panEnabled: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Part ${widget.page + 1}',
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "My Father's Dragon",
                  style: TextStyle(
                    fontFamily: 'sans-serif',
                    fontSize: 24.0,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: _buildHighlightableText(
                        '''Elmer Elevator, when he was a kid. He and his mother Dela owned a candy shop in a small town, but were soon forced to close down and move away when the people of the town moved away. They move to a faraway city where they plan to open a new shop, but they eventually lose all the money they save up while getting by''',
                      ),
                    ),
                    Switch(
                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.yellow,
                      inactiveThumbColor: Colors.redAccent,
                      inactiveTrackColor: Colors.orange,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                _buildHighlightableText(
                  '''Elmer soon befriends a cat and eventually gets the idea to panhandle the money needed for the store, only for his mother to tell him that it is a lost cause. Angered, Elmer runs to the docks to be alone. The Cat comes to him and begins speaking to him, much to his shock. She tells him that on an island, Wild Island, beyond the city lies a dragon that can probably help him. Elmer takes the task and is transported to the island thanks to a bubbly whale named Soda. Once they make it to Wild Island, Soda explains that a gorilla named Saiwa is using the dragon to keep the island from sinking, but it remains ineffective.

Elmer frees the dragon, a goofball named Boris, and they go on an adventure to find a tortoise named Aratuah in order to find out how Boris can keep the island from sinking for the next century since his kind has been doing that forever and he will be an "After Dragon", but he can't fly due to his wing being broken after Elmer saves him''',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}