frequency = Dict()

function mostfrequent(str)
    for letter in str
        if get!(frequency, letter, 0) ≠ 0
            frequency[letter] += 1
        end
    end
    for (key, value) in frequency
        println(key, " ", value)
    end
end

mostfrequent("aaaaabbbbcccdde")


