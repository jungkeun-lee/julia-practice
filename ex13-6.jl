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

hist = processfile("emma.txt")

function subtract(d1, d2)
  setdiff(keys(d1), keys(d2))
end

words = processfile("words.txt")
diff = subtract(hist, words)

println("Words in the book that aren't in the word list:")
for word ∈ diff
  print(word, " ")
end

println(length(diff))
