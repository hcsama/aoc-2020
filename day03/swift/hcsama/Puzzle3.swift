//
//  Puzzle3.swift
//  AdventOfCode2020
//
//  Created by Hans-Christian Fuchs on 02.12.20.
//

import Foundation

func CountTrees(_ trees: [[Character]], _ angles: [[Int]]) -> [Int]
{
    var hits: [Int] = Array.init(repeating: 0, count: angles.count)

    for a in 0..<angles.count
    {
        for y in stride(from: 0, to: trees.count, by: angles[a][1])
        {
            if trees[y][(y/angles[a][1]*angles[a][0]) % trees[0].count] == "#"
            {
                hits[a] += 1
            }
        }
    }

    return hits
}

func Puzzle3()
{
    let file = try! String(contentsOfFile: "/Users/hch/Documents/XCode/AdventOfCode2020/AdventOfCode2020/day03-1.txt")
    let trees: [[Character]] = file.components(separatedBy: "\n").dropLast().map({a in a.map({b in return b})})

    let hits = CountTrees(trees, [[3, 1]])
    print("03-1: ", hits)

    let hits2 = CountTrees(trees, [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]])
    print("03-2: ", hits2.reduce(1, { $0 * $1 }))
}

