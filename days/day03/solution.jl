# Advent of Code 2025 - Day 3
# https://adventofcode.com/2025/day/3
using Chain

parse_input(📄)::Vector{Vector{Int}} =
    map(bank -> map(c -> parse(Int, c), collect(bank)), readlines(📄))

function 🔋(bank::Vector{Int}, num_batteries)::Int
    num_batteries==1 && return maximum(bank)
    index_of_first_battery = argmax(bank[1:(end-num_batteries+1)])
    10^(num_batteries-1)*bank[index_of_first_battery] +
        🔋(bank[(index_of_first_battery+1):end], num_batteries-1)
end

part1(banks) = @chain banks 🔋.(2) sum
part2(banks) = @chain banks 🔋.(12) sum

# Main execution
function main()
    input_file = joinpath(@__DIR__, "input.txt")

    if !isfile(input_file)
        println("⚠️  Input file not found: $input_file")
        println("   Please add your puzzle input to this file.")
        return
    end

    data = parse_input(input_file)

    println("🎄 Advent of Code 2025 - Day 3")
    println("━" ^ 40)

    result1 = part1(data)
    println("Part 1: $result1")

    result2 = part2(data)
    println("Part 2: $result2")
end

# Run if executed directly
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
