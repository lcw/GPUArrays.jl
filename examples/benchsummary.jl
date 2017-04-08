amdcl = [4.799e-5,1.5841e-5,5.812e-6,8.606e-6,5.395e-6,5.131e-6,5.411e-6,8.138e-6]

#  i7-6700 CPU @ 3.40GHz × 8
i7jl = [1.2546e-5,0.134053,0.269828,0.402714,0.536878,0.690355,0.798552,0.937901]
i7thread8 = [3.073e-6,0.0309698,0.0610848,0.0978608,0.114297,0.151112,0.169398,0.199975]

clhd4400 = [0.00017992,0.0959272,0.0189648,0.0261118,0.0786998,0.0928996,0.0697273,0.0420179]
#gtx 950
clgtx950 = [9.1233e-5, 0.0438371, 0.0137916, 0.0186013, 0.0216159, 0.0305987, 0.0352221, 0.0335097]
cugtx950 = [0.000140596, 0.000582648, 0.00122235, 0.00177323, 0.00229491, 0.00285977, 0.00338773, 0.00354474]

#i3-4130 CPU @ 3.40GHz × 4
i3jl = [2.2031e-5, 0.14798, 0.297337, 0.44442, 0.593928, 0.742996, 0.893435, 1.04109]

i3thread = [1.8573e-5, 0.0535222, 0.107612, 0.160911, 0.220866, 0.266903, 0.320577, 0.374679]

clgtx950p2 = [8.2644e-5, 0.00407554, 0.00927465, 0.0118875, 0.0963967, 0.0161434, 0.144577, 0.0233414, 0.0643246, 0.0276158]
cugtx950p2 = [0.000123355, 0.000524402, 0.000924775, 0.0013221, 0.00143839, 0.00176742, 0.00208935, 0.00240556, 0.002733, 0.00306096]




numbers = [
    amdcl,
    i7jl,
    i7thread8,
    clhd4400,
    clgtx950,
    cugtx950,
    i3jl,
    i3thread,
]
idx = sortperm(numbers, by = maximum)
labels = [
    "OpenCL FirePro W9100"
    "Julia i7-6700"
    "8 Threads i7-6700"
    "OpenCL hd4400 Beignet"
    "OpenCL GTX950"
    "CUDA GTX950"
    "Julia i3-4130"
    "4 Threads i3-4130"
]

using Plots
x = round(Int, linspace(100, 10^7, 8))
p2 = plot(
   x, numbers[idx],
   m = (5, 0.8, :circle, stroke(0)),
   line = 1.5,
   labels = reshape(labels[idx], (1, 8)),
   title = "blackscholes GPU",
   xaxis = ("N", :log10),
   yaxis = ("Time in Seconds", :log10)
)

println("| Backend | Time in Seconds N = 10^7 |")
println("| ---- | ---- |")
for (l, nums) in zip(labels[idx], numbers[idx])
    println("| ", l, " | ", last(nums), " |")
end
