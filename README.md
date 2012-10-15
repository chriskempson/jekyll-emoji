# Jekyll Emoji
A jekyll plug-in that provides a Liquid filter for emojifying text with [Gemmoji](https://github.com/github/gemoji). See [Emoji Cheat Sheet](http://www.emoji-cheat-sheet.com) for a full listing of emoji codes.

## Installation
- Copy this file to your `_plugins` directory
- Add a line like `emoji: ./images/emoji` to your `_config.yml`
- Make the `./images/emoji/` directory
 
## Usage: 
- Apply the filter wherever needed e.g. {{ content | emojify }}
- Add some emoji to your article! e.g. `Hello :wink:`
