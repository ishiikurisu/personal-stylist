class Stylist
  def initialize assets
    @assets = assets
    @templates = {
      'text' => load("#{@assets}/posts/text.html"),
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
    end
    return content
  end

  def draw posts
    load("#{@assets}/base.html").sub('{{Posts}}', posts.map { |post| make post }.join('<hr>'))
  end
end
