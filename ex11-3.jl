function invertdict(dic)
    inverse = Dict()
    for key in keys(dic)
        val = dic[key]
        inverse[val] = append!(get!(inverse, val, []), key)
    end
    inverse
end

dic = Dict('a' => 2, 'b' => 1, 'c' => 3, 'd' => 2, 'e' => 4, 'f' => 1, 'g' => 4)

for (key, val) in invertdict(dic)
    println(key, "=> ", val)
end
