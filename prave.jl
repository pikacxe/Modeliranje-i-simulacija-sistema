using Plots


function signal(t)
    tp = rem.(t,5)
    return 2 * tp .* (tp .<= 2) .+ (2 .* ((tp .> 2) .& (tp .<= 4))) .+ (-2 .* tp .+ 10) .* (tp .> 4)
end

t = 0:0.1:10


plot(t,signal(t), xticks=(0:10))


function trougao(t)
    tp = rem.(t,2)
    return 5 * tp .* (tp .<= 1)  .+ (-5 * tp .+10) .* (tp .> 1)
end

plot(t,trougao(t), xticks=(0:10))


t = 0:0.1:6

function minsin(t)
    tp = rem.(t,3)
    y1 = 1/3 * tp
    y = min.(abs.(sin.(pi/3 * tp)), y1)
    scatter(t, abs.(sin.(pi/3 * tp)), markershape=:o, markercolor=:green, color=:yellow, label= "y1")
    plot!(t,y, xticks=(0:10)) 
end


t = 0:0.01:2 *pi
tp = rem.(t,2 * pi)
tp1 = rem.(tp,1)
y1 = 1 * (tp1 .<=0.5)
y2 = -1 * (tp1 .<=0.5)
z =  min.(sin.(tp),y1) .* (tp .<= pi) .+ max.(sin.(tp),y2) .* (tp .> pi)

plot(t,[z y1 y2 y], xticks = (0:pi:2 * pi), layout = 4)
