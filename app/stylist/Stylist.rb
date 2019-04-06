class Stylist
  def initialize assets
    @assets = assets
  end

  def read stuff
    stuff['response']['posts']
  end

  def draw posts
    # TODO create HTML for posts based on the assets of the assets folder
    posts.to_s
  end
end
