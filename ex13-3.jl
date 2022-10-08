fin = open("/home/jk/code/julia/sample.txt")

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

freqdict = Dict()

for word ∈ words
  freqdict[word] = get(freqdict, word, 0) + 1
end

freqarray = []
for (key, value) ∈ freqdict
  push!(freqarray, (key, value))
end

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
    while low < high && pivot[2] ≥ array[high][2]
      high -= 1
    end
    if low ≥ high
      break
    end
    array[low] = array[high]
    low += 1
    while low < high && array[low][2] ≥ pivot[2]
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

quicksort(freqarray, 1, length(freqarray))

for i in 1:20
  println(freqarray[i])
end

