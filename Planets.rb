ORIGIN = 320
UNIVERSE = 2.50e11
G_FORCE = 6.674e-11
DT = 25000
class Planets

  def initialize(x, y, x_vel, y_vel, mass, image)
    @x = (x / UNIVERSE) * ORIGIN
    @y = y / UNIVERSE
    @x_vel = x_vel / UNIVERSE
    @y_vel = y_vel / UNIVERSE
    @mass = mass / UNIVERSE
    @image = image
    @force_x = 0
    @force_y = 0
  end

  attr_accessor :x, :y, :x_vel, :y_vel, :mass, :force_x, :force_y

  def draw
    @image.draw(@x + ORIGIN, @y + ORIGIN, 1)
  end

  def calc_force(other_body)
    if self == other_body
      return
    end
    total_force = distance(other_body)
    if other_body.x != @x
      @force_x += (total_force * (other_body.x - @x)) /
                Math.sqrt(distance(other_body))
    end
    if other_body.y != @y
      @force_y += (total_force *(other_body.y - @y)) /
                Math.sqrt(distance(other_body))
    end
  end

  def distance(other_body)
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
