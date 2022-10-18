mutable struct MPoint
    x
    y
end

struct Circle
    center
    radidus
end

struct Rectangle
    corner
    width
    height
end

function DistanceBetweenTwoPoints(p1, p2)
    sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
end

function pointincircle(circ, point)
    if DistanceBetweenTwoPoints(circ.center, point) ≤ circ.radidus
        return true
    else
        return false
    end
end

function rectincircle(rect, circ)
    second = MPoint(rect.corner.x + rect.width, rect.corner.y)
    third = MPoint(rect.corner.x, rect.corner.y + rect.height)
    fourth = MPoint(rect.corner.x + rect.width, rect.corner.y + rect.height)
    if pointincircle(circ, rect.corner) && pointincircle(circ, second) && pointincircle(circ, third) && pointincircle(circ, fourth)
        return true
    else
        return false
    end
end

function centerpositioncheck(rect, circ)
    if circ.center.x < rect.corner.x
        v = 0
    elseif circ.center.x > rect.corner.x + rect.width
        v = 2
    else
        v = 1
    end
    if circ.center.y > rect.corner.y
        h = 1
    elseif circ.center.y < rect.corner.y - rect.height
        h = 7
    else
        h = 4
    end
    return v + h
end

function rectcircoverlap(rect, circ)
    index = centerpositioncheck(rect, circ)
    @show index
    if index == 1
        DistanceBetweenTwoPoints(rect.corner, circ.center) ≤ circ.radidus
    elseif index == 2
        (circ.center.y - rect.corner.y) ≤ circ.radidus
    elseif index == 3
        DistanceBetweenTwoPoints(MPoint(rect.corner.x + rect.width, rect.corner.y), circ.center) ≤ circ.radidus
    elseif index == 4
        (rect.corner.x - circ.center.x) ≤ circ.radidus
    elseif index == 6
        (circ.center.x - rect.corner.x - rect.width) ≤ circ.radidus
    elseif index == 7
        DistanceBetweenTwoPoints(MPoint(rect.corner.x, rect.corner.y + rect.height), circ.center) ≤ circ.radidus
    elseif index == 8
        (rect.corner.y - rect.height - circ.center.y) ≤ circ.radidus
    elseif index == 9
        DistanceBetweenTwoPoints(MPoint(rect.corner.x + rect.width, rect.corner.y + rect.height), circ.center) ≤ circ.radidus
    else
        true
    end

end

circle1 = Circle(MPoint(0, 0), 1)
rectangle1 = Rectangle(MPoint(-1, 1), 1, 1)

@show rectcircoverlap(rectangle1, circle1)
