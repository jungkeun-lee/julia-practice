ack_dict = Dict()

function ackermann(m, n)
    if (m, n) ∈ keys(ack_dict)
        return ack_dict[(m, n)]
    end
    if m == 0
        ack_dict[(m, n)] = n + 1
        return n + 1
    end
    if (m > 0 && n == 0)
        res = ackermann(m - 1, 1)
        ack_dict[(m, n)] = res
        return res
    end
    res = ackermann(m - 1, ackermann(m, n - 1))
    ack_dict[(m, n)] = res
    return res
end

println(ackermann(4, 5))
