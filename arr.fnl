

( local Arr {} )

( local Arr_mt {
    :__newindex (fn
        [t _ v]
        ( t:add v )
    )
    :__index Arr
} )



(fn Arr.new [_ t]
   (local new {
       :len (length t)
   })
   (setmetatable new Arr_mt)
   (for [i 1 (length t)]
    (new:add (. t i))
   )
   new
)





(set Arr.add (fn [t v]
    (rawset t (+ t.len 1) v)
    (set t.len (+ t.len 1))
))



;(local Arr_mt {})


(setmetatable Arr {
    :__call Arr.new
})









