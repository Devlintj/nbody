require "gosu"
require_relative "z_order"
require "./Planets"

class NbodySimulation < Gosu::Window

  def initialize
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)

    @planets = solar_system
  end

  def update
    real_force
    @planets.each do |planet|
      planet.calc_x_velocity
      planet.calc_y_velocity
      planet.calc_x_position
      planet.calc_y_position
    end
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
       info = line.split(" ")
       x = info[0].to_f
       y = info[1].to_f
       x_vel = info[2].to_f
       y_vel = info[3].to_f
       mass = info[4].to_f
       image = Gosu::Image.new("images/#{info[5]}")
       planet_arry.push(Planets.new(x, y, x_vel, y_vel, mass, image))
     end
     line_counter += 1
   end
   planet_arry
 end

 def real_force
   @planets.each {|planet| planet.force_reset}
   @planets.each do |planet1|
     @planets.each do |planet2|
       planet1.calc_force(planet2)
     end
   end
 end

window = NbodySimulation.new
window.show
