function reversepair(word1, word2)
    if word1 == reverse(word2)
        true
    else
        false
    end
end

print("Input the forst word : ")
first = readline()
print("Input the second word : ")
second = readline()

if reversepair(first, second)
    println("They are reverse pair!")
else
    println("They are not reverse pair!")
end
