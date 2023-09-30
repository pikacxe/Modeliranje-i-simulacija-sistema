using Plots


function signal(t)
    tp = rem.(t,5)
    return 5 * tp .* ( tp .<=1) .+ 5 * ((tp .> 1) .&& (tp .<= 4)) .- 5*(tp .- 5) .* (tp .>4)
end


t = 0:0.01:10
y = signal(t)
plot(t,y, label="signal(t)", lw=2, xticks=(0:20))