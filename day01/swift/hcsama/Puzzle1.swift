//
//  Puzzle1.swift
//  AdventOfCode2020
//
//  Created by Hans-Christian Fuchs on 02.12.20.
//

import Foundation

func Puzzle1()
{
    let file = try! String(contentsOfFile: "/Users/hch/Documents/XCode/AdventOfCode2020/AdventOfCode2020/day01-1.txt")
    let numbers = file.components(separatedBy: "\n").dropLast().map { Int($0)! }.sorted()

    outerLoop: for i in 0..<numbers.count-1
    {
        for j in i+1..<numbers.count
        {
            let res = numbers[i] + numbers[j]
            if res == 2020
            {
                print("01-1: ", String(numbers[i]) + " " + String(numbers[j]) + " " + String(numbers[i]*numbers[j]))
                break outerLoop
            }
            else if res > 2020
            {
                break
            }
        }
    }

    outLoop: for i in 0..<numbers.count-2
    {
        for j in i+1..<numbers.count-1
        {
            for k in j+1..<numbers.count
            {
                let res = numbers[i] + numbers[j] + numbers[k]
                if res == 2020
                {
                    print("01-2: ", String(numbers[i]) + " " + String(numbers[j]) + " " + String(numbers[k]) + " " + String(numbers[i]*numbers[j]*numbers[k]))
                    break outLoop
                }
                else if res > 2020
                {
                    break
                }
            }
        }
    }
}

