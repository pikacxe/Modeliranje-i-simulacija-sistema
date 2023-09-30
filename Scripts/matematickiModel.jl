using LinearAlgebra, Plots, DifferentialEquations

# 1.
function sistem!(dx, x, p, t)
    m, c1, c2, k = p
    f = sin(t)
    dx[1] = x[2]
    dx[2] = 1/m * (f - k * x[1] - (c1 + c2) * x[2])
end

t = (0.0, 10.0)
x0 = [0,0]
p = (10.0, 20.0 , 20.0 , 40.0)


prob = ODEProblem(sistem!, x0, t, p)
sol = solve(prob)

plot(sol, label=["x1(t)" "x2(t)"], lw =2, xticks=0:10)


# 2.
function  sistem2!(dx, x, p, t)
    m, c, k = p
    f = cos(t)
    dx[1] = x[2]
    dx[2] = 1/m * (f + m * 9.81 - k*x[1] - c*x[2])
end


t = (0.0, 20.0)
#     m , c,    k
p = (5.0, 10.0, 20.0)
x0 = [0.0, 0.0]

prob = ODEProblem(sistem2!, x0, t, p)
sol = solve(prob)
plot(sol, label=["x1(t)" "x2(t)"], lw =2, xticks=0:10)


# 3.
function signal(t)
    tp = rem.(t, 5)
    y = (4 * tp) .* (tp .< 1) +
        4 .* ((tp .>=1) .& (tp .< 2)) +
        (-2 * tp .+ 8) .* ((tp .>= 2) .& (tp .< 3)) +
        2 .* ((tp .>= 3).& (tp .< 4)) +
        (-2 * tp .+ 10) .* (tp .>= 4)
end

function sistem3!(dx, x, p,t)
    m1, m2, c1, c2, c3, k1, k2 = p
    f = signal(t)
    dx[1] = x[2]
    dx[2] = 1/m1 * (f + c1 * (x[4] - x[2]) - k1 * x[1])
    dx[3] = x[4]
    dx[4] = -1/m2 * (c1 * (x[4] - x[2]) + (c2 + c3) * x[4] + k2 * x[3])
end

t = (0.0, 10.0)
x0 = [0.0, 0.0, 0.0, 0.0]
p = (10.0, 15.0, 20.0, 20.0, 20.0, 40.0, 40.0)

prob = ODEProblem(sistem3!, x0,t,p)
sol = solve(prob)


plot(sol, label=["x1(t)" "x2(t)"], lw =2, xticks=0:10)

poz1 = [x[1] for x in sol.u]
poz2 = [x[3] for x in sol.u]

~, index1 = findmax(abs.(poz1))
~, index2 = findmax(abs.(poz2))
plot(sol.t, [poz1, poz2], lw=2, xticks=0:10, label=["x1(t)" "x2(t)"])
plot!([sol.t[index1]], [poz1[index1]], markershape=:o, label="max_poz1")
plot!([sol.t[index2]], [poz2[index2]], markershape=:o, label="max_poz2")



ukupno = sum(abs.(diff(poz1))) + sum(abs.(diff(poz2))) 
println("Ukupni predjeni put oba tela: $ukupno")


# 4.

function sistem4!(dx, x, p, t)
    m1, m2, c, k1, k2, k3, g = p
    dx[1] = x[2]
    dx[2] = 1/m1 * (-k1*x[1] - k2*(x[1] - x[3]) + g*m1)
    dx[3] = x[4]
    dx[4] = -1/m2 * (g*m2 + k3 * x[3] + c * x[4] - k2 * (x[1] - x[3]))
end


t = (0.0, 20.0)
x0 = [2.0, 0.0, 0.0, 0.0]
p = (5.0, 8.0, 10.0, 20.0, 20.0, 20.0, 9.81)

prob = ODEProblem(sistem4!, x0, t, p)
sol = solve(prob)

poz1 = [x[2] for x in sol.u]
poz2 = [x[4] for x in sol.u]


~, index1 = findmax(abs.(poz1))
~, index2 = findmax(abs.(poz2))
plot(sol.t, [poz1, poz2], lw=2, xticks=0:10, label=["x1(t)" "x2(t)"])
plot!([sol.t[index1]], [poz1[index1]], markershape=:o, label="max_poz1")
plot!([sol.t[index2]], [poz2[index2]], markershape=:o, label="max_poz2")


# 5.

function signal(t)
    tp = rem.(t, 2)
    y = (5 * tp) .* (tp .<= 1) .+ (-5 * tp .+ 10) .* (tp .> 1) 
end


function sistem5!(dx, x, p, t)
    m1, m2, c1, c2, c3, k1, k2 = p
    f = signal(t)
    dx[1] = x[2]
    dx[2] = 1/m1 * ( -c1 * x[2] - k1 * x[1] - k2 * (x[1] - x[3]))
    dx[3] = x[4]
    dx[4] = 1/m2 * (f + k2 * (x[1] - x[3]) - x[4] * (c2 + c3))
end


t = (0.0, 20.0)
p = (20.0, 10.0, 10.0, 10.0, 10.0, 20.0, 40.0)
x0 = [1.0,0.0,2.0,0.0]

prob = ODEProblem(sistem5!, x0, t, p)
sol = solve(prob)


plot(sol, xticks= 0:20)


# 6

function signal(t)
    tp = rem.(t,1)
    y1 = 1/2 * t
    y2 = 1 .* (tp .<= 0.5)
    y = min.(y1,y2)
end


function sistem6!(dx,x,p,t)
    m1, m2, c1, c2, c3, k1, k2 = p
    g = 9.81
    f = signal(t)
    dx[1] = x[2]
    dx[2] = 1/m1 * (g * m1 + k2 * (x[3] - x[1]) - k1 * x[1] + c1 * x[2])
    dx[3] = x[4]
    dx[4] = 1/m2 * (f + g * m2 - c2 * x[4] - k2 * (x[3] - x[1]))
end

t = (0.0, 10.0)
p = (20.0,10.0,10.0,10.0,10.0,20.0,40.0)
x0 = [-1.0,0.0,-1.0,0.0]

prob = ODEProblem(sistem6!,x0,t,p)
sol = solve(prob)


plot(sol, xticks=0:10)



