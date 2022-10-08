fin = open("words.txt")

for line in eachline(fin)
    if length(line) > 20 || length(line) < 3
        println(line)
    end
end

