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

function mostcommon(hist)
  t = []
  for (key, value) in hist
    push!(t, (value, key))
  end
  reverse(sort(t))
end

function printmostcommon(hist, num=10)
  t = mostcommon(hist)
  println("The most common words are: ")
  for (freq, word) ∈ t[1:num]
    println(word, "\t", freq)
  end
end

printmostcommon(hist, 20)

function subtract(d1, d2)
  res = Dict()
  for key ∈ keys(d1)
    if key ∉ keys(d2)
      res[key] = nothing
    end
  end
  res
end

words = processfile("words.txt")
diff = subtract(hist, words)

println("Words in the book that aren't in the word list:")
for word ∈ keys(diff)
  print(word, " ")
end

println()

function randomword(h)
  t = []
  for (word, freq) ∈ h
    for i ∈ 1:freq
      push!(t, word)
    end
  end
  rand(t)
end

println("random word is : ", randomword(hist))
