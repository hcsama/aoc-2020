//
//  Puzzle2.swift
//  AdventOfCode2020
//
//  Created by Hans-Christian Fuchs on 02.12.20.
//

import Foundation

struct pass {
    var min: Int
    var max: Int
    var c: String
    var p: String
}

func ToPass(_ pp: String) -> pass
{
    let i = pp.components(separatedBy: CharacterSet(charactersIn: "-: "))
    return pass(min: Int(i[0])!, max: Int(i[1])!, c: i[2], p: i[4])
}

func Puzzle2()
{
    let file = try! String(contentsOfFile: "/Users/hch/Documents/XCode/AdventOfCode2020/AdventOfCode2020/day02-1.txt")
    let passwd = file.components(separatedBy: "\n").dropLast().map { ToPass($0) }

    let correct = passwd.reduce(0, { (res, ps) -> Int in let c = ps.p.reduce(0, {String($1) == ps.c ? $0+1 : $0}); if c >= ps.min && c <= ps.max { return res + 1 } else {return res} })
    print("02-1: ", correct)

    let correct2 = passwd.reduce(0, { (res, ps) -> Int in
                                    let a = String(ps.p[ps.p.index(ps.p.startIndex, offsetBy: ps.min-1)])
                                    let b = String(ps.p[ps.p.index(ps.p.startIndex, offsetBy: ps.max-1)])
                                    if a != b && (a == ps.c || b == ps.c)
                                    {
                                        return res + 1
                                    } else
                                    {
                                        return res
                                    } })
    print("02-2: ", correct2)
}

