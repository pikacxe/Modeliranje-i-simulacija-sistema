using Plots



function h(t)
    return t .>= 0
end

function d(t)
    return t .== 0
end


function signal(t)
    return A/T .* t .* h(t) - A/T .* (t .-T) .* h(t .- T) - A/2 .* h(t .- T) - A/2 .* h(t .- 2*T)
end


function signal1(t)
    return h(t) - 2 .* h(t .- T) + 2 .* h(t .- 2 * T) - h(t .- 3 * T)
end


function signal2(t)
    return  t .* h(t) - 2 .* (t .- T) .* h(t .- T) + 2 .* (t .- 2 * T) .* h(t .- 2 * T) - 2 .* (t .- 3 * T) .* h(t .- 3 * T) + (t .- 4 * T) .* h(t .- 4 * T)
end


t = -1:0.1:5
T = 2


plot(t,signal2(t), lw=3)
