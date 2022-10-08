function nestedsum(array)
    result = 0
    for i in array
        result += sum(i)
    end
    return result
end

t = [[1, 2], [3], [4, 5, 6]]

println(nestedsum(t))
