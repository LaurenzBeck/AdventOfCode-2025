# Advent of Code 2025 - Day 2
# https://adventofcode.com/2025/day/2
using Chain

parse_input(📄)::Vector{UnitRange{Int64}} =
    @chain readlines(📄)[1] split(",") split.("-") map(
        range -> parse(Int, range[1]):parse(Int, range[2]),
        _,
    )

is_invalid_part1(id::Int) = occursin(r"^(?!0)(\d+?)\1$", string(id))

part1(ranges::Vector{UnitRange{Int64}})::Int =
    @chain ranges map(id -> filter(is_invalid_part1, id), _) sum.() sum

is_invalid_part2(id::Int) = occursin(r"^(?!0)(\d+)\1{1,}$", string(id))

part2(ranges::Vector{UnitRange{Int64}})::Int =
    @chain ranges map(id -> filter(is_invalid_part2, id), _) sum.() sum


function main()
    input_file = joinpath(@__DIR__, "input.txt")

    if !isfile(input_file)
        println("⚠️  Input file not found: $input_file")
        println("   Please add your puzzle input to this file.")
        return
    end

    data = parse_input(input_file)

    println("🎄 Advent of Code 2025 - Day 2")
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
