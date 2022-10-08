function bs_recur(arr, word, low, high)
    if low > high
        return 0
    else
        mid = Int(floor((low + high) / 2))
        if word == arr[mid]
            return mid
        elseif word > arr[mid]
            return bs_recur(arr, word, mid + 1, high)
        else
            return bs_recur(arr, word, low, mid - 1)
        end
    end
end

function bs_while(arr, word, low, high)
    while low <= high
        mid = Int(floor((low + high) / 2))
        if arr[mid] < word
            low = mid + 1
        elseif arr[mid] > word
            high = mid - 1
        else
            return mid
        end
    end
    return 0
end

function createarr()
    fin = open("/home/jk/code/julia/words.txt")
    result = []
    for line in eachline(fin)
        push!(result, line)
    end
    close(fin)
    return result
end

wordarr = createarr()
word = "zymurgy"


search = bs_while(wordarr, word, 1, length(wordarr))

if search == 0
    println("Your word is not in the list")
else
    println("The index of your word in the list is $search.")
end

#=
for i in wordarr
    if word == i
        print("OK")
    end
end
=#
