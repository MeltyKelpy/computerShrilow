extends Node

var entries = []
var entriesText = {
	"My QuickTime-Laws!":[
		true,
		{
		"text":"HELLO T.COMPUTER! I, am quicktime-event. and since i kinda RULE your stupid COMPUTER ASS im going to be putting in place NEW LAWS!\n\nLAW 1:\n\nYou will never ever insult me (Quick-Time Event) please\n\nLAW 2:\n\nif i ask you for 5 bucks you HAVE TO GIVE ME 5 BUCKS\n\nLAW 5:\n\nGetting Boobed is now slang for Getting Stabbed (came up with this one after going to the uk)\n\nLAW 31:\n\nYour 'Computer Shrilow' needs REGULAR. DOCTOR VISITS. IM MANDATING IT. mwahhaha!!\n\n",
		"id":0,
		"revealed?":true,
		},
		{
		"text":"",
		"id":1,
		"revealed?":false,
		},
		],
	"The Computer":[
		false,
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
		false,
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
		false,
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
		false,
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
		false,
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
		true,
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
		true,
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
		true,
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
	"fuck you":[
		false,
		{
		"text":"fuck you",
		"id":3,
		"revealed?":false,
		},
		]
	}

var selectedJournal = 0
var journalTextToDisplay = ""

func _unlock_entry(entryName):
	entriesText[entryName][0] = false
	updateEntryContents()

func _lock_entry(entryName):
	entriesText[entryName][0] = true
	updateEntryContents()

func _entry_state(entryName):
	return entriesText[entryName][0]

func _unlock_line(entryName, lineID):
	for i in entriesText[entryName].size():
		if i != 0:
			if entriesText[entryName][i].has("id"):
				entriesText[entryName][i]["revealed?"] = true
				break
	updateEntryContents()

func _ready():
	updateEntryContents()

func updateEntryContents():
	entries = []
	for e in entriesText.size():
		var completeEntry = ""
		if entriesText[entriesText.keys()[e]][0] == false:
			for i in range(1, entriesText[entriesText.keys()[e]].size()):
				if entriesText[entriesText.keys()[e]][i]["revealed?"] == true:
					completeEntry = completeEntry+entriesText[entriesText.keys()[e]][i]["text"]+" "
				if entriesText[entriesText.keys()[e]][i]["revealed?"] == false:
					completeEntry = completeEntry+"[bgcolor=black][color=black]"+entriesText[entriesText.keys()[e]][i]["text"]+"[/color][/bgcolor] "
			entries.append({"EntryName":entriesText.keys()[e], "Text":completeEntry})
