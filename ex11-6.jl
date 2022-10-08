using Combinatorics

words = ["cheer", "jolly", "melon", "cubed", "HAL", "IBM"]

function checkrotate(wordpair)
    result = []
    for i in 1:length(wordpair[1]) 
        push!(result, (wordpair[1][i] - wordpair[2][i] + 26) % 26)
    end
    if length(Set(result)) == 1
        return true
    else
        return false
    end
end
        
function foundrotateword(wordlist)
    result = []
    for wordpair in combinations(wordlist, 2)
        if length(wordpair[1]) ≠ length(wordpair[2])
            continue
        else
            if checkrotate(wordpair)
                push!(result, wordpair)
            end
        end
    end
    return result
end

final = foundrotateword(words)
if length(final) > 0
    for i in final
        println(i)
    end
else
    println("There's no rotateword pair!!")
end


