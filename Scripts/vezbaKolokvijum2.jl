using Plots, ControlSystems, DifferentialEquations

#u(t)
function u(t)
    tp = rem.(t,8)
    return tp .* (tp .<=2) .+ 2 .* ((tp .> 2) .&& ( tp .<= 6)) .+ (-1 .* tp .+ 8) .* (tp .> 6)
end

# p(x)
function p(x)
    return 3 .* (x .<= -3) .+ (-3/4 * x .+ 3/4) .* ((x .> -3) .&& (x .<= 1))
end

function donja_grana()
    Gg = tf([1,4],[1,1,2])
    Gp = tf(5,[5,4])
    return minreal(feedback(Gg,Gp))
end


function prob!(dx,x,p,t)
    dx[1] = x[2]
    dx[2] = x[1] - x[1]*x[2] + 1/2 * u(t)
end

tspan = (0.0,8.0)
t = 0:0.01:8
x0 = [-1,0.5]

prob = ODEProblem(prob!,x0,tspan,p)
sol = solve(prob)
sol_intr = sol(t)
y = [x[1] for x in sol_intr.u]
py = p(y)
G = donja_grana()
k,~,~  = lsim(G,u(t)',t)
z = py .+ k'

plot(t,z,lw=2,label="z(t)", xticks=0:8, xlabel="t [s]")
