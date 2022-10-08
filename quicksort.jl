a = [3, 7, 4, 2, 1, 5, 8, 6, 9, 2]

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
        while low < high && pivot ≤ array[high]
            high -= 1
        end
        if low ≥ high
            break
        end
        array[low] = array[high]
        low += 1
        while low < high && array[low] ≤ pivot
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

quicksort(a, 1, length(a))
println(a)
