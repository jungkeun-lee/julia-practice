fin = open("/home/jk/code/julia/thinkjulia_project/words.txt")

anagram = Dict()
for line in eachline(fin)
  anagram[sort(collect(line))] = append!(get(anagram, sort(collect(line)), []), [line])
end

close(fin)

keyarray = collect(keys(anagram))


function quicksort(array, low, high)
  if low ≥ high
    return
  end
  middle = splitarray(array, low, high)
  quicksort(array, low, middle - 1)
  quicksort(array, middle + 1, high)
end

function splitarray(array, low, high)
  pivot = array[low]
  while true
    while low < high && length(pivot) ≥ length(array[high])
      high -= 1
    end
    if low ≥ high
      break
    end
    array[low] = array[high]
    low += 1
    while low < high && length(array[low]) ≥ length(pivot)
      low += 1
    end
    if low ≥ high
      break
    end
    array[high] = array[low]
    high -= 1
  end
  array[high] = pivot
  return high
end

quicksort(keyarray, 1, length(keyarray))

for key ∈ keyarray
  println(key)
end
