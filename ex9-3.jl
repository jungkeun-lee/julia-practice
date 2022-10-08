using Combinatorics

alphabet = []
for i = 'a':'z'
    push!(alphabet, i)
end


function avoid(forbidden, line)
    for ch in forbidden
        if ch ∈ line
            return false
        end
    end
    return true
end

min = 1000000
final = []

for combi in combinations(alphabet, 5)
    result = 0
    fin = open("words.txt")
    for line in eachline(fin)
        if avoid(combi, line)
            result += 1
        end
    end
    if result < min
        global min = result
        global final = combi
    end
    close(fin)
end
println(min)
println(final)
