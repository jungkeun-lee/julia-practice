fin = open("/home/jk/code/julia/sample.txt")
fin2 = open("/home/jk/code/julia/words.txt")

function isletter(ch)
  if Int(lowercase(ch)) ≥ 97 && Int(lowercase(ch)) ≤ 122
    return true
  else
    return false
  end
end

words = []
wordlist = []

for line in eachline(fin)
  word = ""
  len = length(line)
  if len == 0
    continue
  end
  i = firstindex(line)
  while true
    if i == lastindex(line)
      if isletter(line[i])
        word *= line[i]
        push!(words, lowercase(word))
        break
      else
        if length(word) ≠ 0
          push!(words, lowercase(word))
        end
        break
      end
    end
    if isletter(line[i])
      word *= line[i]
    else
      if length(word) ≠ 0
        push!(words, lowercase(word))
        word = ""
      end
    end
    i = nextind(line, i)
  end
end

for line in eachline(fin2)
  push!(wordlist, line)
end

for word in Set(words)
  if word ∉ wordlist
    println(word)
  end
end

