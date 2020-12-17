




(local Ball {})
(local Ball-mt {
    :__index Ball
})
(local BallArr {})

(love.graphics.setLineWidth 2)

(fn dist [b o]
    (^ (+ (^ (- b.x o.x) 2)  (^ (- b.y o.y) 2)) 0.5))


(fn update [b o dt]
    (let [d (dist b o)]
        (local dvx (/ (- o.x b.x) d))
        (local dvy (/ (- o.y b.y) d))

        (set b.vx (+ b.vx dvx))
        (set b.vy (+ b.vy dvy))))


(fn Ball.new [x y]
    (local q {
        :x x
        :y y
        :vx 0
        :vy 0
    })
    (table.insert BallArr q)
    (setmetatable q Ball-mt))



(local r love.math.random)

(for [i 1 10]
    (let [u (* 100 i)]
        (Ball.new (* (r) u) (* (r) u))))


(fn Ball.update [self dt]
    (each [_ b (ipairs BallArr)]
        (if (not= self b)
            (update self b dt))))


(fn Ball.updateVelocity [self dt]
    (set self.x (+ self.x (* self.vx dt)))
    (set self.y (+ self.y (* self.vy dt))))


(var com_X 0)
(var com_Y 0)

(fn updateCom [dt]
    (var sumX 0)
    (var sumY 0)

    (each [_ b (ipairs BallArr)]
        (set sumX (+ sumX b.x))
        (set sumY (+ sumY b.y)))

    (set com_X (/ sumX (length BallArr)))
    (set com_Y (/ sumY (length BallArr))))


(local setColour love.graphics.setColor)

(fn Ball.draw [self]
    (setColour 1 1 1)
    (love.graphics.circle "fill" self.x self.y 5)
    (setColour 1 0 0 0.2)
    (love.graphics.line self.x self.y com_X com_Y))


(fn love.update [dt]
    ;(var dt dt)
    ;(set dt (math.min dt 0.00001))
    (updateCom dt)
    (each [_ b (ipairs BallArr)]
        (b:update dt))
    (each [_ b (ipairs BallArr)]
        (b:updateVelocity dt)))


(fn love.draw []
    (love.graphics.translate 100 100)
    (love.graphics.scale 0.6)
    (each [_ b (ipairs BallArr)]
        ( b:draw )))




