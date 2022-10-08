str = "aeiouy"

fin = open("words.txt")
count = 0

for line in eachline(fin)
    temp = 0
    for ch in str
        if (ch ∈ line)
            temp += 1
        end
    end
    if temp == length(str)
        global count += 1
        println(line)
    end
end

println(count)
close(fin)
