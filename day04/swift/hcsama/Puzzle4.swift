//
//  Puzzle4.swift
//  AdventOfCode2020
//
//  Created by Hans-Christian Fuchs on 02.12.20.
//

import Foundation


class Passport
{
    var fields: [String: String]

    init()
    {
        fields = [:]
    }

    func valid() -> Bool
    {
        return fields.count == 8 || (fields.count == 7 && fields["cid"] == nil)
    }

    func reallyvalid() -> Bool
    {
        if !valid()
        {
            return false
        }

        if let _ = fields["byr"]?.range(of: "^[0-9]{4}$", options: .regularExpression)
        {
            let y = Int(fields["byr"]!)!
            if y < 1920 || y > 2002
            {
                return false
            }
        }
        else
        {
            return false
        }

        if let _ = fields["iyr"]?.range(of: "^[0-9]{4}$", options: .regularExpression)
        {
            let y = Int(fields["iyr"]!)!
            if y < 2010 || y > 2020
            {
                return false
            }
        }
        else
        {
            return false
        }

        if let _ = fields["eyr"]?.range(of: "^[0-9]{4}$", options: .regularExpression)
        {
            let y = Int(fields["eyr"]!)!
            if y < 2020 || y > 2030
            {
                return false
            }
        }
        else
        {
            return false
        }

        if let _ = fields["hgt"]?.range(of: "^[0-9]+cm$", options: .regularExpression)
        {
            let s = fields["hgt"]!
            let h = Int(s[s.range(of: "[0-9]+", options: .regularExpression)!])!
            if h < 150 || h > 193
            {
                return false
            }
        }
        else if let _ = fields["hgt"]?.range(of: "^[0-9]+in$", options: .regularExpression)
        {
            let s = fields["hgt"]!
            let h = Int(s[s.range(of: "[0-9]+", options: .regularExpression)!])!
            if h < 59 || h > 76
            {
                return false
            }
        }
        else
        {
            return false
        }

        if let _ = fields["hcl"]?.range(of: "^#[0-9a-f]{6}$", options: .regularExpression)
        {
            // all good
        }
        else
        {
            return false
        }

        if !["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(fields["ecl"])
        {
            return false
        }

        if let _ = fields["pid"]?.range(of: "^[0-9]{9}$", options: .regularExpression)
        {
            // all good
        }
        else
        {
            return false
        }

        return true
    }
}

func Puzzle4()
{
    let file = try! String(contentsOfFile: "/Users/hch/Documents/XCode/AdventOfCode2020/AdventOfCode2020/day04-1.txt")
    let lines = file.components(separatedBy: "\n")
    var passports: [Passport] = []
    var passport = Passport()
    for line in lines
    {
        if line.count == 0
        {
            passports.append(passport)
            passport = Passport()
        }
        else
        {
            let items = line.components(separatedBy: " ")
            for item in items
            {
                let entry = item.components(separatedBy: ":")
                passport.fields[entry[0]] = entry[1]
            }
        }
    }

    let valid = passports.reduce(0, { return $1.valid() ? $0+1 : $0 })
    print("04-1: ", passports.count, valid)
    let reallyvalid = passports.reduce(0, { return $1.reallyvalid() ? $0+1 : $0 })
    print("04-2: ", reallyvalid)
}

