require "gosu"
require_relative "z_order"
require "./load_planet"

class NbodySimulation < Gosu::Window

  def initialize
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)

    @planets = solar_system
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @planets.each {|planet| planet.draw}
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

end

def solar_system
  txt = open('simulations/planets.txt')
  line_counter = 0
  planet_arry = []
   txt.each_line do |line|
     if line_counter > 1
       info = line.split("")
       x = "%f" % info[0].to_f
       y = 0
       x_vel = "%f" % info[2].to_f
       y_vel = "%f" % info[3].to_f
       mass = "%f" % info[4].to_f
       image = info[5]
       planet_arry.push(Planets.new(x, y, x_vel, y_vel, mass, image))
     end
     line_counter += 1
   end
   planet_arry
 end

window = NbodySimulation.new
window.show
