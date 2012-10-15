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
#   - Copy this file to your `_plugins` directory
#   - Add a line like `emoji: ./images/emoji` to your `_config.yml`
#   - Make the `./images/emoji/` directory
# 
# Usage: 
#   - Apply the filter wherever needed e.g. {{ content | emojify }}
#   - Add some emoji to your article! e.g. "Hello :wink:"

require "gemoji"

module Jekyll
  module EmojiFilter

    def copy_emoji
      Dir["#{Emoji.images_path}/emoji/*.png"].each do |src|
        FileUtils.cp src, @context.registers[:site].config['emoji']
      end
    end

    def emojify(content)
      path = @context.registers[:site].config['emoji']
      abs_path = path.gsub(".", "")

      if !path.empty? and !File.exists?(path + '/smiley.png') 
        copy_emoji
      end

      content.to_str.gsub(/:([a-z0-9\+\-_]+):/) do |match|
        if Emoji.names.include?($1) and path
          '<img alt="' + $1 + '" height="20" src="' + abs_path + "/#{$1}.png" + '" class="emoji" width="20" />'
        else
          match
        end
      end
    end

  end
end

Liquid::Template.register_filter(Jekyll::EmojiFilter)
