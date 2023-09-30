using ControlSystems, Plots

function model_el_kola(R, L, C)
    s = tf("s")
    Zr = R
    Zl = s * L
    Zc = 1 / (s * C)
    Zek = ((Zc + Zr) * Zr) / (Zc + 2 * Zr)
    return minreal(Zek / (Zek + Zl))
end

R = 100 # 0.1 kΩ
L = 0.022 # 22 mH
C = 4.7 * 10^-7 # 470 nF

G = model_el_kola(R, L, C)
t = 0:0.01:10
u = abs.(sin.(t))

y_step, t, x = step(G, t)
y_sin, t, x = lsim(G, u', t)

plot(t, y_step', lw=2, xticks=0:10, label="y_step")
plot!(t, y_sin', lw=2, label="y_sin")
