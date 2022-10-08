function interior(array)
    deleteat!(array, length(array))
    deleteat!(array, 1)
    return array
end

function interior!(array)
    deleteat!(array, length(array))
    deleteat!(array, 1)
    return nothing
end


t = [1, 2, 3, 4]
s = [5, 6, 7, 8]
println(interior(t))
println(interior!(s))
println(s)
