using Pkg;
Pkg.add("Plots")
using Plots;

x = 1:0.1:10

y = sin.(x)
y1 = cos.(x)
plot(x,[y,y1])

xlabel!("t")
ylabel!("y")


# Trougao

t = 1:0.:10





