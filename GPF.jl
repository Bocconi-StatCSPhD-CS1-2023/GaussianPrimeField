module GPF

    using Primes
    using Subscripts
    import Base: ==, +, -, *, /, inv, abs, show, promote_rule, convert
    
    struct GP{p} <: Integer
        x::UInt64
        function GP{p}(x) where {p}
            isprime(p) || throw(ArgumentError("'p' must be a positive prime"))
            return new{p}(convert(UInt64, (x % p + p) % p))
        end
    end

    # Method I have no idea why is necessary
    GP{p}(x::GP{p}) where p = x

    # String representation and type promotion rules for integers
    show(io::IO, a::GP{p}) where p = print(io, "$(a.x)$(sub(string(p)))")
    promote_rule(::Type{GP{p}}, ::Type{<:Integer}) where p = GP{p}
    promote_rule(::Type{<:Integer}, ::Type{GP{p}}) where p = GP{p}
    convert(::Type{GP{p}}, x::Integer) where p = GP{p}(x)

    # Arithmetic operations over GPF
    ==(a::GP{p1}, b::GP{p2}) where {p1, p2} = (p1 == p2) && (a.x == b.x)
    +(a::GP{p1}, b::GP{p2}) where {p1, p2} = p1 == p2 ? GP{p1}((a.x + b.x) % p1) : throw(ArgumentError("GPF have different base"))
    -(a::GP{p}) where p = GP{p}(p - a.x)
    -(a::GP{p1}, b::GP{p2}) where {p1, p2} = p1 == p2 ? GP{p1}((p1 + a.x - b.x) % p1) : throw(ArgumentError("GPF have different base"))
    *(a::GP{p1}, b::GP{p2}) where {p1, p2} = p1 == p2 ? GP{p1}((a.x * b.x) % p1) : throw(ArgumentError("GPF have different base"))
    function /(a::GP{p1}, b::GP{p2})::GP{p1} where {p1, p2}
        p1 == p2 || throw(ArgumentError("GPF have different base"))
        b.x == 0 && throw(ArgumentError("trying to divide by zero"))
        for i in 0 : (p1-1)
            c = GP{p1}(i)
            b * c == a && return c
        end
        error("$a, $b - Somthing went wrong")
    end
    inv(a::GP{p}) where p = GP{p}(1)/a
    abs(a::GP{p}) where p = a.x

    # Print a table for an arithmetic operation in this field
    function arithmetic_table(p, operation::Function=+)
        hasmethod(operation, (GP, GP)) || throw(ArgumentError("operation $operation is not defined for GP"))
        gpf = [GP{p}(i) for i in 0:(p - 1)]
        print("  $operation |")
        for b in 1:p
            print(" $(gpf[b]) |")
        end
        for a in 1:p
            print("\n $(gpf[a]) |")
            for b in 1:p
                print(" $(operation(gpf[a], gpf[b])) |")
            end
        end
        println()
    end

end