require "http/client"
require "json"
require "stumpy_png"

# TODO: Write documentation for `DrawingGenerator`
module DrawingGenerator
  VERSION = "0.1.0"

  include StumpyPNG

  # TODO: Use COLOURlovers API
  module ColourLovers
    def self.get_palette
      response = HTTP::Client.get "http://www.colourlovers.com/api/palettes/random?format=json"
      JSON.parse(response.body)[0]["colors"].as_a.map { |s| "#" + s.as_s }
    end
  end

  canvas = Canvas.new(256, 256)

  palette = ColourLovers.get_palette

  (0..255).each do |x|
    (0..255).each do |y|
      canvas[x, y] = RGBA.from_hex palette.sample(1).first
    end
  end

  StumpyPNG.write(canvas, "#{Time.utc.to_s}.png")
end
