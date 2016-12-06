ORIGIN = 320
G_FORCE = 6.674e-11
DT = 25000
class Planets

  def initialize(x, y, x_vel, y_vel, mass, image, universe)
    @x = x
    @y = y
    @x_vel = x_vel
    @y_vel = y_vel
    @mass = mass
    @image = image
    @force_x = 0
    @force_y = 0
    @universe = universe.to_f
  end

  attr_accessor :x, :y, :x_vel, :y_vel, :mass, :force_x, :force_y
  attr_reader :universe

  def draw
    @image.draw((@x / ((universe / 320))) + ORIGIN, (@y / (universe / 320)) + ORIGIN, 1)
  end

  def calc_force(other_body)
    if self == other_body
      return
    end
    total_force = gforce(other_body)
    if other_body.x != @x
      @force_x += (total_force * (other_body.x - @x)) /
                Math.sqrt((other_body.x - @x)**2 + (other_body.y - y)**2)
    end
    if other_body.y != @y
      @force_y += (total_force *(other_body.y - @y)) /
                Math.sqrt((other_body.x - @x)**2 + (other_body.y - y)**2)
    end
  end

  def gforce(other_body)
    (other_body.mass * @mass * G_FORCE) / ((other_body.x - @x)**2 + (other_body.y - y)**2)
  end
  def force_reset
    @force_x = 0
    @force_y = 0
  end

  def calc_velocity_and_position
    @x_vel += (@force_x / @mass) * DT
    @y_vel += (@force_y / @mass) * DT
    @x += @x_vel * DT
    @y += @y_vel * DT
  end
end
