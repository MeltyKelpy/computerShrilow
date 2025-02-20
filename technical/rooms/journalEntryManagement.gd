extends Node

var entries
var JellyEntry = [
	{
	"text":"oogly googly",
	"revealed?":false,
	},
	{
	"text":"only this text should be visible",
	"revealed?":true,
	},
	{
	"text":"oogly googly",
	"revealed?":false,
	},
	]
var TheComputerEntry = [
	{
	"text":"oogly googly",
	"revealed?":false,
	},
	{
	"text":"only this text should be visible",
	"revealed?":true,
	},
	{
	"text":"oogly googly",
	"revealed?":false,
	},
	]
var ShrilowEntry = [
	{
	"text":"oogly googly",
	"revealed?":false,
	},
	{
	"text":"only this text should be visible",
	"revealed?":true,
	},
	{
	"text":"oogly googly",
	"revealed?":false,
	},
	]
var MelanieEntry = [
	{
	"text":"oogly googly",
	"revealed?":false,
	},
	{
	"text":"only this text should be visible",
	"revealed?":true,
	},
	{
	"text":"oogly googly",
	"revealed?":false,
	},
	]
var selectedJournal = 0
var journalTextToDisplay = ""

func _ready():
	updateEntryContents()

func updateEntryContents():
	#entryTexts = [
	#TheComputerEntry,
	#ShrilowEntry,
	#MelanieEntry,
	#JellyEntry,
	#MinesEntry,
	#MarketEntry,
	#QuickTimeEventEntry,
	#]
	var completeEntryJelly = ""
	for i in range(0, JellyEntry.size()):
		if JellyEntry[i]["revealed?"] == true:
			completeEntryJelly = completeEntryJelly+JellyEntry[i]["text"]+" "
		if JellyEntry[i]["revealed?"] == false:
			completeEntryJelly = completeEntryJelly+"[bgcolor=black][color=black]"+JellyEntry[i]["text"]+"[/color][/bgcolor] "
	var completeEntryComputer = ""
	for i in range(0, TheComputerEntry.size()):
		var entryText = completeEntryComputer
		if JellyEntry[i]["revealed?"] == true:
			entryText = entryText+TheComputerEntry[i]["text"]+" "
		if JellyEntry[i]["revealed?"] == false:
			entryText = entryText+"[bgcolor=black][color=black]"+TheComputerEntry[i]["text"]+"[/color][/bgcolor] "
	entries = [
	{
	"EntryName":"No Entry Selected!",
	"Text":"Select an Entry by clicking on it!",
	},
	{
	"EntryName":"The Jellies",
	"Text":completeEntryJelly,
	},
	]
