# Jekyll Emoji
A jekyll plug-in that provides a Liquid filter for emojifying text with [Gemoji](https://github.com/github/gemoji). See [Emoji Cheat Sheet](http://www.emoji-cheat-sheet.com) for a full listing of emoji codes.

## Installation
- Run `gem install gemoji` or add `gem 'gemoji'` to your gemfile and run `bundle install`
- Copy this file to your `_plugins` directory
- Add a line like `emoji: ./images/emoji` to your `_config.yml`
 
## Usage: 
- Apply the filter wherever needed e.g. `{{ content | emojify }}`
- Add some emoji to your article! e.g. `Hello :wink:`
