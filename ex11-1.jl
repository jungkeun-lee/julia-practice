
function createvector()
    fin = open("/home/jk/code/julia/words.txt")
    res = []
    for line in eachline(fin)
        push!(res, line)
    end
    close(fin)
    res
end

words = createvector()
#=
word_dict = Dict()
for(i, word) in enumerate(words)
    word_dict[word] = i
end
=#
word = "limos"

#=
if word ∈ keys(word_dict)
    println("Your word is in the list.")
else
    println("Your word is not in the list.")
end
=#
if word ∈ words
    println("Your word is in the list.")
else
    println("Your word is not in the list.")
end
