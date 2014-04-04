function love.load()
	balls = {}
	timer = 10
	diff = 100
end

function love.draw()
	for i=1, #balls do
		love.graphics.circle("fill", balls[i].x, balls[i].y, 40)
	end
end



function love.update(dt)
	timer = timer+50*dt
	diff = diff+0.1
	for i=#balls, 1, -1 do
		balls[i].y = balls[i].y+1*dt*diff
		if(balls[i].y>love.graphics.getHeight()+40)then
			table.remove(balls, i)
		end
	end

	if timer>100 then
		timer=0
		createBall()
	end
end

function createBall()
	ball = {}
	ball.x = math.random(1,love.graphics.getWidth())
	ball.y = -25
	balls[#balls+1] = ball
end

function love.mousepressed(x, y, button)
   if button == "l" then
      printx = x
      printy = y

      for i=#balls, 1, -1 do
      	if(x>balls[i].x-40 and x<balls[i].x+40 and y>balls[i].y-40 and y<balls[i].y+40) then
      		table.remove(balls, i)
  			love.graphics.setBackgroundColor(math.random(1,255),math.random(1,255),math.random(1,255))
			love.graphics.setColor(math.random(1,255),math.random(1,255),math.random(1,255))
      	end
      end
   end
end