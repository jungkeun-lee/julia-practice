function cumulsum(array)
    temp = 0
    result = []
    for i in array
        temp += i
        push!(result, temp)
    end
    return result
end

t = [1, 2, 3]

println(cumulsum(t))
