# AdventOfCode2025 - Utility Functions
# This module provides benchmarking and profiling utilities

module AoCUtils

using BenchmarkTools
using Profile
using ProfileCanvas

export benchmark_solution, profile_solution, run_day

"""
    benchmark_solution(solve_fn, data; samples=100)

Benchmark a solution function with the given data.

# Arguments
- `solve_fn`: The solution function to benchmark
- `data`: The input data to pass to the function
- `samples`: Number of samples for benchmarking (default: 100)

# Example
```julia
include("days/day01/solution.jl")
data = parse_input("days/day01/input.txt")
benchmark_solution(part1, data)
```
"""
function benchmark_solution(solve_fn, data; samples=100)
    println("🔬 Benchmarking $(nameof(solve_fn))...")
    result = @benchmark $solve_fn($data) samples=samples
    display(result)
    return result
end

"""
    profile_solution(solve_fn, data; n=1000)

Profile a solution function with the given data.
Opens an interactive profile viewer.

# Arguments
- `solve_fn`: The solution function to profile
- `data`: The input data to pass to the function
- `n`: Number of times to run the function for profiling (default: 1000)

# Example
```julia
include("days/day01/solution.jl")
data = parse_input("days/day01/input.txt")
profile_solution(part1, data)
```
"""
function profile_solution(solve_fn, data; n=1000)
    println("📊 Profiling $(nameof(solve_fn))...")
    
    # Clear any previous profiling data
    Profile.clear()
    
    # Run the function multiple times to get meaningful profiling data
    @profile for _ in 1:n
        solve_fn(data)
    end
    
    # Display the profile results
    ProfileCanvas.html()
end

"""
    run_day(day::Int)

Run the solution for a specific day.

# Arguments
- `day`: Day number (1-25)

# Example
```julia
run_day(1)
```
"""
function run_day(day::Int)
    day_str = lpad(day, 2, '0')
    solution_path = joinpath(@__DIR__, "..", "days", "day$day_str", "solution.jl")
    
    if !isfile(solution_path)
        error("Solution file not found: $solution_path")
    end
    
    include(solution_path)
    Main.main()
end

end # module
