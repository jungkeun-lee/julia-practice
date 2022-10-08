function histogram(word)
  d = Dict()
  for c ∈ word
    d[c] = get(d, c, 0) + 1
  end
  d
end

function reversedict(dic)
  d = Dict()
  for (key, value) ∈ dic
    d[value] = push!(get(d, value, []), key)
  end
  d
end

function createprobabilityarray(dic)
  cpa = []
  for (key, value) ∈ dic
    for i in value
      for j in 1:key
        push!(cpa, i)
      end
    end
  end
  cpa
end

function randnumcreator(array)
  x = rand(array)
  return x
end

println(randnumcreator(createprobabilityarray(reversedict(histogram("aldjqbqpdifuywbvjsaaskdjfhjqoeiugfcbzlxkjbfdwkjgqoeirukajdflkajhdf")))))
