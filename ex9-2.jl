fin = open("words.txt")
function hasno_e(line)
    if !('e' ∈ line)
        return true
    else
        return false
    end
end

count = 0
ecount = 0
for line in eachline(fin)
    global count += 1
    if hasno_e(line)
        println(line)
        global ecount += 1
    end
end

percentage = ecount / count * 100
println("The percentage of has no e is $percentage")
