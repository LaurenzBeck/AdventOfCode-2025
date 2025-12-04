# Advent of Code 2025 - Day 4
# https://adventofcode.com/2025/day/4

"from https://gist.github.com/yos1p/1d32260a02d6dfae980b98e2902f8c76#file-conv2d-jl"
function conv2d(input, filter, stride = 1)
    input_r, input_c = size(input)
    filter_r, filter_c = size(filter)

    pad_r = (filter_r - 1) ÷ 2
    pad_c = (filter_c - 1) ÷ 2

    input_padded = zeros(input_r+(2*pad_r), input_c+(2*pad_c))
    for i = 1:input_r, j = 1:input_c
        input_padded[i+pad_r, j+pad_c] = input[i, j]
    end
    input = input_padded
    input_r, input_c = size(input)

    result = zeros((input_r-filter_r) ÷ stride + 1, (input_c-filter_c) ÷ stride + 1)
    result_r, result_c = size(result)

    ir = 1
    ic = 1
    for i = 1:result_r
        for j = 1:result_c
            for k = 1:filter_r
                for l = 1:filter_c
                    result[i, j] += input[ir+k-1, ic+l-1]*filter[k, l]
                end
            end
            ic += stride
        end
        ir += stride
        ic = 1
    end

    return result
end

function parse_input(📄)
    lines = readlines(📄)
    h, w = length(lines), length(lines[1])
    A = zeros(Int, h, w)
    for i = 1:h, j = 1:w
        A[i, j] = lines[i][j] == '@'
    end
    return A
end

function part1(🗺️)
    k = [1 1 1; 1 0 1; 1 1 1]                # 8-neighbor kernel, excludes center
    N = conv2d(🗺️, k)              # zero padding at borders
    sum((🗺️ .== 1) .& (N .< 4))
end

function part2(🗺️)
    k = [1 1 1; 1 0 1; 1 1 1]
    removed = 0
    while true
        N = conv2d(🗺️, k)
        mask = (🗺️ .== 1) .& (N .< 4)
        r = sum(mask)
        r == 0 && break
        🗺️[mask] .= 0
        removed += r
    end
    removed
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

    println("🎄 Advent of Code 2025 - Day 4")
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
