ORIGIN = 320
UNIVERSE = 2.50e11
G_FORCE = 6.674e-11
DT = 25000
class Planets

  def initialize(x, y, x_vel, y_vel, mass, image)
    @x = (x / UNIVERSE) * ORIGIN
    @y = y
    @x_vel = x_vel / UNIVERSE
    @y_vel = y_vel / UNIVERSE
    @mass = mass
    @image = image
    @force_x = 0
    @force_y = 0
  end

  attr_accessor :x, :y, :x_vel, :y_vel
  attr_reader :mass

  def draw
    @image.draw(@x + ORIGIN, @y + ORIGIN, 1)
  end

  def calc_force(other_body)
    total_force = (other_body.mass * @mass * G_FORCE) /
                  (Math.sqrt((other_body.x - @x)*(other_body.x - @x)+
                  (other_body.y - y)*(other_body.y - y))*Math.sqrt(
                  (other_body.x - @x)*(other_body.x - @x)+
                  (other_body.y - y)*(other_body.y - y)))
    if other_body.x > @x
      @force_x += (total_force * x_vel) /
                Math.sqrt((other_body.x - @x)*(other_body.x - @x)+
                          (other_body.y - y)*(other_body.y - y))
    elsif other_body.x < @x
      @force_x += -(total_force * x_vel) /
                Math.sqrt((other_body.x - @x)*(other_body.x - @x)+
                          (other_body.y - y)*(other_body.y - y))
    end
    if other_body.y > @y
      @force_y += (total_force * y_vel) /
                Math.sqrt((other_body.x - @x)*(other_body.x - @x)+
                          (other_body.y - y)*(other_body.y - y))
    elsif other_body.y < @y
      @force_y += -(total_force * y_vel) /
                Math.sqrt((other_body.x - @x)*(other_body.x - @x)+
                          (other_body.y - y)*(other_body.y - y))
    end
  end

  def force_reset
    @force_x = 0
    @force_y = 0
  end

  def calc_x_velocity
    @x_vel += (@force_x / @mass) * DT
  end

  def calc_y_velocity
    @y_vel += (@force_y / @mass) * DT
  end

  def calc_x_position
    @x += @x_vel * DT
  end

  def calc_y_position
    @y += @y_vel * DT
  end
end
