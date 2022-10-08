fin = open("/home/jk/code/julia/words.txt")
t = []
for line in eachline(fin)
  push!(t, line)
end
println(t)
close(fin)
@time
