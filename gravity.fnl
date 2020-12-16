

(local Ball {})

(local Ball-mt {
    :__index Ball
})


(local BallArr {})



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
    (set self.x (+ self.x (* self.vx dt)))
    (set self.y (+ self.y (* self.vy dt)))

    (each [_ b (ipairs BallArr)]
        (if (not= self b)
            (update self b dt))))



(fn Ball.draw [self dt]
    (love.graphics.circle "fill" self.x self.y 5))




(fn love.update [dt]
    ;(var dt dt)
    ;(set dt (math.min dt 0.00001))
    (each [_ b (ipairs BallArr)]
        (b:update dt)))


(fn love.draw []
    (love.graphics.scale 0.3)
    (each [_ b (ipairs BallArr)]
        ( b:draw )))




