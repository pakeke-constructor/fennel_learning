


(macro )



(fn dist [x1 y1 x2 y2]
    (^ (+ (^ (- x1 x2) 2) (^ (- y1 y2) 2)) 0.5)
)


(local Node)
(set Node {:left nil :r nil :item 12 })




(fn DFS [node item]
    (let [soln nil]

    (if (= node.item item)
        (soln)
        ((if (node.left)
            (DFS node.left item))
        (if (node.right)
            (DFS node.right item))))
    (soln)))




