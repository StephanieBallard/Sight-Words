//
//  Words.swift
//  SightWordsTwoProgrammaticUI
//
//  Created by Stephanie Ballard on 2/8/21.
//

import Foundation

struct SetOfWords: Hashable {
    let name: String
    var words: [String]
}

let wordSets = [setOne, setTwo, setThree, setFour, setFive, setSix]

let setOne = SetOfWords(name: "Set One", words: one)
let setTwo = SetOfWords(name: "Set Two", words: two)
let setThree = SetOfWords(name: "Set Three", words: three)
let setFour = SetOfWords(name: "Set Four", words: four)
let setFive = SetOfWords(name: "Set Five", words: five)
let setSix = SetOfWords(name: "Set Six", words: six)

let one = ["A", "I", "Am", "An", "As", "At", "Be", "By", "Do", "So", "Go", "He", "Us", "Up", "We", "In", "Is", "It", "No", "Me", "Of", "On", "To", "All", "And", "Any", "Are", "Ask", "Ate", "One"]
let two = ["Our", "Out", "Put", "Ran", "Red", "Run", "Big", "But", "Can", "Did", "Eat", "Say", "See", "She", "The", "Fly", "Get", "Had", "Has", "Ten", "Two", "Was", "Her", "Him", "His", "How", "Let", "Too", "Who", "Yes"]
let three = ["You", "Boy", "Bye", "Cat", "Day", "Low", "Now", "Not", "Off", "Old", "Saw", "Bad", "Car", "Dog", "Eye", "For", "Own", "Away", "Open", "Over", "Play", "Ride", "Said", "Blue", "Came", "Come", "Down", "Find", "Some", "Soon"]
let four = ["Stop", "Take", "That", "Them", "Then", "Four", "From", "Girl", "Good", "Have", "They", "This", "Walk", "Want", "Well", "Went", "Give", "Help", "Here", "Into", "Jump", "Just", "Know", "Like", "Were", "What", "When", "Will", "With", "Been"]
let five = ["Best", "Call", "Each", "Girl", "Make", "Many", "More", "Pink", "Than", "Fine", "Fast", "High", "Keep", "Live", "Look", "Make", "Must", "Part", "Slow", "Talk", "Year", "After", "Again", "Round", "Brown", "Could", "Every", "Thank", "There", "Black"]
let six = ["First", "Funny", "Going", "Think", "Three", "Under", "Where", "White", "Young", "About", "Green", "Night", "Their", "Which", "House", "Start", "Thing", "Would", "Please", "Pretty", "Purple", "Yellow", "Before", "Little", "Orange", "Animal", "Family", "Friend", "School", "Should"]

