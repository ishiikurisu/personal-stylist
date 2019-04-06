class Stylist
  def initialize assets
    @assets = assets
  end

  def read stuff
    stuff['response']['posts']
  end

  def load file
    fp = File.open file, 'r'
    fp.read
  end

  def draw posts
    load "#{@assets}/base.html"
  end
end
