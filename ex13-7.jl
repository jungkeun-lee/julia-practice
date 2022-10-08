function processfile(filename)
    hist = Dict()
    for line in eachline(filename)
        processline(line, hist)
    end
    hist
end

function processline(line, hist)
    line = replace(line, '-' => ' ')
    for word ∈ split(line)
        word = string(filter(isletter, [word...])...)
        word = lowercase(word)
        hist[word] = get!(hist, word, 0) + 1
    end
end

function totalwords(hist)
    sum(values(hist))
end

function differentwords(hist)
    length(hist)
end

hist = processfile("emma.txt")

println("Total number of words: ", totalwords(hist))
println("Number of different words: ", differentwords(hist))

function binary_search(vec, num, low, high)
    while low ≤ high
        mid = Int(floor((low + high) / 2))
        if vec[mid] < num
            low = mid + 1
        elseif vec[mid] > num
            high = mid - 1
        else
            return mid
        end
    end
    return low
end

function randomword(h)
    cum = 0
    wordvec = []
    freqvec = []
    for (word, freq) ∈ h
        push!(wordvec, word)
        cum += freq
        push!(freqvec, cum)
    end
    wordvec[binary_search(freqvec, rand(1:cum), 1, length(freqvec))]
end

println("random word is : ", randomword(hist))

