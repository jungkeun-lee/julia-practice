function birthgen()
result = []
    for i in 1:23
push!(result, rand(1:365))
end
    return result
end

numofiter = 10000000
numofdup = 0
for i in 1:numofiter
    temp = birthgen()
    if length(temp) ≠ length(Set(temp))
        global numofdup += 1
    end
end

println("The probability of dupuplcation is $(numofdup/numofiter)")