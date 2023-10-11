using LinearAlgebra
include("GPF.jl")

a = GPF.GP{5}(3)
b = GPF.GP{5}(2)

println("a = $a")
println("b = $b")
println("a + b = $(a + b)")
println("a - b = $(a - b)")
println("a * b = $(a * b)")
println("a / b = $(a / b)")

println("\n\nAddition:")
GPF.arithmetic_table(5, +)

println("\nMultiplication:")
GPF.arithmetic_table(5, *)

x = [GPF.GP{5}(1) GPF.GP{5}(2); GPF.GP{5}(3) GPF.GP{5}(4)]
println("\n\nx = $x")
println("det(x) = $(det(x))")