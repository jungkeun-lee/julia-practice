fin = open("/home/jk/code/julia/thinkjulia_project/words.txt")

anagram = Dict()

for line in eachline(fin)
  anagram[sort(collect(line))] = append!(get(anagram, sort(collect(line)), []), [line])
end

result = []
for value in values(anagram)
  if length(value) > 1
    push!(result, value)
  end
end
close(fin)

function find_metathesis(array)
  final = []
  for sub in array
    for i in 1:length(sub)
      for j in i+1:length(sub)
        count = 0
        for k in 1:length(sub[i])
          if sub[i][k] ≠ sub[j][k]
            count += 1
          end
        end
        if count == 2
          push!(final, (sub[i], sub[j]))
        end
      end
    end
  end
  return final
end

for i in find_metathesis(result)
  println(i)
end
