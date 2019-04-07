require 'pry'

class Stylist
  def initialize assets
    @assets = assets
    @templates = {
      'text' => load("#{@assets}/posts/text.html"),
      'photo' => load("#{@assets}/posts/photo.html")
    }
  end

  def read stuff
    stuff['response']['posts']
  end

  def load file
    File.open(file, 'r'){ |fp| fp.read }
  end

  def make post
    content = ''
    case post['type']
    when 'text'
      content = @templates['text'].sub('{Title}', post['title']).sub('{Body}', post['body'])
    when 'photo'
      # binding.pry
      template = @templates['photo']
      photos_block_regex = /\{block:Photos\}(.*)\{\/block:Photos\}/m
      photos_block_html = template[photos_block_regex].sub('{block:Photos}', '').sub('{/block:Photos}', '')
      # XXX on compiler, dont forget to include the block!
      photos_block = post['photos'].map { |photo|
        photos_block_html.sub('{PhotoURL-HighRes}', photo['original_size']['url'])
      }.join
      content = template.sub photos_block_regex, photos_block
      content = content.gsub('{block:Caption}', '').gsub('{/block:Caption}', '').gsub('{Caption}', post['caption'])
    end
    return content
  end

  def draw posts
    load("#{@assets}/base.html").sub('{{Posts}}', posts.map { |post| make post }.join('<hr>')).sub('{{Style}}', load("#{@assets}/style.css")).sub('{{Script}}', load("#{@assets}/script.js"))
  end
end
