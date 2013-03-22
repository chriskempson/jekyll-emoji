# Jekyll Emoji
#
# Chris Kempson (http://chriskempson.com)
# https://github.com/chriskempson/jekyll-emoji
#
# A jekyll plug-in that provides a Liquid filter for emojifying text with
# https://github.com/github/gemoji. See http://www.emoji-cheat-sheet.com for
# a full listing of emoji codes.
#
# Installation:
#   - Run `gem install gemoji` or add `gem 'gemoji'` to your gemfile and run `bundle install`
#   - Copy this file to your `_plugins` directory
#   - Add a line like `emoji_dir: images/emoji` to your `_config.yml`
# 
# Usage: 
#   - Apply the filter wherever needed e.g. {{ content | emojify }}
#   - Add some emoji to your article! e.g. "Hello :wink:"

require 'gemoji'

module Jekyll

  module EmojiFilter

    def emojify(content)
      return false if !content

      config = @context.registers[:site].config
      emoji_dir = File.join(config['source'], config['emoji_dir'])

      content.to_str.gsub(/:([a-z0-9\+\-_]+):/) do |match|
        if Emoji.names.include?($1) and emoji_dir
          '<img alt="' + $1 + '" src="/' + config['emoji_dir'] + "/#{$1}.png" + '" class="emoji" />'
        else
          match
        end
      end
    end

  end

  class EmojiGenerator < Generator
    def generate(site)
      config = site.config
      emoji_dir = File.join(config['source'], config['emoji_dir'])

      return false if File.exist?(emoji_dir + '/smiley.png')

      # Make Emoji directory
      FileUtils.mkdir_p(emoji_dir)

      # Copy Gemoji files
      Dir["#{Emoji.images_path}/emoji/*.png"].each do |src|
        FileUtils.cp src, emoji_dir
      end
    end
  end

end

Liquid::Template.register_filter(Jekyll::EmojiFilter)
