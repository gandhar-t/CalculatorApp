//: Playground - noun: a place where people can play
import UIKit

var characters = [Character]()
characters = ["a", "f", "e", "p", "q"]

var currentCharacter = characters[Int(arc4random()%UInt32(characters.count)) + 1]
switch currentCharacter {
case "a", "e", "i", "o", "u":
    print("\(currentCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(currentCharacter) is a consonant")
default:
    print("\(currentCharacter) is not a vowel or a consonant")
}
