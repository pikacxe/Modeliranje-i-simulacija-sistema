using Plots


# 1
function signal(t)
    tp = rem.(t,5)
    y1 = 2 .* tp .* (tp .<= 2)
    y2 = 2 .* ((tp .> 2) .& (tp .<=4))
    y3 = (-2 .* tp .+ 10) .* (tp .> 4)
    return y1 .+ y2 .+ y3
end


t = 0:0.01:10


plot(t, signal(t), xticks = (0:1:10))

# 2
t = 0:0.01:6 * pi

tp = rem.(t,pi / 3)
y1 = sin.(t)
y2 = 1 .* (tp .<= pi/6)
y3 = -1 .* (tp .<= pi/6)

tp1 = rem.(t,2 * pi)
y = min.(y1,y2) .* (tp1 .<= pi) .+ max.(y1,y3) .*(tp1 .>= pi)

plot(t,y, xticks=(0:pi:2*pi), size(2000,2000))
plot!(t,y1, ls=:dash)
plot(t,y2, ls=:dash)
plot(t,y3, ls=:dash)

# 3 
t = 0:0.01:10

tp = rem.(t,2)
y1 = 4 .* (tp .<= 1)
y2 = 2/5 * t
y = min.(y1,y2)

plot(t, y, xticks=(0:1:10), lw=2 )
plot!(t,y1, ls=:dash)

# 4
t = 0:0.1:9
t1 = 0:0.5:9
tp = rem.(t,6)
y1 = 2 * sin.((pi/3) * tp)
y2 = 1 .* (t .>= 0)
y3 = -1 .* (t .>= 0)

y = min.(y1,y2) .* (tp .< 3.5) .+ max.(y1,y3) .* (tp .>=3.5)

plot(t, y , xticks=(0:1:10))
scatter!(t1,y1[1:5:90], markershape=:o)

# 5
t = -3:0.01:3
y1 = t .^ 2 .- 1
y2 = -t .^ 2 .+ 1
plot(t,[y1 y2], xticks=(-3:1:3))


# 6
t = 0:1:15
tp = rem.(t,3)
y = 3 * tp .* (tp .< 1) + 3 .*((tp .>=1) .& (tp .<= 2)) + (-3 * tp .+ 9) .* (tp .> 2)
y1 = 3 .*((tp .>=1) .& (tp .<= 2))
plot(t,y, xticks=(0:1:15))

scatter!(t,y1)

plot(t,[(3 * tp .* (tp .<= 1)) (3 .*((tp .>=1) .& (tp .<= 2))) ((-3 * tp .+ 9) .* (tp .>= 2))], layout=4)


# 7
t = 0:0.01:2
y = sqrt.(1 .- (t .- 1).^2)

plot(t,y, xticks=(0:1:2), yticks=(0:1))


# 8

t = 0:0.01:4


tp = rem.(t,2)
y1 = 2 * tp .* (tp .<=1) + (-2 * tp .+ 4) .*(tp .>1)
y2 = sqrt.(1 .- (tp .- 1).^2)
y = min.(y1,y2)
plot(t,y,xticks=(0:1:10), lw=2)
plot!(t,y1, ls=:dash)
plot!(t,y2, ls=:dash)












