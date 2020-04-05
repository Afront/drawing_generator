require "stumpy_png"

# TODO: Write documentation for `DrawingGenerator`
module DrawingGenerator
  VERSION = "0.1.0"

  include StumpyPNG

  canvas = Canvas.new(256, 256)

  (0..255).each do |x|
    (0..255).each do |y|
    end
  end

  StumpyPNG.write(canvas, "test.png")
end
