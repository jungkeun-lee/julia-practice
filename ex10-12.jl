fin = open("/home/jk/code/julia/thinkjulia_project/words.txt")

    push!(words, line)
end

close(fin)

function binarysearch(arr, target, low, high)
    while low <= high
        mid = (low + high) ÷ 2
        if target < arr[mid]
            high = mid - 1
        elseif target > arr[mid]
            low = mid + 1
        else
            return true
        end
    end
    return false
end


for word in words
    len = length(word)
    first = ""
    second = ""
    for i = 1:(len÷2)
        first *= word[2*i-1]
        second *= word[2*i]
    end
    if len % 2 == 1
        first *= word[len]
    end
    if binarysearch(words, first, 1, length(words)) &&
       binarysearch(words, second, 1, length(words))
        println(first, " ", second, " ", word)
    end
end

