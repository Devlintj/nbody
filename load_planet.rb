class Planets

  def initialize(x, y, x_vel, y_vel, mass, image)
    @x = x
    @y = y
    @x_vel = x_vel
    @y_vel = y_vel
    @mass = mass
    @image = image
  end

  attr_accessor :x, :y, :x_vel, :y_vel

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
