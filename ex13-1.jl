fin = open("/home/jk/code/julia/thinkjulia_project/sample.txt")

function isletter(ch)
  if Int(lowercase(ch)) ≥ 97 && Int(lowercase(ch)) ≤ 122
    return true
  else
    return false
  end
end

words = []

for line in eachline(fin)
  word = ""
  len = length(line)
  if len == 0
    continue
  end
  i = firstindex(line)
  while true
    if i == lastindex(line)
      word *= line[i]
      push!(words, lowercase(word))
      break
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
println(length(words))
println(length(Set(words)))

if "thursday" ∈ Set(words)
  println("OK")
end
