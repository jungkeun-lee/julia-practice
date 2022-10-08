fin = open("/home/jk/code/julia/thinkjulia_project/words.txt")

anagram = Dict()

for line in eachline(fin)
    anagram[sort(collect(line))] = append!(get(anagram, sort(collect(line)), []), [line])
end

for value in values(anagram)
    if "smelters" ∈ value
        println(value)
    end
end
close(fin)
