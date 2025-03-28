extends Node

var entries = []
var entriesText = {
	"The Computer":[
		{
		"text":"'The Computer' is what this place is called by its dwellers, though it",
		"id":0,
		"revealed?":true,
		},
		{
		"text":"looks different to those on the inside,",
		"id":1,
		"revealed?":false,
		},
		{
		"text":"your viewing of it still remains accurate.",
		"id":2,
		"revealed?":true,
		},
		{
		"text":"",
		"id":3,
		"revealed?":false,
		},
		],
	"Melanie // Melvin":[
		{
		"text":"oogly googly",
		"id":0,
		"revealed?":false,
		},
		{
		"text":"only this text should be visible",
		"id":1,
		"revealed?":true,
		},
		{
		"text":"oogly googly",
		"id":2,
		"revealed?":false,
		},
		],
	"Jellies":[
		{
		"text":"oogly googly",
		"id":0,
		"revealed?":false,
		},
		{
		"text":"only this text should be visible",
		"id":1,
		"revealed?":true,
		},
		{
		"text":"oogly googly",
		"id":2,
		"revealed?":false,
		},
		],
	"Minigames":[
		{
		"text":"oogly googly",
		"id":0,
		"revealed?":false,
		},
		{
		"text":"only this text should be visible",
		"id":1,
		"revealed?":true,
		},
		{
		"text":"oogly googly",
		"id":2,
		"revealed?":false,
		},
		],
	"Mines":[
		{
		"text":"oogly googly",
		"id":0,
		"revealed?":false,
		},
		{
		"text":"only this text should be visible",
		"id":1,
		"revealed?":true,
		},
		{
		"text":"oogly googly",
		"id":2,
		"revealed?":false,
		},
		],
	"Black Market":[
		{
		"text":"oogly googly",
		"id":0,
		"revealed?":false,
		},
		{
		"text":"only this text should be visible",
		"id":1,
		"revealed?":true,
		},
		{
		"text":"oogly googly",
		"id":2,
		"revealed?":false,
		},
		],
	"QuickTime-Event":[
		{
		"text":"oogly googly",
		"id":0,
		"revealed?":false,
		},
		{
		"text":"only this text should be visible",
		"id":1,
		"revealed?":true,
		},
		{
		"text":"oogly googly",
		"id":2,
		"revealed?":false,
		},
		],
	"Curses":[
		{
		"text":"Curse of Gambling:\nReplace's Melanies Shop with GAMBLING!!! run by THE ghostybricks. my goat. you HAVE to gamble to buy ANYTHING at all, literally anything! at all! and you're forced to buy whatever you get, even if its... bad.\n\n",
		"id":"gambling",
		"revealed?":false,
		},
		{
		"text":"Curse of No Bank Account:\n",
		"id":"bankaccount",
		"revealed?":false,
		},
		{
		"text":"oogly googly",
		"id":"",
		"revealed?":false,
		},
		{
		"text":"",
		"id":3,
		"revealed?":false,
		},
		],
}
var selectedJournal = 0
var journalTextToDisplay = ""

func _ready():
	updateEntryContents()

func updateEntryContents():
	entries = []
	for e in entriesText.size():
		var completeEntry = ""
		print(entriesText[entriesText.keys()[e]][0])
		for i in range(0, entriesText[entriesText.keys()[e]].size()):
			if entriesText[entriesText.keys()[e]][i]["revealed?"] == true:
				completeEntry = completeEntry+entriesText[entriesText.keys()[e]][i]["text"]+" "
			if entriesText[entriesText.keys()[e]][i]["revealed?"] == false:
				completeEntry = completeEntry+"[bgcolor=black][color=black]"+entriesText[entriesText.keys()[e]][i]["text"]+"[/color][/bgcolor] "
		print(entriesText[entriesText.keys()[e]])
		entries.append({"EntryName":entriesText.keys()[e], "Text":completeEntry})
	print(entries)
