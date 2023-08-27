using Plots, DifferentialEquations, LinearAlgebra


# Primer 1.

function sistem1!(dx,x,p,t)
    m1, m2, c, k1, k2, R, g = p
    f = sin(t)
    J = 1/2 * m1 * R
    dx[1] = x[2]
    dx[2] = 1/J * ((k2* (x[3] - x[1] * R)) * R - c * x[2] - k1 * x[1])
    dx[3] = x[4]
    dx[4] = 1/m2 * ( f + m2 * g - k2 * (x[3] - x[1] * R))
end

t = (0.0, 20.0)
x0 = [0.0,0.0,2.0,0.0]
p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81)

prob = ODEProblem(sistem1!, x0, t, p)
sol = solve(prob)

o1 = [x[1] for x in sol.u]
v1 = [x[2] for x in sol.u]
a1 = diff(v1) ./ diff(sol.t)

~, index1 = findmax(abs.(v1))
~, index2 = findmax(abs.(o1))

plot(sol.t, [o1 v1])
plot!(sol.t[1:end-1], a1)
plot!([sol.t[index1]], [v1[index1]], markershape=:o)
plot!([sol.t[index2]], [a1[index2]], markershape=:o)


# Primer 2.

function signal2(t)
    tp = rem.(t,3)
    y1 = 5 .* (tp .<= 2)
    y2 = -1/3 * t + 5
    y = min.(y1,y2)
end


function sistem2!(dx, x, p, t)
    m1, m2, c, k1, k2, R, g = p
    f = signal2(t)
    J = 1/2 * m1 * R
    dx[1] = x[2]
    dx[2] = 1/J * (- c * R * x[2] - (k2 * (x[3] + R * x[1]) * R))
    dx[3] = x[4]
    dx[4] = 1/m2 * (m2 * g - f -k1 * x[3] - k2 * (R * x[1] + x[3]))
end

t = (0.0, 15.0)
x0 = [0.0,0.0,0.0,0.0]
p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81)

prob = ODEProblem(sistem2!, x0, t, p)
sol = solve(prob)

predjeni_put = [x[3] for x in sol.u]

ukupan_predjeni_put = sum(abs.(diff(predjeni_put)))
println("Ukupan predjeni put tela mase m2 je: $ukupan_predjeni_put")

t1 = [x[1] for x in sol.u]
o1 = [x[2] for x in sol.u]

plot([sol.t], [t1 o1] , lw=3)

