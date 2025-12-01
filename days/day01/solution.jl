# Advent of Code 2025 - Day 1
# https://adventofcode.com/2025/day/1

parse_input(filename) = readlines(filename) .|> l -> (l[1] == 'R' ? 1 : -1) * parse(Int, l[2:end])

points_at_zero(🎛️) = 🎛️%100==0

zero_crossings(range) = count(points_at_zero, min(range...)+1:max(range...)-1)

part1(rotations) = count(points_at_zero, accumulate(+, rotations; init=50))

function part2(rotations)
    positions = accumulate(+, rotations; init=50)
    positions_sliding_window = zip(positions, Iterators.drop(positions, 1))
    count(points_at_zero, positions) + sum(zero_crossings, positions_sliding_window)
end

# Main execution
function main()
    input_file = joinpath(@__DIR__, "input.txt")
    
    if !isfile(input_file)
        println("⚠️  Input file not found: $input_file")
        println("   Please add your puzzle input to this file.")
        return
    end
    
    data = parse_input(input_file)
    
    println("🎄 Advent of Code 2025 - Day 1")
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
