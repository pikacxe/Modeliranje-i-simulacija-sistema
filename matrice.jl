using LinearAlgebra
using Statistics

A = [1 4 -2 9 6; 
     -1 0 0 3 7;
     99 3 -3 4 7;
     5 -6 0 -8 3;
     1 2 3 4 5]


i = [
    0 0 0 0 0;
    0 0 0 0 0;
    1 0 0 0 0;
    0 0 0 0 0;
    0 0 0 0 0
]
i = convert.(Bool, i)
p = A[i]

A[1:2:end,:]

A[A .> 0]

A[(A .>= -5) .& (A .< 5)]

# element , index_elementa
element, ~ = findmax(A)

element = maximum(A)

dijagonala = diag(reverse(A,dims=2))

sume = sum(A,dims=1)
max1 = maximum(sume)

sume[findall( sume .== max)]

function primer1(A ::Matrix)
    s = mean(A[end,:])
    d = diag(A)
    v = d[d .> 0]
    
    return s, v
end

A[:,2:2:end]
A[rem.(A,9) .== 0]
A[2:2:end,2:2:end]

function primer2(A ::Matrix, B ::Matrix)
    pom = tril(A,1)
    x = pom[(rem.(pom,3) .== 0) .& (pom .> 0)]
    srA = mean(diag(A))
    pom1 = diag(reverse(B))
    s = mean(pom1[pom1 .> srA])
    return x,s
end

A[findall(A .> 2)]


function zadatak1(A ::Matrix, k,r)
    rA = reverse(A)
    sd = diag(rA)
    v = sd[rem.(sd,2) .== 0]
    pom = triu(rA,1)
    c = pom[(pom .> k) .& (rem.(pom,r) .== 0)]

    return v,c
end


function zadatak2(A)
    gd = diag(A)
    sr = mean(gd)
    idg = triu(A,1)
    veci = idg[idg .>= sr]
    return length(veci)
end


