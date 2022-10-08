fin = open("/home/jk/code/julia/thinkjulia_project/words.txt")

frequency = Dict()
function mostfrequent(wordfile)
  for line in eachline(wordfile)
    for letter in line
      frequency[letter] = get!(frequency, letter, 0) + 1
    end
  end
  result = []
  for (key, value) in frequency
    push!(result, (key, value))
  end
  return result
end

function quicksort(tuplearray, low, high)
  if low ≥ high
    return
  end
  middle = splitarray(tuplearray, low, high)
  quicksort(tuplearray, low, middle - 1)
  quicksort(tuplearray, middle + 1, high)
end

function splitarray(tuplearray, low, high)
  pivot = tuplearray[low]
  while true
    while low < high && pivot[2] ≤ tuplearray[high][2]
      high -= 1
    end
    if low ≥ high
      break
    end
    tuplearray[low] = tuplearray[high]
    low += 1
    while low < high && tuplearray[low][2] ≤ pivot[2]
      low += 1
    end
    if low ≥ high
      break
    end
    tuplearray[high] = tuplearray[low]
    high -= 1
  end
  tuplearray[high] = pivot
  return high
end

frearray = mostfrequent(fin)
quicksort(frearray, 1, length(frearray))
println(frearray)

close(fin)
