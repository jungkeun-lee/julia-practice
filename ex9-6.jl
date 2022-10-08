fin = open("words.txt")

function isabecedarian(word)
    for i in 1:(length(word) - 1)
        if word[i] > word[i + 1]
            return false
        end
    end
    return true
end

count = 0

for line in eachline(fin)
    if isabecedarian(line)
        global count += 1
        println(line)
    end
end
println(count)
close(fin)
