function sumall(args...)
    result = 0
    for i in args
        result += i
    end
    return result
end

println(sumall(1, 2, 3, 4, 5))

