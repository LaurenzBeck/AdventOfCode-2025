# 🎄 Advent of Code 2025

My solutions for [Advent of Code 2025](https://adventofcode.com/2025) in Julia.

## 📋 Table of Contents

- [Setup](#-setup)
- [Project Structure](#-project-structure)
- [Running Solutions](#-running-solutions)
- [Benchmarking](#-benchmarking)
- [Profiling](#-profiling)
- [Solutions](#-solutions)

## 🚀 Setup

### Prerequisites

1. **Install Julia** (version 1.10 or higher recommended)
   - Download from [julialang.org](https://julialang.org/downloads/)
   - Or use [juliaup](https://github.com/JuliaLang/juliaup) for version management:
     ```bash
     curl -fsSL https://install.julialang.org | sh
     ```

2. **Clone this repository**
   ```bash
   git clone https://github.com/LaurenzBeck/AdventOfCode-2025.git
   cd AdventOfCode-2025
   ```

3. **Install dependencies**
   ```bash
   julia --project=. -e 'using Pkg; Pkg.instantiate()'
   ```

### Quick Verification

To verify your setup is working:
```bash
julia --project=. -e 'println("Julia ", VERSION, " is ready! 🎄")'
```

## 📁 Project Structure

```
AdventOfCode-2025/
├── Project.toml          # Julia project dependencies
├── README.md             # This file
├── LICENSE               # MIT License
├── src/
│   └── AoCUtils.jl       # Utility functions for benchmarking and profiling
└── days/
    ├── day01/
    │   ├── solution.jl   # Solution code for Day 1
    │   └── input.txt     # Puzzle input (add your own)
    ├── day02/
    │   ├── solution.jl
    │   └── input.txt
    └── ...               # Days 3-25 follow the same structure
```

## ▶️ Running Solutions

### Run a specific day's solution

```bash
# Run Day 1
julia --project=. days/day01/solution.jl

# Run Day 5
julia --project=. days/day05/solution.jl
```

### Run from Julia REPL

```julia
# Start Julia REPL with project environment
# julia --project=.

# Include and run a solution
include("days/day01/solution.jl")
main()
```

### Using the utility module

```julia
using Pkg
Pkg.activate(".")

include("src/AoCUtils.jl")
using .AoCUtils

# Run a specific day
run_day(1)
```

## ⏱️ Benchmarking

This project uses [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl) for performance benchmarking.

### Quick Benchmark

```julia
# Start Julia REPL with project environment
# julia --project=.

using BenchmarkTools

# Include the solution
include("days/day01/solution.jl")

# Parse the input
data = parse_input("days/day01/input.txt")

# Benchmark Part 1
@benchmark part1($data)

# Benchmark Part 2
@benchmark part2($data)
```

### Using AoCUtils

```julia
include("src/AoCUtils.jl")
using .AoCUtils

include("days/day01/solution.jl")
data = parse_input("days/day01/input.txt")

# Benchmark with custom samples
benchmark_solution(part1, data, samples=100)
benchmark_solution(part2, data, samples=100)
```

### Understanding Benchmark Output

```
BenchmarkTools.Trial: 1000 samples with 10 evaluations.
 Range (min … max):  1.234 μs … 5.678 μs  ┊ GC (min … max): 0.00% … 0.00%
 Time  (median):     1.345 μs             ┊ GC (median):    0.00%
 Time  (mean ± σ):   1.456 μs ± 0.234 μs  ┊ GC (mean ± σ):  0.00% ± 0.00%
```

Key metrics:
- **min/max**: Fastest and slowest execution times
- **median**: Middle value (often most representative)
- **mean ± σ**: Average with standard deviation
- **GC**: Garbage collection time percentage

## 📊 Profiling

This project uses Julia's built-in `Profile` module and [ProfileCanvas.jl](https://github.com/pfitzseb/ProfileCanvas.jl) for interactive profiling visualization.

### Basic Profiling

```julia
# Start Julia REPL with project environment
# julia --project=.

using Profile

include("days/day01/solution.jl")
data = parse_input("days/day01/input.txt")

# Clear previous profiling data
Profile.clear()

# Profile the function (run multiple times for better data)
@profile for _ in 1:1000
    part1(data)
end

# Print profile results
Profile.print()
```

### Interactive Profiling with ProfileCanvas

```julia
using ProfileCanvas

include("days/day01/solution.jl")
data = parse_input("days/day01/input.txt")

Profile.clear()
@profile for _ in 1:1000
    part1(data)
end

# Open interactive HTML profile viewer
ProfileCanvas.html()
```

### Using AoCUtils

```julia
include("src/AoCUtils.jl")
using .AoCUtils

include("days/day01/solution.jl")
data = parse_input("days/day01/input.txt")

# Profile with custom iteration count
profile_solution(part1, data, n=1000)
```

### Profiling Tips

1. **Run multiple iterations**: Profiling works best with many executions
2. **Look for hotspots**: Focus on functions taking the most time
3. **Check allocations**: Use `@time` or `@allocated` to track memory usage
4. **Compare approaches**: Profile different implementations to find the fastest

## 📝 Solutions

| Day | Title | Part 1 | Part 2 | Notes |
|-----|-------|--------|--------|-------|
| 01  | _TBD_ | ⬜ | ⬜ | |
| 02  | _TBD_ | ⬜ | ⬜ | |
| 03  | _TBD_ | ⬜ | ⬜ | |
| 04  | _TBD_ | ⬜ | ⬜ | |
| 05  | _TBD_ | ⬜ | ⬜ | |
| 06  | _TBD_ | ⬜ | ⬜ | |
| 07  | _TBD_ | ⬜ | ⬜ | |
| 08  | _TBD_ | ⬜ | ⬜ | |
| 09  | _TBD_ | ⬜ | ⬜ | |
| 10  | _TBD_ | ⬜ | ⬜ | |
| 11  | _TBD_ | ⬜ | ⬜ | |
| 12  | _TBD_ | ⬜ | ⬜ | |
| 13  | _TBD_ | ⬜ | ⬜ | |
| 14  | _TBD_ | ⬜ | ⬜ | |
| 15  | _TBD_ | ⬜ | ⬜ | |
| 16  | _TBD_ | ⬜ | ⬜ | |
| 17  | _TBD_ | ⬜ | ⬜ | |
| 18  | _TBD_ | ⬜ | ⬜ | |
| 19  | _TBD_ | ⬜ | ⬜ | |
| 20  | _TBD_ | ⬜ | ⬜ | |
| 21  | _TBD_ | ⬜ | ⬜ | |
| 22  | _TBD_ | ⬜ | ⬜ | |
| 23  | _TBD_ | ⬜ | ⬜ | |
| 24  | _TBD_ | ⬜ | ⬜ | |
| 25  | _TBD_ | ⬜ | ⬜ | |

**Legend**: ⬜ Not started | 🟡 In progress | ⭐ Completed

---

## 📚 Resources

- [Advent of Code 2025](https://adventofcode.com/2025)
- [Julia Documentation](https://docs.julialang.org/)
- [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl)
- [ProfileCanvas.jl](https://github.com/pfitzseb/ProfileCanvas.jl)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
