# Question 1
#### The similarities of our code was we both required gosu to run the simulation. We both initialized the window, drew the universe in the window, updated the universe, and we both had a ARGV to type into the console to run different simulations. The two biggest two notable differences we had was how we used the ARGV and how we drew the universe. It seems Mr.Padjen had a separate universe class to draw and update the simulation whereas I just had several functions in the **nbody.rb**. I then passed the ARGV directly to the function that required it. Mr.Padjen had the ARGV go though his NbodySimulation class which was used in his Universe class. His Universe class was initialized when the NbodySimulation class was created.
# Question 2
#### The similarities of our code was we both set the DT and G as variable. We both had a reset_force function. We both had a function to calculate the forces on a body. We both had a draw function. We both had functions to calculate velocity and position. We also initialized the bodies with x, y, vel_x, vel_y, force_x, force_y, mass, and image variables. Our differences was that we didn't use the same names for some of our variables (ie for force and velocity Mr.Padjen used one letter whereas I abbreviated). I also didn't have an update function and a calculate acceleration function (I just calculated in the velocity function). Finally, I didn't use the private function because I don't know what it does.
# Question 3
## The advantages of having a separate universe class are:
1. Info is more organized and easier to find.
2. It handles all the body classes neatly
3. Less information clutter/lines needed for the main rb file (nbody.rb).
## The disadvantages of having a separate universe class are:
1. You need another file to hold the new class
2. You have to write more lines than you would if you just had a couple functions to handle the bodies in the nbody.rb
# Question 4
#### The most interesting difference is that private function that I have no idea what it does. Another thing is comparing my lines of code and Mr.Padjen's lines of code, I have less lines, but Mr.Padjen's lines are much cleaner and shorter. This is partially due to the fact that my variables were abbreviated so they took up more space. I preferred Mr.Padjen's code because it was simpler and cleaner.
# Question 5
#### I'd say my coding strength is my ability to easily write code that works well. My coding weaknesses are the my code can be confusing and longer than it needs to be.
