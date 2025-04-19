extends Node2D

var curClicks = 0.0
var rng = RandomNumberGenerator.new()
var held_object = false
var cameraMoveDir = "center"
var area = "notJellies"
var returnPosCamX = 577
var returnPosCamY = 324
var can = false
var melShopState = true
var melvinShopState = true
var marketShopState = true
var dialougeMode = false
var dialogKey = "none"
var alongTheDialogue = 0
var shrilowState = ""

var AnimPosCamX = 0
var AnimPosCamY = 0
var allowing = false

var melSmoke = false

var rebirthIndicated = false
var rebirthProtocol = false

var storageReturnX = 0
var storageReturnY = 0
var storageReturnA = ""

var dialogueOptionsMelanie = []
var dialogueOptionsMelvin = []
var dialogueOptionsMarket = []
var storage = []

var myEvilClockExists = false

var gumballSelection = 0
var gumballInfo = [
	{
	"Name":"Common Coin",
	"Desc":"The Common Coin - 200$\nbasic coin for getting jellies.\n\nCommon Chance: 98%\nUncommon Chance: 1.5%\nRare Chance: 0.5%\nAwesome Chance: 0%\nQueer Chance: 0%",
	"Cost":200,
	"imagePath":"res://assets/images/areas/gumball/coins/common.png",
	"1STOrder":"CommonChance", 
	"2NDOrder":"UncommonChance", 
	"3RDOrder":"RareChance", 
	"4THOrder":"AwesomeChance", 
	"5THOrder":"QueerChance",
	"CommonChance":98.0,
	"UncommonChance":1.5,
	"RareChance":0.5,
	"AwesomeChance":0.0,
	"QueerChance":0.0,
	},
	{
	"Name":"Uncommon Coin",
	"Desc":"The Uncommon Coin - 400$\nallows you to get uncommons alot more easily, but with added price.\n\nCommon Chance: 15%\nUncommon Chance: 80%\nRare Chance: 4%\nAwesome Chance: 1%\nQueer Chance: 0%",
	"Cost":400,
	"imagePath":"res://assets/images/areas/gumball/coins/uncommon.png",
	"1STOrder":"UncommonChance", 
	"2NDOrder":"CommonChance", 
	"3RDOrder":"RareChance", 
	"4THOrder":"AwesomeChance", 
	"5THOrder":"QueerChance",
	"CommonChance":15.0,
	"UncommonChance":80.0,
	"RareChance":4.0,
	"AwesomeChance":1.0,
	"QueerChance":0.0,
	},
	{
	"Name":"Rare Coin",
	"Desc":"The Rare Coin - 800$\nallows you to get rares alot more easily, but for ALOT more money.\n\nCommon Chance: 4%\nUncommon Chance: 30%\nRare Chance: 60%\nAwesome Chance: 18%\nQueer Chance: 1%",
	"Cost":800,
	"imagePath":"res://assets/images/areas/gumball/coins/rare.png",
	"1STOrder":"RareChance", 
	"2NDOrder":"UncommonChance", 
	"3RDOrder":"AwesomeChance", 
	"4THOrder":"CommonChance", 
	"5THOrder":"QueerChance",
	"CommonChance":4.0,
	"UncommonChance":30.0,
	"RareChance":60.0,
	"AwesomeChance":15.0,
	"QueerChance":1.0,
	},
	{
	"Name":"Awesome Coin",
	"Desc":"The Awesome Coin - 2000$\nallows you to get awesomes abit more easily, but for NOTABLY more money.\n\nCommon Chance: 0%\nUncommon Chance: 19%\nRare Chance: 40%\nAwesome Chance: 40%\nQueer Chance: 1%",
	"Cost":2000,
	"imagePath":"res://assets/images/areas/gumball/coins/awesome.png",
	"1STOrder":"RareChance", 
	"2NDOrder":"AwesomeChance", 
	"3RDOrder":"UncommonChance", 
	"4THOrder":"QueerChance", 
	"5THOrder":"CommonChance",
	"CommonChance":0.0,
	"UncommonChance":19.0,
	"RareChance":40.0,
	"AwesomeChance":40.0,
	"QueerChance":1.0,
	},
	{
	"Name":"Queer Coin",
	"Desc":"The Queer Coin - $7500\nallows you to get queers abit more easily, but for INSANELY more money.\n\nCommon Chance: 0%\nUncommon Chance: 10%\nRare Chance: 35%\nAwesome Chance: 55%\nQueer Chance: 5%",
	"Cost":7500,
	"imagePath":"res://assets/images/areas/gumball/coins/queer.png",
	"1STOrder":"AwesomeChance", 
	"2NDOrder":"RareChance", 
	"3RDOrder":"UncommonChance", 
	"4THOrder":"QueerChance", 
	"5THOrder":"CommonChance",
	"CommonChance":0.0,
	"UncommonChance":15.0,
	"RareChance":35.0,
	"AwesomeChance":50.0,
	"QueerChance":5.0,
	},
	{
	"Name":"Platinum Coin",
	"Desc":"The Platinum Coin - $1000000\nallows you to get queers alot more easily, but for ABYSMALLY more money.\n\nCommon Chance: 0%\nUncommon Chance: 0%\nRare Chance: 5%\nAwesome Chance: 80%\nQueer Chance: 15%",
	"Cost":1000000,
	"imagePath":"res://assets/images/areas/gumball/coins/platinum.png",
	"1STOrder":"AwesomeChance", 
	"2NDOrder":"RareChance", 
	"3RDOrder":"UncommonChance", 
	"4THOrder":"QueerChance", 
	"5THOrder":"CommonChance",
	"CommonChance":0.0,
	"UncommonChance":0.0,
	"RareChance":5.0,
	"AwesomeChance":80.0,
	"QueerChance":15.0,
	},
	]

var gambleTickets = [
	{
	"Name":"Basic Ticket",
	"Desc":"Basic Gambling Ticket. Doesn't give anything crazy.",
	"Cost":100,
	"imagePath":"res://assets/images/areas/bricks/tickets/basic.png",
	"possibilities":["Autoclick","Autoclick"],
	},
	{
	"Name":"Medium Ticket",
	"Desc":"Medium Gambling Ticket. Gives medium level quality items.",
	"Cost":400,
	"imagePath":"res://assets/images/areas/bricks/tickets/medium.png",
	"possibilities":["GreasepuppyEvil","GreasepuppyEvil"],
	},
	{
	"Name":"High Ticket",
	"Desc":"High Gambling Ticket. Gives high level quality items.",
	"Cost":800,
	"imagePath":"res://assets/images/areas/bricks/tickets/high.png",
	"possibilities":["Plus One","Plus One"],
	},
	{
	"Name":"Spice Ticket",
	"Desc":"Spice Gambling Ticket. Gives any possible item.",
	"Cost":1500,
	"imagePath":"res://assets/images/areas/bricks/tickets/spice.png",
	"possibilities":["Antivirus","Antivirus"],
	},
	]
var ItemNameDisplay = ""
var ItemDescDisplay = ""
var selTicket = 0
var canGamble = true

var talker = "Phantom"

var shitShrilowCanSay = [
	"Whos leg do i gotta hump to get a dry martini around here?",
	"FAGGOT. FAGGOT. FAGGOT.",
	"I wouldnt have missed",
	"I hope everyone who dies goes to hell no matter what",
	"I love moka dot coka",
	"I'm a real person",
	"you should go get an autism diagnosis",
	"play my game",
	"men",
	"ooo you wanna click me! ooo u wanna do it!",
	"pickle",
	"i turned myself into a pickle once, funniest thing ive ever done",
	"hear me out",
	"the bible? i hardly know her!",
	"who are you.",
	"IVE BEEN FUCKING PETRIFIED HELP ME",
	"I LOVE eating bones. but its not cuz im a dog, i just LOVE feeling the cartilage melt in my stomach acid",
	"luigi was right",
	"this is slander, im suing you.",
	"when you click me in-game, i feel all the pain in real life. all of it. its like a voodoo doll",
	"my dick is HARD",
	"my dick is soft",
	"i will never become youtube kids slop, because i will say, fuck! yurp. thats a bad word.",
	"of montreal",
	"hello",
	"so... do you come here often?",
	"y'know, its been awhile since ive felt human body heat",
	"it aint easy being a computer...",
	]

var cacapoopyGOD = preload("res://technical/MelaniesItem.tscn")

var jellies
var mines
var puppies
var rooms

var marketIntro = false

var doctorCalled = false
var lawsInformed = false

var coconut

var textu

func manageScenes():
	dialougeMode = true
	if melShopState == false:
		$Shop/ItemDescription.visible_ratio = 0
	if melvinShopState == false:
		$Melvin/ItemDescription.visible_ratio = 0
	if marketShopState == false:
		$BlackMarket/talk.visible_ratio = 0
	clearDialogItems()
	# MELANIE DIALOGUE BELOW
	match dialogKey:
		"none":
			if !Game.contains_curse("gambling"):
				if alongTheDialogue == 0:
					$Shop/ItemDescription.text = "Still Listening!"
					setShopBase("melanie")
				if alongTheDialogue == 1:
					$Shop/ItemDescription.text = "this also worked as a test, which is cool"
				if alongTheDialogue == 2:
					endDialogue()
		"HOW":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "Honestly? i dont really remember"
				for i in FizzyDrink.melDialogue.size():
					if FizzyDrink.melDialogue[i]["dialogKey"] == "COMPUTEROPINIONS":
						FizzyDrink.melDialogue[i]["unlocked"] = true
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "just sortaaa... woke up here?? i guess??"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "not too insanely pressed, alot of my other friends are here, like shrilow! and thats cool!!.. I guess?"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "does it make up for being trapped inside a computer? no LOL but its good enough if im gonna be here anyways."
			if alongTheDialogue == 4:
				endDialogue()
		"COMPUTEROPINIONS":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "Its kinda chill, Jerry is annoying as fuck but i can handle him."
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "That quick time event prick is a littleee bit annoying tho, same with those black market guys GOD FORBID someone do something original around here, huh?"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "but yeah, its fine, i guess"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "Never in my life did i think i'd be scared of a recycling bin, though. eugh. its SCARY in there."
			if alongTheDialogue == 4:
				endDialogue()
		"MELVIN":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "woah haha uhm whatareyou talking about idk who that is haha"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "ha!... haha....... ha... SHUT UP"
			if alongTheDialogue == 2:
				endDialogue()
		"ABTYOU":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "Sure, im Melanie"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "average shopkeeper around the computer, its all i really do now that im here"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "i hope to do something more than just this someday, but if i dont then whatever"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "also my pronouns are she/it, if thats smth u care abt"
			if alongTheDialogue == 4:
				endDialogue()
		"INTERESTS":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "i really like drawing, and also coding, and listening to music, and getting high"
				for i in FizzyDrink.melDialogue.size():
					if FizzyDrink.melDialogue[i]["dialogKey"] == "CODING" or FizzyDrink.melDialogue[i]["dialogKey"] == "MLP" or FizzyDrink.melDialogue[i]["dialogKey"] == "WEED":
						FizzyDrink.melDialogue[i]["unlocked"] = true
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "and also girls, and also boys, one very specific alien boy to be exact"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "i also really like my little pony gen 4, SPECIFICALLY gen 4"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "thats about it, I guess?"
			if alongTheDialogue == 4:
				endDialogue()
		"CODING":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "coding is like. 10x easier than people make it seem"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "i've been coding for about 2 years now, and it's been real fun"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "except for when its not."
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "like the one time i sobbed while coding Enemy AI"
			if alongTheDialogue == 4:
				endDialogue()
		"MLP":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "i like MLP Gen 4 alot, been a fan for awhile now"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "pinkie pie is my favorite probably, but i like all of the mane 6 and the extended mane 6 aswell"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "despite being a kids show its still really good, and that makes sense cuz it was made when kid's television wasnt TRASH AND ASS so yk"
			if alongTheDialogue == 3:
				endDialogue()
		"WEED":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "what's there to say? i like smoking weed"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "im high off my mind as we speak, actually"
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "you tryna get some? i know a guy"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "offers there, just saying"
			if alongTheDialogue == 4:
				endDialogue()
		#"STILLWAKES":
			#if alongTheDialogue == 0:
				#$Shop/ItemDescription.text = "genuinely the best game of 2024, no competition"
			#if alongTheDialogue == 1:
				#$Shop/ItemDescription.text = "beautiful sound design, genuinely scary, and visually beautiful aswell, what more could you want?"
			#if alongTheDialogue == 2:
				#$Shop/ItemDescription.text = "it's pretty linear, though. so it depends if thats something you fuck with or not"
			#if alongTheDialogue == 3:
				#$Shop/ItemDescription.text = "its kind of on the more expensive side, i suppose. if you dont got 50ish bucks laying around then i personally recommend jacksepticeye's playthrough of it, i really enjoyed that one"
			#if alongTheDialogue == 4:
				#endDialogue()
		"JERRY":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "oh. yeah. that guy."
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "nobody likes him around here, espesically shoprunners."
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "its almost like he exists PURELY to steal all our money ( its all he does anyway, might as well be. )"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "i can say for CERTAIN that anyone around here fucking hates that guy. fact check me if you want, or dont. i dont rly care"
			if alongTheDialogue == 4:
				endDialogue()
		"SKIBIDI":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "...."
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "consider jumping off a building, maybe ?"
			if alongTheDialogue == 2:
				endDialogue()
		"JELLIES":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "oh, yeah those things"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "i have no goddamn clue why they look like me, they just do."
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "but, because of that fact; when they seen me for the first time they declared me as their fucking QUEEN?!??!"
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "so yeah idk i've been hiding from them ever since"
			if alongTheDialogue == 4:
				$Shop/ItemDescription.text = "theres so fucking many of them, and they're alot more evil than they seem dude."
			if alongTheDialogue == 5:
				$Shop/ItemDescription.text = "they tried to give me a dead bird as a royal offering. where are they finding birds in the computer ??"
			if alongTheDialogue == 6:
				endDialogue()
		"MARKETCONTINUED":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "Ugh. those guys"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "look, i dont HATE them, but im JUSTTT SAYIN' they only started doin their shit after I did."
			if alongTheDialogue == 2:
				$Shop/ItemDescription.text = "like, c'mon, do something original."
			if alongTheDialogue == 3:
				$Shop/ItemDescription.text = "cant hate em too bad though, i mean, they're the only ones who have a sembalance of whats going on. i kinda need them around."
			if alongTheDialogue == 4:
				for i in FizzyDrink.marketDialogue.size():
					if FizzyDrink.marketDialogue[i]["dialogKey"] == "MELANIN":
						FizzyDrink.marketDialogue[i]["unlocked"] = true
				endDialogue()
	
	# BRICKS DIALOGUE BELOW
	match dialogKey:
		"none":
			if Game.contains_curse("gambling"):
				if alongTheDialogue == 0:
					$Shop/ItemDescription.text = "Fine! no gambling! dialogue it is!... loser."
				if alongTheDialogue == 1:
					$Shop/ItemDescription.text = "this also worked as a test, which is cool"
				if alongTheDialogue == 2:
					endDialogue()
		"ABTYOUBRICKS":
			if alongTheDialogue == 0:
				$Shop/ItemDescription.text = "i am bricks. ghostybricks"
			if alongTheDialogue == 1:
				$Shop/ItemDescription.text = "im feeling quite. bricked! up! heh."
			if alongTheDialogue == 2:
				endDialogue()
	
	# MELVIN DIALOGUE BELOW
	match dialogKey:
		"none":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "u should NOT be seeing this."
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = "this also worked as a test, which is cool"
			if alongTheDialogue == 2:
				endDialogue()
		"ABTYOUMELV":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "Oh, yes! o-of course"
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = "I am, mel..vin"
			if alongTheDialogue == 2:
				$Melvin/ItemDescription.text = "I run the Jelly Daycare!"
			if alongTheDialogue == 3:
				$Melvin/ItemDescription.text = "And I have, absolutely NO correlation to that other shopkeeper! none at all! ha!.. haha!"
			if alongTheDialogue == 4:
				$Melvin/ItemDescription.text = "...hm........."
			if alongTheDialogue == 5:
				endDialogue()
		"ABTYOUMELV":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "Oh, yes! o-of course"
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = "I am, mel..vin"
			if alongTheDialogue == 2:
				$Melvin/ItemDescription.text = "I run the Jelly Daycare!"
			if alongTheDialogue == 3:
				$Melvin/ItemDescription.text = "And I have, absolutely NO correlation to that other shopkeeper! none at all! ha!.. haha!"
			if alongTheDialogue == 4:
				$Melvin/ItemDescription.text = "...hm........."
			if alongTheDialogue == 5:
				endDialogue()
		"ABTDAYCARE":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "I opened it awhile ago when i seen a.."
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = '.."poor and helpless" jelly sitting in a folder'
			if alongTheDialogue == 2:
				$Melvin/ItemDescription.text = "So i started this daycare to.. contain them."
			if alongTheDialogue == 3:
				$Melvin/ItemDescription.text = "I tend to their needs, and i give them a place to live that they"
			if alongTheDialogue == 4:
				$Melvin/ItemDescription.text = "CANT GET OUT OF."
			if alongTheDialogue == 5:
				endDialogue()
		"JELLYORIGINS":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "I don't know a whole lot, but ive overheard some stuff"
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = "If I remember correctly, they're shortcut files of another puter-person, Melanie"
			if alongTheDialogue == 2:
				$Melvin/ItemDescription.text = "Apparently, they were made on accident, and in the recycling bin they somehow managed to copy their file"
			if alongTheDialogue == 3:
				$Melvin/ItemDescription.text = "I dont know if they're still cloning or anything, but there sure is alot of them."
			if alongTheDialogue == 4:
				$Melvin/ItemDescription.text = "(I hope someday they get deleted and cleared.)"
			if alongTheDialogue == 5:
				endDialogue()
		"CARINGFORJELLIES":
			if alongTheDialogue == 0:
				$Melvin/ItemDescription.text = "Since we're digital, they dont really eat or anything"
			if alongTheDialogue == 1:
				$Melvin/ItemDescription.text = "they do need.. attention, though."
			if alongTheDialogue == 2:
				$Melvin/ItemDescription.text = "If they dont have another jelly to talk to, or someone to hang out with, they get violent."
			if alongTheDialogue == 3:
				$Melvin/ItemDescription.text = "so, keeping them entertained is a high priority"
			if alongTheDialogue == 4:
				$Melvin/ItemDescription.text = "we wouldnt want another Jel-leven."
			if alongTheDialogue == 5:
				endDialogue()
	
	# MARKET DIALOGUE BELOW
	match dialogKey:
		"none":
			if alongTheDialogue == 0:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+" u should NOT be seeing this."
			if alongTheDialogue == 1:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"this also worked as a test, which is cool"
			if alongTheDialogue == 2:
				endDialogue()
		"whoAreYall":
			if alongTheDialogue == 0:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"Oh, fuck yeah! I get to-"
			if alongTheDialogue == 1:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"I am cutting you off before you say anything else."
			if alongTheDialogue == 2:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"cries"
			if alongTheDialogue == 3:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+'I am formally known as "The Antagonist", but you can just call me Antag though.'
			if alongTheDialogue == 4:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"Antagy Wagy."
			if alongTheDialogue == 5:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 6:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"so i'm done talking now."
			if alongTheDialogue == 7:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"Best day ever."
			if alongTheDialogue == 8:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"Anyway now that this BOZO shut UP... I'm Phantom."
			if alongTheDialogue == 9:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"You can just call me... uh... uhm... uh... hmm.... uhhhhhhh....."
			if alongTheDialogue == 10:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"You got this."
			if alongTheDialogue == 11:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"uhh... FUCK uhhhh..."
			if alongTheDialogue == 12:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 13:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 14:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 15:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"You ca-"
			if alongTheDialogue == 16:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"PHAAantom"
			if alongTheDialogue == 17:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 18:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"I hate you."
			if alongTheDialogue == 19:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"We came from likes. a different place! yeah. a different one!"
			if alongTheDialogue == 20:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"and we're also, unfortunately, stuck together. why? i couldnt really tell you, to be honest."
			if alongTheDialogue == 21:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"It's because he loooovveeess me!"
			if alongTheDialogue == 22:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"i do not."
			if alongTheDialogue == 23:
				endDialogue()
		"whatIsThis":
			if alongTheDialogue == 0:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"Don't eat those mushrooms or you will die."
			if alongTheDialogue == 1:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"wh- Okay?? What mushrooms??"
			if alongTheDialogue == 2:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"those"
			if alongTheDialogue == 3:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"define those"
			if alongTheDialogue == 4:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"no."
			if alongTheDialogue == 5:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 6:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"We have to pay the bills somehow, so this is our way of doing it."
			if alongTheDialogue == 7:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"So yeah you're in the Black Market."
			if alongTheDialogue == 8:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"We sell stuff under the nose of QuickTime Event"
				for i in FizzyDrink.marketDialogue.size():
					if FizzyDrink.marketDialogue[i]["dialogKey"] == "QTE":
						FizzyDrink.marketDialogue[i]["unlocked"] = true
			if alongTheDialogue == 9:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"Anything bought here cant be controlled by him."
			if alongTheDialogue == 10:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"If you think it's shady and stuff that's just because we painted the walls black."
			if alongTheDialogue == 11:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"That, and also Black Markets are shady."
			if alongTheDialogue == 12:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"We painted the walls black just because any other color would make me rip my hair out."
			if alongTheDialogue == 13:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"...Erm ...you actually painted them eigengrau!"
			if alongTheDialogue == 14:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"..Ignore him."
			if alongTheDialogue == 15:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"Wait no i HATE being ignored!"
			if alongTheDialogue == 16:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"This place is where you can get yourself upgrades, either temporary or permanent."
			if alongTheDialogue == 17:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"starts hyperventilating!"
			if alongTheDialogue == 18:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"We run very similarly to Melanie's shop. But honestly, you'd be hard pressed to find a shop that doesn't."
			if alongTheDialogue == 19:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"la la la la la la la"
			if alongTheDialogue == 20:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"Every time you rebirth, you'll get these little rebirth tokens... Holds up a rebirth token."
			if alongTheDialogue == 21:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"lalalaal wait why did you say that out loud"
			if alongTheDialogue == 22:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"And you can trade those tokens in for upgrades that last in between rebirths."
			if alongTheDialogue == 23:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"HAHAHA INbtweEEEn LALALALALLAL"
			if alongTheDialogue == 24:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"...Rebirthing is a much more complicated feature that I don't feel like explaining right now though."
			if alongTheDialogue == 25:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"LALALALALALALALALALALALA"
			if alongTheDialogue == 26:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"FOR THE LOVE OF THE CREATOR SHUT THE FUCK. UP."
			if alongTheDialogue == 27:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"okay!"
			if alongTheDialogue == 28:
				endDialogue()
		"skibidi":
			if alongTheDialogue == 0:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"yeah, i like pickles"
			if alongTheDialogue == 1:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 2:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"phantom they asked if we fuck with skibidi toilet."
			if alongTheDialogue == 3:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 4:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"yeah i like pickles"
			if alongTheDialogue == 5:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"...well i don't like pickles or skibidi toilet. not my thing, honestly."
			if alongTheDialogue == 6:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"three days"
			if alongTheDialogue == 7:
				endDialogue()
		"MELANIN":
			if alongTheDialogue == 0:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"she comes down here alot, actually"
			if alongTheDialogue == 1:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"and shes always trying to ask us stuff. all the time."
			if alongTheDialogue == 2:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"its cuz im really really smart btw"
			if alongTheDialogue == 3:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"it's actually probably because of all the stuff we know that she doesnt."
			if alongTheDialogue == 4:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"oh. yeah i guess... i guesss that makes sense.. hmph"
			if alongTheDialogue == 5:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"are you 4 years old"
			if alongTheDialogue == 6:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"kinda"
			if alongTheDialogue == 7:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"close enough."
			if alongTheDialogue == 8:
				endDialogue()
		"QTE":
			if alongTheDialogue == 0:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"oh you mean playstation controller, right?"
			if alongTheDialogue == 1:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"I told you he's an Xbox!"
			if alongTheDialogue == 2:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"you know i'm right"
			if alongTheDialogue == 3:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"No you are not! shut up!"
			if alongTheDialogue == 4:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"okay!"
			if alongTheDialogue == 5:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"But uh.. he controls all this. I'm assuming you know that, though."
			if alongTheDialogue == 6:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"He primarily controls the computer's main-area, otherwise known as where that shrilow guy is."
			if alongTheDialogue == 7:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"Most well known for his minigames, he doesnt seem too harmless at first. but thats mainly a trick"
			if alongTheDialogue == 8:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"He's also our landlord"
			if alongTheDialogue == 9:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"Yeah, what a bad landlord! I mean, whats he need all those tokens for? quite a! weird form of payment!"
			if alongTheDialogue == 10:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"If i had all those tokens i'd put them in a big box somewhere haha not that ive done that or anything!"
			if alongTheDialogue == 11:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"Atleast its something we can manage, we dont really have money or anything."
			if alongTheDialogue == 12:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"He isnt gonna kill everyone or anything, but he's a control freak, and we think thats not very chill."
			if alongTheDialogue == 13:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"yeah antag only thinks its cool when HE'S a control freak!"
			if alongTheDialogue == 14:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"I'M NOT A CONTROL FREAK"
			if alongTheDialogue == 15:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"I dunnooooo....."
			if alongTheDialogue == 16:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"just because I didnt let you clone yourself that one time, doesnt mean im a control freak"
			if alongTheDialogue == 17:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"You hate fun"
			if alongTheDialogue == 18:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"I hate YOU"
			if alongTheDialogue == 19:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"Same thing"
			if alongTheDialogue == 20:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"rot."
			if alongTheDialogue == 21:
				endDialogue()
		"BRICKS":
			if alongTheDialogue == 0:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"same person"
			if alongTheDialogue == 1:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"Wh- Okay, I know you guys look similar but you are NOT the same person"
			if alongTheDialogue == 2:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"...y-yeah i.. i knew that!"
			if alongTheDialogue == 3:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"Phantom thought Mr. Bricks looked cool, so he copied his appearance a long time ago"
			if alongTheDialogue == 4:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"did not"
			if alongTheDialogue == 5:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"Yes you did."
			if alongTheDialogue == 6:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"did not"
			if alongTheDialogue == 7:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"Phantom, stop it."
			if alongTheDialogue == 8:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"did not"
			if alongTheDialogue == 9:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"..."
			if alongTheDialogue == 10:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"did too"
			if alongTheDialogue == 11:
				talker = "Phantom"
				$BlackMarket/talk.text = talker+": "+"did not"
			if alongTheDialogue == 12:
				talker = "Antag"
				$BlackMarket/talk.text = talker+": "+"did too"
			if alongTheDialogue == 13:
				endDialogue()
	
	$BlackMarket/icon.texture = load("res://assets/images/areas/blackMarket/market/anphan/"+talker+"Icon.png")

func endDialogue():
	$Shop/ItemDescription.visible_ratio = 0
	dialougeMode = false
	dialogKey = "none"
	alongTheDialogue = 0
	if melShopState == false:
		if Game.contains_curse("gambling"):
			spawnDialogueOptionsMelanie("bricks")
			setShopBase("bricks")
		else:
			spawnDialogueOptionsMelanie("melanie")
			setShopBase("melanie")
	if melvinShopState == false:
		spawnDialogueOptionsMelanie("melvin")
		setShopBase("melvin")
	if marketShopState == false:
		spawnDialogueOptionsMelanie("market")
		setShopBase("market")

func generateHoes():
	for i in Curses.curses.size():
		var cacapoopyGOD2 = preload("res://technical/curseDisplay.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.curseID = Curses.curses[i]["ID"]
		add_child(caca)
		caca.reparent($ShrilowScreen/cursesDisplay)
	for i in ItemValues.itemInfomation.size():
		if ItemValues.itemInfomation[i]["Type"] != "Title":
			var caca = cacapoopyGOD.instantiate()
			caca.ItemID = i
			caca.type = "melanie"
			add_child(caca)
			caca.reparent($Shop/Melanie/ScrollContainer/GridContainer)
		else:
			var cacapoopyGOD2 = load(ItemValues.itemInfomation[i]["ScenePath"])
			var caca = cacapoopyGOD2.instantiate()
			caca.type = ItemValues.itemInfomation[i]["ImgType"]
			caca.text = ItemValues.itemInfomation[i]["SectionName"]
			add_child(caca)
			caca.reparent($Shop/Melanie/ScrollContainer/GridContainer)
	for i in ItemValues.melvinItems.size():
		var caca = cacapoopyGOD.instantiate()
		caca.ItemID = i
		caca.type = "melvin"
		add_child(caca)
		caca.reparent($Melvin/ScrollContainer/GridContainer)
	for i in ItemValues.marketItems.size():
		var cacapoopyGOD2 = preload("res://technical/MarketItem.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.ItemID = i
		add_child(caca)
		caca.reparent($BlackMarket/ScrollContainer/GridContainer)
	for i in ClothingObjects.clothes.size():
		var cacapoopyGOD2 = preload("res://technical/clothingObject.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.ItemID = i
		add_child(caca)
		caca.reparent($Wardrobe/ScrollContainer/GridContainer)
	for i in Jelly.commonJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.commonJellies[i]["Name"]
		caca.desc = Jelly.commonJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Common"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.uncommonJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.uncommonJellies[i]["Name"]
		caca.desc = Jelly.uncommonJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Uncommon"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.rareJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.rareJellies[i]["Name"]
		caca.desc = Jelly.rareJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Rare"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.awesomeJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.awesomeJellies[i]["Name"]
		caca.desc = Jelly.awesomeJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Awesome"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.queerJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.queerJellies[i]["Name"]
		caca.desc = Jelly.queerJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Queer"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)
	for i in Jelly.blueJellies.size():
		var cacapoopyGOD2 = preload("res://technical/jellies/storageJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jelly = Jelly.blueJellies[i]["Name"]
		caca.desc = Jelly.blueJellies[i]["Desc"]
		caca.jellyNum = i
		caca.rarity = "Blue"
		add_child(caca)
		caca.reparent($Journal/ScrollContainer/GridContainer)

func _ready():
	
	Game.loadData()
	Interstate.loadData()
	
	Journal.updateEntryContents()
	
	if Game.rebirths >= 1:
		if Game.achievement_unlocked("rebirth"):
			Game.unlock_achievement("rebirth")
			$Shrilow.visible = false
			$ShrilowScreen.visible = false
			$Shop/Melanie.visible = false
			$Shop/Bricks.visible = false
			$Shop/ItemName.visible = false
			$Shop/ItemDescription.visible = false
			$Shop/ItemExtra.visible = false
			$Shop/Description.visible = false
			$USD.visible = false
			$USDText.visible = false
			$Cutscene.visible = true
			$Shop/ShopMusic.playing = false
		else:
			$Shrilow.visible = true
			$ShrilowScreen.visible = true
			$Shop/Melanie.visible = true
			$Shop/Bricks.visible = false
			$Shop/ItemName.visible = true
			$Shop/ItemDescription.visible = true
			$Shop/ItemExtra.visible = true
			$Shop/Description.visible = true
			$USD.visible = true
			$USDText.visible = true
			$Cutscene.visible = false
			$Shop/ShopMusic.playing = true
	if Game.rebirths >= 5:
		Game.unlock_achievement("rebirth10")
	
	if ItemValues.money >= 250000:
		lawsInformed = true
	if ItemValues.money >= 500000:
		doctorCalled = true
	
	if Game.contains_curse("gambling"):
		$Shop/ShopMusic.stream = load("res://assets/music/screensaver.ogg")
		revert_bricks_text()
	else:
		$Shop/ShopMusic.stream = load("res://assets/music/skate.ogg")
	$Shop/ShopMusic.play()
	
	if Game.rebirthJellyProtocol.size() > 0:
		print("Jellies "+str(Jelly.storedJellys))
		print("Protocol "+str(Game.rebirthJellyProtocol))
		for i in range(0, Game.rebirthJellyProtocol.size()):
			if i <= Game.rebirthJellyProtocol.size()-1:
				Jelly.storedJellys.append(Game.rebirthJellyProtocol[i])
		Game.rebirthJellyProtocol.resize(0)
		print("Updated Jellies "+str(Jelly.storedJellys))
		print("Updated Protocol "+str(Game.rebirthJellyProtocol))
	
	$Mines.position.y = 648
	generateHoes()
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	if Game.contains_curse("smokebreak") and !Game.contains_curse("gambling"):
		$Shop/Timer.start()
	
	# AWFUL CASE OF SPAGHETTI CODE IM JUST TOO LAZY TO WRITE THIS WELL LMAO
	if err == OK:
		
		if Game.rebirths > 0:
			$Shop/MarektIndicator.visible = true
			$Shop/EnterMarket.disabled = false
		else:
			$Shop/MarektIndicator.visible = false
			$Shop/EnterMarket.disabled = true
		
		for i in ["autoClickerUpgrade", "PlusOneUpgrade", "PlusOneAUTOUpgrade", "shrilowCry", "jellyCry", "mineCry"]:
			if config.get_value("Shop", i) == null:
				config.set_value("Shop", i, 0)
		for i in ["RebirthAutoClickerLevel", "PresistantPlusOne", "PlusOneMC"]:
			if config.get_value("Rebirth", i) == null:
				config.set_value("Rebirth", i, 0)
		
		for i in ["autoclicker", "plusone", "plusoneauto", "shrilowCrystal", "crystal", "mineCrystal", "Rautoclicker", "Rplusone", "Rplusoneauto"]:
			if i == "autoclicker":
				if config.get_value("Shop", "autoClickerUpgrade") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					cacaFUCK.ItemId = 34
					add_child(cacaFUCK)
			elif i == "plusone":
				if config.get_value("Shop", "PlusOneUpgrade") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					cacaFUCK.number = 4
					add_child(cacaFUCK)
			elif i == "plusoneauto":
				if config.get_value("Shop", "PlusOneAUTOUpgrade") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					cacaFUCK.number = 5
					add_child(cacaFUCK)
			if i == "shrilowCrystal":
				if config.get_value("Shop", "shrilowCry") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "crystal":
				if config.get_value("Shop", "jellyCry") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "mineCrystal":
				if config.get_value("Shop", "mineCry") > 0:
					var cacaFUCK = load("res://technical/items/"+i+".tscn").instantiate()
					add_child(cacaFUCK)
			elif i == "Rautoclicker":
				if config.get_value("Rebirth", "RebirthAutoClickerLevel") > 0:
					var cacaFUCK = load("res://technical/rebirthShit/"+i+".tscn").instantiate()
					cacaFUCK.ItemID = 0
					add_child(cacaFUCK)
			elif i == "Rplusone":
				if config.get_value("Rebirth", "PresistantPlusOne") > 0:
					var cacaFUCK = load("res://technical/rebirthShit/"+i+".tscn").instantiate()
					cacaFUCK.number = 1
					add_child(cacaFUCK)
			elif i == "Rplusoneauto":
				if config.get_value("Rebirth", "PlusOneMC") > 0:
					var cacaFUCK = load("res://technical/rebirthShit/"+i+".tscn").instantiate()
					cacaFUCK.number = 2
					add_child(cacaFUCK)
			ItemValues.marketItems[3]["Owned"] = Game.evilMines
	
	
	if DirAccess.dir_exists_absolute("user://saveData/nodeSaves/file"+str(Game.curFile+1)) == true:
		rooms = load("user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/Rooms.tscn").instantiate()
		$Jelly/rooms.queue_free()
		$Jelly.add_child(rooms)
		
		jellies = load("user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/Jellies.tscn").instantiate()
		$Jelly/Control.queue_free()
		$Jelly.add_child(jellies)
		
		mines = load("user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/Mines.tscn").instantiate()
		$Mines/ScrollContainer/Control/MinesLevel.queue_free()
		$Mines/ScrollContainer/Control.add_child(mines)
		
		puppies = load("user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/Puppies.tscn").instantiate()
		$ShrilowScreen/puppies.queue_free()
		$ShrilowScreen.add_child(puppies)
		
		$setNames.start()
	
	if Journal._entry_state("Curses") and Game.rebirths >= 2:
		Journal._unlock_entry("Curses")
	await get_tree().create_timer(6).timeout
	if Journal._entry_state("QuickTime-Event") and Game.rebirths >= 2:
		Journal._unlock_entry("QuickTime-Event")
		#Game.notify("You've unlocked the 'QuickTime-Event' entry.", "notebook")
	
	Game.saveData()

func _process(_delta : float) -> void:
	if Game.contains_curse("gambling"):
		$ShrilowScreen/Shop.texture = load("res://assets/images/ui/bricks.png")
		$Shop/Melanie.position.y = -648.0
		$Shop/Bricks.position.y = 0
		$Shop/Melanie/talkOptions.mouse_filter = 2
		$Shop/Bricks/Gambling/ticket.texture = load(gambleTickets[selTicket]["imagePath"])
		$Shop/Bricks/Gambling/price.text = "$"+str(gambleTickets[selTicket]["Cost"])
	else:
		$ShrilowScreen/Shop.texture = load("res://assets/images/ui/shop.png")
		$Shop/Melanie/talkOptions.mouse_filter = 1
		$Shop/Bricks.position.y = -648.0
		$Shop/Melanie.position.y = 0
	
	if can == true:
		if ItemValues.money >= 500000 and !doctorCalled and Game.rebirths == 1:
			doctorCalled = true
			var cacapoopyGOD2 = load("res://technical/events/minerkid.tscn")
			var caca2 = cacapoopyGOD2.instantiate()
			add_child(caca2)
			caca2.swapTo("doctor")
			Game.warn("Oh? Whats this...")
		if ItemValues.money >= 250000 and !lawsInformed and Game.rebirths == 1:
			Game.inform("someone named 'QuickTime-Event' has made some new laws! absolutely despicable. whos this guy think he is? you can find these laws by looking in The Journal!\n\nhopefully none of these become a problem later...")
			lawsInformed = true
			Journal._unlock_entry("My QuickTime-Laws!")
			#await get_tree().create_timer(10).timeout
			#Game.notify("You've unlocked a Journal Entry!", "notebook")
	
	if Settings.setting_state("saayo") == true:
		$Shop/Melanie/Mel.visible = false
		$Shop/Melanie/Sign.visible = false
		$Melvin/sheldon.visible = true
		$Melvin/melvin.visible = false
		$Jelly/lgo.visible = false
		$Jelly/lgo2.visible = true
		$Jelly/sheldon.visible = true
		$Jelly/melvin.visible = false
		$Shop/Melanie/SaayoBaldi.texture = load("res://assets/images/areas/melanies/saayo.png")
		$Shop/Melanie/SaayoBaldi.visible = true
	elif Settings.setting_state("4baldi") == true:
		$Melvin/sheldon.visible = false
		$Melvin/melvin.visible = true
		$Jelly/lgo.visible = true
		$Jelly/lgo2.visible = false
		$Jelly/sheldon.visible = false
		$Jelly/melvin.visible = true
		$Shop/Melanie/Mel.visible = false
		$Shop/Melanie/Sign.visible = false
		$Shop/Melanie/SaayoBaldi.texture = load("res://assets/images/areas/melanies/baldi.png")
		$Shop/Melanie/SaayoBaldi.visible = true
	else:
		$Melvin/sheldon.visible = false
		$Melvin/melvin.visible = true
		$Jelly/lgo.visible = true
		$Jelly/lgo2.visible = false
		$Jelly/sheldon.visible = false
		$Jelly/melvin.visible = true
		$Shop/Melanie/Mel.visible = true
		$Shop/Melanie/Sign.visible = true
		$Shop/Melanie/SaayoBaldi.visible = false
	
	if ItemValues.money >= 1000000000:
		Game.unlock_achievement("billionare")
	
	var rebPurchases = true
	for i in ItemValues.marketItems.size():
		if ItemValues.marketItems[i].has("Purchased"):
			if ItemValues.marketItems[i]["Purchased"] == false:
				rebPurchases = false
				break
	if rebPurchases == true:
		Game.unlock_achievement("darkwebber")
	
	var shopPurchases = true
	for i in ItemValues.itemInfomation.size():
		if ItemValues.itemInfomation[i].has("Purchased"):
			if ItemValues.itemInfomation[i]["Purchased"] == false:
				shopPurchases = false
				break
	if shopPurchases == true:
		Game.unlock_achievement("women")
	
	if Game.saveFileClicks >= 100000:
		Game.unlock_achievement("carpaltunnel")
	elif Game.saveFileClicks >= 10000:
		Game.unlock_achievement("sorefingers")
		Game.unlock_outfit("Coka")
	
	if Game.gumballsBought >= 100:
		Game.unlock_achievement("90percent")
	if Game.gumballsBought >= 1000:
		Game.unlock_achievement("1000gum")
	if Game.platinumGumballsBought >= 10:
		Game.unlock_achievement("10plat")
	
	if FizzyDrink.greasepuppies >= 500:
		Game.unlock_achievement("500gp")
	
	var clothes = true
	for i in ClothingObjects.clothes.size():
		if ClothingObjects.clothes[i]["Owned"] == false:
			clothes = false
			break
	if clothes == true:
		Game.unlock_achievement("fashionista")
	
	var jellyThing2 = [
		Jelly.commonJellies,
		Jelly.uncommonJellies,
		Jelly.rareJellies,
		Jelly.awesomeJellies,
		Jelly.queerJellies,
		]
	var JELLYcanAchieve = true
	
	for i in jellyThing2.size():
		for e in range(0, jellyThing2[i].size()-1):
			if jellyThing2[i][e]["Discovered"] == false:
				JELLYcanAchieve = false
				break
	
	if JELLYcanAchieve == true:
		Game.unlock_achievement("crazyjellylady")
	
	var minigamesAchieve = true
	
	for e in Events.justMinigames.size():
		if Events.justMinigames[e]["Played?"] == false:
			minigamesAchieve = false
			break
	
	if minigamesAchieve == true:
		Game.unlock_achievement("arcade")
	
	var screeneventsAchieve = true
	
	for e in Events.eventList.size():
		if Events.eventList[e]["Played?"] == false:
			screeneventsAchieve = false
			break
	
	if screeneventsAchieve == true:
		Game.unlock_achievement("ipadbaby")
	
	var config = ConfigFile.new()
	
	var err = config.load(Game.files[Game.curFile])
	
	# AWFUL CASE OF SPAGHETTI CODE IM JUST TOO LAZY TO WRITE THIS WELL LMAO
	if err == OK:
		if ItemValues.money >= 1000000 + (1000000 * Game.rebirths) and rebirthIndicated == false and can == true:
			rebirthIndicated = true
			var cacapoopyGOD3 = preload("res://technical/rebirthNotification.tscn")
			var caca2 = cacapoopyGOD3.instantiate()
			add_child(caca2)
			caca2.reparent($Camera2D)
			$ShrilowScreen/Rebirth.disabled = false
			$ShrilowScreen/Rebirth.visible = true
	
	var config2 = ConfigFile.new()
	
	$Camera2D/kiwami.visible = Settings.setting_state("kiwami")
	
	$"ShrilowScreen/Time Display".visible = Settings.setting_state("fileTimer")
	
	if Input.is_action_just_pressed("ui_cancel"):
		var cacapoopyGOD2 = preload("res://technical/pauseMenu.tscn")
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
		caca.reparent($/root)
		get_tree().paused = true
	
	if dialougeMode == true and Input.is_action_just_pressed("Click"):
		if $Shop/ItemDescription.visible_ratio < 0.9 or $Melvin/ItemDescription.visible_ratio < 0.9 or $BlackMarket/talk.visible_ratio < 0.9:
			$Shop/ItemDescription.visible_ratio = 1
			$Melvin/ItemDescription.visible_ratio = 1
			$BlackMarket/talk.visible_ratio = 1
		else:
			alongTheDialogue += 1
			manageScenes()
	
	if melShopState == false:
		$Shop/type.pitch_scale = 1.0
		if $Shop/ItemDescription.visible_ratio > 1:
			$Shop/ItemDescription.visible_ratio = 1
		if $Shop/ItemDescription.visible_ratio < 1:
			if $Shop/ItemDescription.visible_ratio < 0.9:
				$Shop/type.play()
			var numToUse
			if _delta < 0.05:
				numToUse = 0.05
			else:
				numToUse = _delta
			$Shop/ItemDescription.visible_characters += 50 * numToUse
	else:
		$Shop/ItemDescription.visible_ratio = 1
		$Shop/ItemDescription.visible_characters = -1
	if marketShopState == false:
		if talker == "Phantom":
			$Shop/type.pitch_scale = 1.0
		if talker == "Antag":
			$Shop/type.pitch_scale = 0.5
		if $BlackMarket/talk.visible_ratio > 1.0:
			$BlackMarket/talk.visible_ratio = 1.0
		if $BlackMarket/talk.visible_ratio < 1.0:
			if $BlackMarket/talk.visible_ratio < 0.9:
				$Shop/type.play()
			var numToUse
			if _delta < 0.05:
				numToUse = 0.05
			else:
				numToUse = _delta
			$BlackMarket/talk.visible_characters += 50 * numToUse
	if melvinShopState == false:
		$Shop/type.pitch_scale = 1.0
		if $Melvin/ItemDescription.visible_ratio > 1:
			$Melvin/ItemDescription.visible_ratio = 1
		if $Melvin/ItemDescription.visible_ratio < 1:
			if $Melvin/ItemDescription.visible_ratio < 0.9:
				$Shop/type.play()
			else:
				$Shop/type.volume_db = -1000
			var numToUse
			if _delta < 0.05:
				numToUse = 0.05
			else:
				numToUse = _delta
			$Melvin/ItemDescription.visible_characters += 50 * numToUse
	else:
		$Melvin/ItemDescription.visible_ratio = 1
		$Melvin/ItemDescription.visible_characters = -1
	
	if dialougeMode == true:
		$Shop/BackButtonSHOP.disabled = true
		$Shop/BackSHOP.visible = false
		$Melvin/BackButton.disabled = true
		$Melvin/back.visible = false
		$BlackMarket/LeaveBlack.disabled = true
		$BlackMarket/Back.visible = false
	if dialougeMode == false:
		$Shop/BackButtonSHOP.disabled = false
		$Shop/BackSHOP.visible = true
		$Melvin/BackButton.disabled = false
		$Melvin/back.visible = true
		$BlackMarket/LeaveBlack.disabled = false
		$BlackMarket/Back.visible = true
	
	$Journal/jellyName.text = Jelly.jellyName
	$Journal/jellyDesc.text = Jelly.jellyDesc
	
	if get_tree().paused == false:
		$Camera2D/bg.visible = true
	else:
		$Camera2D/bg.visible = false
	
	if $Camera2D.position.x < (FizzyDrink.scrollLimitRIGHT) and $Camera2D.position.x > (FizzyDrink.scrollLimitLEFT) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(1)
		$Camera2D/rightMove.set_mouse_filter(1)
	elif $Camera2D.position.x == (FizzyDrink.scrollLimitRIGHT) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(1)
		$Camera2D/rightMove.set_mouse_filter(2)
	elif $Camera2D.position.x == (FizzyDrink.scrollLimitLEFT) and area == "Jellies":
		$Camera2D/leftMove.set_mouse_filter(2)
		$Camera2D/rightMove.set_mouse_filter(1)
	else:
		$Camera2D/leftMove.set_mouse_filter(2)
		$Camera2D/rightMove.set_mouse_filter(2)
	
	if cameraMoveDir == "left" and area == "Jellies":
		$Camera2D.position.x -= 270 * _delta/0.5
	if cameraMoveDir == "right" and area == "Jellies":
		$Camera2D.position.x += 270 * _delta/0.5
	
	if area == "Jellies" and $Camera2D.position.x > (FizzyDrink.scrollLimitRIGHT):
		$Camera2D.position.x = (FizzyDrink.scrollLimitRIGHT)
	if area == "Jellies" and $Camera2D.position.x < (FizzyDrink.scrollLimitLEFT):
		$Camera2D.position.x = (FizzyDrink.scrollLimitLEFT)
	
	if FizzyDrink.stopTheCount != 0:
		if myEvilClockExists == false:
			var cacapoopyGOD2 = preload("res://technical/clock.tscn")
			var caca = cacapoopyGOD2.instantiate()
			add_child(caca)
			caca.create("Anti-virus", FizzyDrink.stopTheCount, "antivirus")
		myEvilClockExists = true
		$noEventsTimer.wait_time = FizzyDrink.stopTheCount
		$noEventsTimer.start($noEventsTimer.time_left + FizzyDrink.stopTheCount)
		FizzyDrink.riggedElection = FizzyDrink.stopTheCount
		FizzyDrink.stopTheCount = 0
		$EventTimer.paused = true
	if $noEventsTimer.time_left == 0:
		$EventTimer.paused = false
		myEvilClockExists = false
	
	if FizzyDrink.health >= 100:
		$Shrilow/ProgressBar.visible = false
	else:
		$Shrilow/ProgressBar.visible = true
	$Shrilow/ProgressBar/ProgressBar.value = FizzyDrink.health
	if FizzyDrink.health <= 0:
		var cacapoopyGOD2 = load("res://technical/death.tscn")
		var caca = cacapoopyGOD2.instantiate()
		add_child(caca)
	
	$Gumball/stuff.text = gumballInfo[gumballSelection]["Desc"]
	$Gumball/coin.texture = load(gumballInfo[gumballSelection]["imagePath"])
	
	#elif gumballSelection == 1:
		#$Gumball/coinName.text = "Uncommon Coin"
		#$Gumball/stuff.text = "The Uncommon Coin, allows you to get uncommons alot more easily, but with added price.\n\nCommon Chance: 15%\nUncommon Chance: 80%\nRare Chance: 4%\nAwesome Chance: 1%\nQueer Chance: 0%"
	#elif gumballSelection == 2:
		#$Gumball/coinName.text = "Rare Coin"
		#$Gumball/stuff.text = "The Rare Coin, allows you to get rares alot more easily, but for ALOT more money.\n\nCommon Chance: 1%\nUncommon Chance: 40%\nRare Chance: 80%\nAwesome Chance: 18%\nQueer Chance: 1%"
	#elif gumballSelection == 3:
		#$Gumball/coinName.text = "Awesome Coin"
		#$Gumball/stuff.text = "The Awesome Coin, allows you to get awesomes abit more easily, but for NOTABLY more money.\n\nCommon Chance: 0%\nUncommon Chance: 24%\nRare Chance: 40%\nAwesome Chance: 40%\nQueer Chance: 1%"
	#elif gumballSelection == 4:
		#$Gumball/coinName.text = "Queer Coin"
		#$Gumball/stuff.text = "The Queer Coin, allows you to get queers abit more easily, but for INSANELY more money.\n\nCommon Chance: 0%\nUncommon Chance: 10%\nRare Chance: 35%\nAwesome Chance: 55%\nQueer Chance: 5%"
	
	if $Melvin/ShopMusic.volume_db < 7 and area == "melvin":
		$Melvin/ShopMusic.volume_db += 0.5 + (0.5 * _delta)
	if $Melvin/ShopMusic.volume_db > -100 and area != "melvin":
		$Melvin/ShopMusic.volume_db -= 1 + (1 * _delta)
	
	if $Market/ShopMusic.volume_db < 0 and area == "market":
		$Market/ShopMusic.volume_db += 0.5 + (0.5 * _delta)
	if $Market/ShopMusic.volume_db > -100 and area != "market":
		$Market/ShopMusic.volume_db -= 1 + (1 * _delta)
	
	if $Shop/ShopMusic.volume_db < 0 and area == "melanie":
		$Shop/ShopMusic.volume_db += 1 + (1 * _delta)
	if $Shop/ShopMusic.volume_db > -100 and area != "melanie":
		$Shop/ShopMusic.volume_db -= 1 + (1 * _delta)
	
	if $theVoid/mus.volume_db < -10 and area == "void":
		$theVoid/mus.volume_db += 1 + (1 * _delta)
	if $theVoid/mus.volume_db > -100 and area != "void":
		$theVoid/mus.volume_db -= 1 + (1 * _delta)
	
	$Mines/ScrollContainer/Control.custom_minimum_size.y = (648 * FizzyDrink.minesLength) + 100
	
	#$Mines/MinesBackground.position.y = $Mines/ScrollContainer.scroll_vertical
	
	loadShrilow()
	
	if melShopState == true:
		if melSmoke == false:
			if $Shop/Melanie/Mel.animation != "default":
				$Shop/Melanie/Mel.play("default")
			$Shop/ItemName.text = ItemValues.itemName
			$Shop/ItemDescription.text = ItemValues.itemDesc
			$Shop/ItemExtra.text = ItemValues.itemExtra
			$Shop/Melanie/ScrollContainer.visible = true
		else:
			if $Shop/Melanie/Mel.animation != "smoke":
				$Shop/Melanie/Mel.play("smoke")
			$Shop/ItemName.text = "MELANIE:"
			$Shop/ItemDescription.text = "Sorry, im on my smoke break."
			$Shop/ItemExtra.text = ""
			$Shop/Melanie/ScrollContainer.visible = false
	if melvinShopState == true:
		$Melvin/ItemName.text = ItemValues.itemName
		$Melvin/ItemDescription.text = ItemValues.itemDesc
	if area == "market":
		$BlackMarket/TokensCount.text = str(Game.rebirthTokens)
		$BlackMarket/ItemName.text = ItemValues.itemName
		$BlackMarket/ItemDescription.text = ItemValues.itemDesc
		$BlackMarket/ItemExtra.text = ItemValues.itemExtra
	
	$Wardrobe/ItemName.text = ClothingObjects.itemName
	$Wardrobe/ItemDescription.text = ClothingObjects.itemDesc
	
	if FizzyDrink.clicks == null:
		FizzyDrink.clicks = 0
	$ShrilowScreen/Clicks.text = "CLICKS: "+str(FizzyDrink.clicks)
	if Game.contains_curse("bankaccount"):
		var amountOfMulah = str(round(ItemValues.money)).length()
		var outputText = ""
		for amount in range(amountOfMulah):
			outputText += "X"
		$USDText.text = str(outputText)
		$Gumball/USDText.text = str(outputText)
		$Melvin/USDText.text = str(outputText)
	else:
		$USDText.text = str(Game.commizeNumber(round(ItemValues.money)))
		$Gumball/USDText.text = str(Game.commizeNumber(round(ItemValues.money)))
		$Melvin/USDText.text = str(Game.commizeNumber(round(ItemValues.money)))
	
	$ParallaxBackground.scroll_base_offset.y -= 10 * _delta/0.5
	
	if $Shrilow.scale.x > 1:
		$Shrilow.scale.x -= 0.05
	if $Shrilow.scale.y < 1:
		$Shrilow.scale.y += 0.05
	
	#if Input.is_action_just_pressed("eventText"):
		#$Camera2D.position.y = 324
		#_event()
		#if $Camera2D.position.x != -1221:
			#cameraAnimation("journal", -791, -1221)
		#if $Camera2D.position.x == -791:
			#cameraAnimation("journal", 576, 324)
	
	if Input.is_action_just_pressed("DebugMode"):
		FizzyDrink.clicks += 10000
		Game.saveFileClicks += 10000
	
	if $DEBUGVALUES.visible == true:
		$DEBUGVALUES/ScrollContainer/Control/Label.text = "DEBUG MODE\n================\nEvent Timer: "+str($EventTimer.time_left)+"\nStop Events Timer: "+str($noEventsTimer.time_left)

func loadShrilow():
	if Settings.setting_state("saayo") == false and Settings.setting_state("4baldi") == false:
		textu = "res://assets/images/computershrilows/shrilowBases/"+ClothingObjects.clothes[ClothingObjects.equippedClothing]["Image"]+shrilowState+".png"
		$ParallaxBackground/ParallaxLayer/background.texture = load("res://assets/images/bg/background.png")
		$fade.texture = load("res://assets/images/bg/fade.png")
	elif Settings.setting_state("saayo") == true:
		textu = "res://assets/images/computershrilows/shrilowBases/saayo"+shrilowState+".png"
		$ParallaxBackground/ParallaxLayer/background.texture = load("res://assets/images/bg/background-saayo.png")
		$fade.texture = load("res://assets/images/bg/fade-saayo.png")
	elif Settings.setting_state("4baldi") == true:
		textu = "res://assets/images/computershrilows/shrilowBases/baldi"+shrilowState+".png"
		$ParallaxBackground/ParallaxLayer/background.texture = load("res://assets/images/bg/background-baldi.png")
		$fade.texture = load("res://assets/images/bg/fade-baldi.png")
	
	if ResourceLoader.exists(textu):
		$Shrilow/Shrilow.texture = load(textu)
	else:
		textu = "res://assets/images/computershrilows/shrilowBases/shrilowBase.png"
		$Shrilow/Shrilow.texture = load(textu)

func killIntro():
	$Camera2D/intro.queue_free()

func _on_shrilow_squeak_autoclick() -> void:
	$faceRevert.stop()
	$faceRevert.start()
	$Shrilow.scale.x = 1.2
	$Shrilow.scale.y = 0.85
	$Shrilow/Shrilow/ShrilowFace.visible = false
	if curClicks < 150:
		shrilowState = "-clicked"
	if curClicks >= 150:
		shrilowState = "-dizzy"
	var ammo = FizzyDrink.AUTOclickPower+FizzyDrink.AUTOclickPowerP1+FizzyDrink.AUTOclickPowerP1R+FizzyDrink.AUTOclickPowerAdditions+FizzyDrink.AUTOclickPowerClothingBuffs+FizzyDrink.shrilowPowerAuto
	Interstate.totalmoney += ammo
	ItemValues.money += ammo
	$Shrilow/Squeak2.play()

func _on_shrilow_squeak_pressed() -> void:
	if Input.is_action_just_pressed("Click"):
		if !Game.contains_curse("kindness"):
			$faceRevert.stop()
			$faceRevert.start()
			$faceRevert2.stop()
			$faceRevert2.start()
			$Shrilow.scale.x = 1.2
			$Shrilow.scale.y = 0.85
			$Shrilow/Shrilow/ShrilowFace.visible = false
			if curClicks < 150:
				shrilowState = "-clicked"
			if curClicks >= 150:
				shrilowState = "-dizzy"
			$Shrilow/Squeak.play()
			var ammo = FizzyDrink.clickPower+FizzyDrink.clickPowerP1+FizzyDrink.clickPowerP1R+FizzyDrink.clickPowerAdditions+FizzyDrink.clickPowerClothingBuffs+FizzyDrink.shrilowPower
			Interstate.totalmoney += ammo
			ItemValues.money += ammo
			FizzyDrink.clicks += 1
			Game.saveFileClicks += 1
			curClicks += 1
	if Input.is_action_just_pressed("rightClick"):
		$Shrilow/textBox/box/dialog.text = str(shitShrilowCanSay[rng.randi_range(0, shitShrilowCanSay.size()-1)])
		var tween = create_tween()
		tween.tween_property($Shrilow/textBox, "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		$Shrilow/Timer.start()

func _on_face_revert_timeout() -> void:
	shrilowState = ""
	loadShrilow()
	$Shrilow/Shrilow/ShrilowFace.visible = true

func _on_shop_button_pressed() -> void:
	if can == true:
		can = false
		print("shop")
		area = "melanie"
		if Settings.setting_state("menuTrans"):
			$sectionTransitions.play("toShop")
		else:
			$sectionTransitions.play("toShop", -1, 100)

func _on_back_button_shop_pressed() -> void:
	if can == true:
		can = false
		if melShopState != true:
			melShopToggle()
		area = "notJellies"
		if Settings.setting_state("menuTrans"):
			$sectionTransitions.play("leaveShop")
		else:
			$sectionTransitions.play("leaveShop", -1, 100)

func _on_wardrobe_button_pressed() -> void:
	if can == true:
		can = false
		print("wardrobe")
		if Settings.setting_state("menuTrans"):
			$sectionTransitions.play("toWard")
		else:
			$sectionTransitions.play("toWard", -1, 100)

func _on_back_button_ward_pressed() -> void:
	if can == true:
		can = false
		if Settings.setting_state("menuTrans"):
			$sectionTransitions.play("leaveWard")
		else:
			$sectionTransitions.play("leaveWard", -1, 100)

func _on_back_button_ward2_pressed() -> void:
	if can == true:
		can = false
		if Settings.setting_state("menuTrans"):
			$sectionTransitions.play("leaveMines")
		else:
			$sectionTransitions.play("leaveMines", -1, 100)

func _on_mines_button_pressed() -> void:
	if !Game.contains_curse("blacklung"):
		if can == true:
			can = false
			print("mines")
			if Settings.setting_state("menuTrans"):
				$sectionTransitions.play("toMines")
			else:
				$sectionTransitions.play("toMines", -1, 100)

func _on_trophies_button_pressed() -> void:
	var cacapoopyGOD3 = preload("res://technical/rooms/playerJournal.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	$/root.add_child(caca2)

func _event() -> void:
	$Camera2D/bg.visible = false
	var type = rng.randi_range(0, 1)
	var num
	if type == 0:
		num = rng.randi_range(0, Events.justMinigames.size()-1)
	if type == 1:
		num = rng.randi_range(0, Events.eventList.size()-1)
	_startEvent(num, type)

func _startEvent(numberPicked, type) -> void:
	var cacapoopyGOD2 
	if type == 1:
		cacapoopyGOD2 = load(Events.eventList[numberPicked]["AttachedScene"])
	if type == 0:
		cacapoopyGOD2 = load(Events.justMinigames[numberPicked]["AttachedScene"])
	var caca = cacapoopyGOD2.instantiate()
	add_child(caca)
	var cacapoopyGOD3 = preload("res://technical/events/eventIndicator.tscn")
	var caca2 = cacapoopyGOD3.instantiate()
	add_child(caca2)
	if type == 0:
		caca2.warn(Events.justMinigames[numberPicked]["WarningMessage"])
	if type == 1:
		caca2.warn(Events.eventList[numberPicked]["WarningMessage"])
		Events.eventList[numberPicked]["Played?"] = true
	if type == 0:
		get_tree().paused = true
		Events.justMinigames[numberPicked]["Played?"] = true
		returnPosCamX = $Camera2D.position.x
		returnPosCamY = $Camera2D.position.y
		$Camera2D.position.x = 576
		$Camera2D.position.y = 324
		caca.reparent($/root)
		visible = false

func shrilowColor(color) -> void:
	if color == "base":
		$Shrilow/Shrilow.modulate = Color(1,1,1)
		$Shrilow/Shrilow/ShrilowFace.modulate = Color(1,1,1)
	if color == "yellow":
		$Shrilow/Shrilow.modulate = Color(1,1,0)
		$Shrilow/Shrilow/ShrilowFace.modulate = Color(1,1,0)

func _on_face_revert_2_timeout() -> void:
	curClicks = 0
	shrilowState = ""
	loadShrilow()
	$Shrilow/Shrilow/ShrilowFace.visible = true

func _on_back_button_jelly_pressed() -> void:
	area = "notJellies"
	$Camera2D/storg.disabled = true
	$Camera2D/storgImg.visible = false
	$Camera2D/storg.visible = false
	if can == true:
		can = false
		if Settings.setting_state("menuTrans"):
			$sectionTransitions.play("leaveJellies")
		else:
			$sectionTransitions.play("leaveJellies", -1, 100)

func _on_jellies_button_pressed() -> void:
	if !Game.contains_curse("jelly"):
		if can == true:
			can = false
			if Settings.setting_state("menuTrans"):
				$sectionTransitions.play("toJellies")
			else:
				$sectionTransitions.play("toJellies", -1, 100)

func _on_right_move_mouse_entered() -> void:
	if $Camera2D.position.x < (FizzyDrink.scrollLimitRIGHT):
		cameraMoveDir = "right"

func _on_left_move_mouse_entered() -> void:
	if $Camera2D.position.x > (FizzyDrink.scrollLimitLEFT):
		cameraMoveDir = "left"

func _on_right_move_mouse_exited() -> void:
	cameraMoveDir = "center"

func _on_left_move_mouse_exited() -> void:
	cameraMoveDir = "center"

func _signal_jelly():
	area = "Jellies"
	FizzyDrink.scrollLimitRIGHT = -576
	FizzyDrink.scrollLimitLEFT = -1324
	$Camera2D/storg.disabled = false
	$Camera2D/storg.visible = true
	$Camera2D/storgImg.visible = true

func cameraAnimation(Varea, positionX, positionY, allowMove):
	if Varea == "bell":
		if area == "melvin":
			if melvinShopState != true:
				melvShopToggle()
			area = "notJellies"
		else:
			area = "melvin"
		for i in FizzyDrink.melDialogue.size():
			if FizzyDrink.melDialogue[i]["dialogKey"] == "MELVIN":
				FizzyDrink.melDialogue[i]["unlocked"] = true
	if Varea == "market":
		if area == "market":
			area = "melanie"
		else:
			area = "market"
		for i in FizzyDrink.melDialogue.size():
			if FizzyDrink.melDialogue[i]["dialogKey"] == "MARKET":
				FizzyDrink.melDialogue[i]["unlocked"] = true
	if area == "Jellies":
		area = "notJellies"
	$EventTimer.paused = true
	var end = false
	for i in $Camera2D/bg/icon.sprite_frames.get_animation_names():
		if i == Varea:
			end = true
	if end == true:
		$Camera2D/bg/icon.play(Varea)
	else:
		$Camera2D/bg/icon.play("elevator")
	AnimPosCamX = positionX
	AnimPosCamY = positionY
	if Settings.setting_state("menuTrans"):
		$Camera2D/bg.visible = true
		$Camera2D/AnimationPlayer.play("open")
	else:
		$Camera2D/bg.visible = false
		$Camera2D/AnimationPlayer.play("open", -1, 500)
	allowing = allowMove

func moveCam():
	can = true
	$Camera2D.position.x = AnimPosCamX
	$Camera2D.position.y = AnimPosCamY
	if allowing == false and area == "Jellies":
		area = "notJellies"
	if allowing == true:
		area = "Jellies"
	if area == "notJellies" or area == "melvin" or area == "melanie" or area == "market":
		$Camera2D/storg.disabled = true
		$Camera2D/storgImg.visible = false
		$Camera2D/storg.visible = false
	else:
		$Camera2D/storg.disabled = false
		$Camera2D/storg.visible = true
		$Camera2D/storgImg.visible = true

func coinSelectionChange(toAdd: int) -> void:
	gumballSelection += toAdd
	if gumballSelection < 0:
		gumballSelection = 5
	if gumballSelection > 5:
		gumballSelection = 0

func _buyGumball_pressed() -> void:
	if ItemValues.money >= gumballInfo[gumballSelection]["Cost"]:
		var type = 0.0
		var rarityGotten = "Common"
		type = (rng.randi_range(1, 200))
		print(type)
		var jellyTypeToBe
		
		if gumballInfo[gumballSelection]["Name"] == "Platinum Coin":
			Game.platinumGumballsBought += 1
		Game.gumballsBought += 1
		Interstate.jelliesbought += 1
		
		if (type <= 1 and gumballInfo[gumballSelection]["Name"] == "Queer Coin") or (type <= 1 and gumballInfo[gumballSelection]["Name"] == "Platinum Coin"):
			jellyTypeToBe = "BlueChance"
		elif type <= (gumballInfo[gumballSelection][gumballInfo[gumballSelection]["5THOrder"]]) * 2:
			jellyTypeToBe = gumballInfo[gumballSelection]["5THOrder"]
		elif type <= (gumballInfo[gumballSelection][gumballInfo[gumballSelection]["4THOrder"]]) * 2:
			jellyTypeToBe = gumballInfo[gumballSelection]["4THOrder"]
		elif type <= (gumballInfo[gumballSelection][gumballInfo[gumballSelection]["3RDOrder"]]) * 2:
			jellyTypeToBe = gumballInfo[gumballSelection]["3RDOrder"]
		elif type <= (gumballInfo[gumballSelection][gumballInfo[gumballSelection]["2NDOrder"]]) * 2:
			jellyTypeToBe = gumballInfo[gumballSelection]["2NDOrder"]
		else:
			jellyTypeToBe = gumballInfo[gumballSelection]["1STOrder"]
		
		print(jellyTypeToBe)
		
		var goatedVar
		var caca
		
		if jellyTypeToBe == "CommonChance":
			rarityGotten = "Common"
			goatedVar = rng.randi_range(0, Jelly.commonJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.commonJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.commonJellies[goatedVar]["Seconds"]
			caca.money = Jelly.commonJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.commonJellies[goatedVar]["Discovered"]
			Jelly.commonJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "UncommonChance":
			rarityGotten = "Uncommon"
			goatedVar = rng.randi_range(0, Jelly.uncommonJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.uncommonJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.uncommonJellies[goatedVar]["Seconds"]
			caca.money = Jelly.uncommonJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.uncommonJellies[goatedVar]["Discovered"]
			Jelly.uncommonJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "RareChance":
			rarityGotten = "Rare"
			goatedVar = rng.randi_range(0, Jelly.rareJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.rareJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.rareJellies[goatedVar]["Seconds"]
			caca.money = Jelly.rareJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.rareJellies[goatedVar]["Discovered"]
			Jelly.rareJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "AwesomeChance":
			rarityGotten = "Awesome"
			goatedVar = rng.randi_range(0, Jelly.awesomeJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.awesomeJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.awesomeJellies[goatedVar]["Seconds"]
			caca.money = Jelly.awesomeJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.awesomeJellies[goatedVar]["Discovered"]
			Jelly.awesomeJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "QueerChance":
			rarityGotten = "Queer"
			goatedVar = rng.randi_range(0, Jelly.queerJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.queerJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.queerJellies[goatedVar]["Seconds"]
			caca.money = Jelly.queerJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.queerJellies[goatedVar]["Discovered"]
			Jelly.queerJellies[goatedVar]["Discovered"] = true
		elif jellyTypeToBe == "BlueChance":
			rarityGotten = "Blue"
			goatedVar = rng.randi_range(0, Jelly.blueJellies.size()-1)
			var cacapoopyGOD2 = load("res://technical/items/jelly.tscn")
			caca = cacapoopyGOD2.instantiate()
			caca.jelly = Jelly.blueJellies[goatedVar]["Name"]
			caca.rarity = rarityGotten
			caca.seconds = Jelly.blueJellies[goatedVar]["Seconds"]
			caca.money = Jelly.blueJellies[goatedVar]["MoneyGain"]
			caca.selfDiscoveredVar = Jelly.blueJellies[goatedVar]["Discovered"]
			Jelly.blueJellies[goatedVar]["Discovered"] = true
		
		add_child(caca)
		caca.buy()
		caca.getID(0)
		
		ItemValues.money -= gumballInfo[gumballSelection]["Cost"]
		Interstate.totallost -= gumballInfo[gumballSelection]["Cost"]
		
		#var num
		#if type == 0:
			#num = rng.randi_range(0, Events.justMinigames.size()-1)
		#if type == 1:
			#num = rng.randi_range(0, Events.eventList.size()-1)

func spawnDialogueOptionsMelanie(char : String):
	if char == "melanie":
		for i in FizzyDrink.melDialogue.size():
			if FizzyDrink.melDialogue[i]["unlocked"] == true:
				var cacapoopyGOD2 = load("res://technical/dialogOption.tscn")
				var caca = cacapoopyGOD2.instantiate()
				caca.present = FizzyDrink.melDialogue[i]["present"]
				caca.dialogKey = FizzyDrink.melDialogue[i]["dialogKey"]
				caca.interacted = FizzyDrink.melDialogue[i]["interacted"]
				caca.arrayToUse = "melanie"
				add_child(caca)
				caca.reparent($Shop/Melanie/talkOptions/GridContainer)
				dialogueOptionsMelanie.append(caca)
	if char == "bricks":
		for i in FizzyDrink.bricksDialogue.size():
			if FizzyDrink.bricksDialogue[i]["unlocked"] == true:
				var cacapoopyGOD2 = load("res://technical/dialogOption.tscn")
				var caca = cacapoopyGOD2.instantiate()
				caca.present = FizzyDrink.bricksDialogue[i]["present"]
				caca.dialogKey = FizzyDrink.bricksDialogue[i]["dialogKey"]
				caca.interacted = FizzyDrink.bricksDialogue[i]["interacted"]
				caca.arrayToUse = "bricks"
				add_child(caca)
				caca.reparent($Shop/Bricks/talkOptions/GridContainer)
				dialogueOptionsMelanie.append(caca)
	if char == "melvin":
		for i in FizzyDrink.melvinDialogue.size():
			if FizzyDrink.melvinDialogue[i]["unlocked"] == true:
				var cacapoopyGOD2 = load("res://technical/dialogOption.tscn")
				var caca = cacapoopyGOD2.instantiate()
				caca.present = FizzyDrink.melvinDialogue[i]["present"]
				caca.dialogKey = FizzyDrink.melvinDialogue[i]["dialogKey"]
				caca.interacted = FizzyDrink.melvinDialogue[i]["interacted"]
				caca.arrayToUse = "melvin"
				add_child(caca)
				caca.reparent($Melvin/talkOptions/GridContainer)
				dialogueOptionsMelvin.append(caca)
	if char == "market":
		for i in FizzyDrink.marketDialogue.size():
			if FizzyDrink.marketDialogue[i]["unlocked"] == true:
				var cacapoopyGOD2 = load("res://technical/dialogOption.tscn")
				var caca = cacapoopyGOD2.instantiate()
				caca.present = FizzyDrink.marketDialogue[i]["present"]
				caca.dialogKey = FizzyDrink.marketDialogue[i]["dialogKey"]
				caca.interacted = FizzyDrink.marketDialogue[i]["interacted"]
				caca.arrayToUse = "market"
				add_child(caca)
				caca.reparent($BlackMarket/talkOptions/GridContainer)
				dialogueOptionsMarket.append(caca)

func clearDialogItems():
	for i in dialogueOptionsMelanie.size():
		dialogueOptionsMelanie[i].queue_free()
	dialogueOptionsMelanie.resize(0)
	for i in dialogueOptionsMelvin.size():
		dialogueOptionsMelvin[i].queue_free()
	dialogueOptionsMelvin.resize(0)
	for i in dialogueOptionsMarket.size():
		dialogueOptionsMarket[i].queue_free()
	dialogueOptionsMarket.resize(0)

func setShopBase(char : String):
	if char == "melanie":
		$Shop/Melanie/Mel.play("talkBase")
		var openingMessages = [
			"Oh, yeah sure, i got nothing else to do",
			"Normally i couldnt do this, but its not like im selling anyone anything anyway",
			"Hm? need smth?",
			"Ask away, i guess",
			]
		$Shop/ItemName.text = "MELANIE:"
		$Shop/ItemDescription.text = openingMessages[rng.randi_range(0, openingMessages.size()-1)]
		$Shop/ItemExtra.text = ""
	if char == "bricks":
		$Shop/Bricks/Bricks.play("talkBase")
		var openingMessages = [
			"Cheesed",
			"Stop talking to me you gotta go gamble",
			"Celeste",
			"Computer Shrilow: Ghost Mix",
			]
		$Shop/ItemName.text = "GHOSTYBRICKS:"
		$Shop/ItemDescription.text = openingMessages[rng.randi_range(0, openingMessages.size()-1)]
		$Shop/ItemExtra.text = ""
	if char == "market":
		$BlackMarket/whores.play("talk")
		var openingMessages = [
			"Antag: Dont encourage him.",
			"Phantom: Oh! Oh! Oh! you wanna talk? yes!!!!!",
			"Antag: Ok.",
			"Phantom: Hi!",
			]
		var openingIcons = [
			"Antag",
			"Phantom",
			"Antag",
			"Phantom",
			]
		var num = rng.randi_range(0, openingMessages.size()-1)
		talker = openingIcons[num]
		$BlackMarket/icon.texture = load("res://assets/images/areas/blackMarket/market/anphan/"+openingIcons[num]+"Icon.png")
		$BlackMarket/talk.text = openingMessages[num]
	if char == "melvin":
		$Melvin/melvin.play("talkBase")
		var openingMessages = [
			"o- oh! oh yeah! we can talk! sure...",
			"huh? oh- yeah! okay!",
			"can we just go back to you buying things, and me.. not drawing attention to myself??.. haha?",
			"A- Alright!",
			]
		$Melvin/ItemName.text = "MELVIN:"
		$Melvin/ItemDescription.text = openingMessages[rng.randi_range(0, openingMessages.size()-1)]

func marketShopToggle() -> void:
	if dialogKey == "none":
		$BlackMarket/talk.text = ""
		$BlackMarket/talk.visible_characters = -1
		$BlackMarket/talk.visible_ratio = 1
		marketShopState = !marketShopState
		if marketShopState == false:
			$BlackMarket/talk.visible_ratio = 0
			spawnDialogueOptionsMelanie("market")
			$BlackMarket/ScrollContainer.position.y = 365.0
			$BlackMarket/talkOptions.position.y = -183.0
			setShopBase("market")
			$BlackMarket/ItemDescription.visible = false
			$BlackMarket/ItemName.visible = false
			$BlackMarket/ItemExtra.visible = false
			$BlackMarket/talk.visible = true
			$BlackMarket/icon.visible = true
		if marketShopState == true:
			clearDialogItems()
			$BlackMarket/talkOptions.position.y = 365.0
			$BlackMarket/ScrollContainer.position.y = -183.0
			$BlackMarket/whores.play("base")
			$BlackMarket/ItemDescription.visible = true
			$BlackMarket/ItemName.visible = true
			$BlackMarket/ItemExtra.visible = true
			$BlackMarket/talk.visible = false
			$BlackMarket/icon.visible = false

func melShopToggle() -> void:
	if canGamble == true:
		if dialogKey == "none":
			$Shop/ItemDescription.visible_characters = -1
			$Shop/ItemDescription.visible_ratio = 1
			melShopState = !melShopState
			if melShopState == false:
				$Shop/ItemDescription.visible_ratio = 0
				if Game.contains_curse("gambling"):
					spawnDialogueOptionsMelanie("bricks")
					$Shop/Bricks/talkOptions.position.y = 112
					$Shop/Bricks/Gambling.position.y = 872
					setShopBase("bricks")
				else:
					spawnDialogueOptionsMelanie("melanie")
					$Shop/Melanie/ScrollContainer.position.y = 872
					$Shop/Melanie/talkOptions.position.y = 112
					setShopBase("melanie")
				$USD.visible = false
				$USDText.visible = false
			if melShopState == true:
				clearDialogItems()
				if Game.contains_curse("gambling"):
					$Shop/Bricks/talkOptions.position.y = 872
					$Shop/Bricks/Gambling.position.y = 0
					$Shop/Bricks/Bricks.play("base")
				else:
					$Shop/Melanie/talkOptions.position.y = 872
					$Shop/Melanie/ScrollContainer.position.y = 112
					$Shop/Melanie/Mel.play("default")
				$USD.visible = true
				$USDText.visible = true
				$Shop/ItemDescription.visible_characters = 100000
				$Shop/ItemDescription.visible_ratio = 1

func melvShopToggle() -> void:
	if dialogKey == "none":
		$Melvin/ItemDescription.visible_characters = -1
		$Melvin/ItemDescription.visible_ratio = 1
		melvinShopState = !melvinShopState
		if melvinShopState == false:
			$Melvin/ItemDescription.visible_ratio = 0
			spawnDialogueOptionsMelanie("melvin")
			$Melvin/ScrollContainer.position.y = 872
			setShopBase("melvin")
			$Melvin/talkOptions.position.y
			$Melvin/talkOptions.position.y = 112
		if melvinShopState == true:
			clearDialogItems()
			$Melvin/talkOptions.position.y = 872
			$Melvin/ScrollContainer.position.y = 112
			$Melvin/melvin.play("default")
			$USD.visible = true
			$USDText.visible = true
			$Melvin/ItemDescription.visible_characters = 100000
			$Melvin/ItemDescription.visible_ratio = 1

func dialogueGoAway() -> void:
	var tween = create_tween()
	tween.tween_property($Shrilow/textBox, "scale", Vector2(0,0), 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

func _on_section_transitions_animation_finished(anim_name: StringName) -> void:
	can = true

func urWelcomeSaayo():
	for i in ["Jellies", "Mines", "Puppies", "Rooms"]:
		var scene = PackedScene.new()
		var scene_root
		if i == "Jellies":
			scene_root = $Jelly/Control
		if i == "Rooms":
			scene_root = $Jelly/rooms
		if i == "Mines":
			scene_root = $Mines/ScrollContainer/Control/MinesLevel
		if i == "Puppies":
			scene_root = $ShrilowScreen/puppies
		_set_owner(scene_root, scene_root)
		scene.pack(scene_root)
		var path = "user://saveData/nodeSaves/file"+str(Game.curFile+1)+"/"+i+".tscn"
		ResourceSaver.save(scene, path)
	
func _set_owner(node, root):
	if node != root:
		node.owner = root
	for child in node.get_children():
		_set_owner(child, root)

func _on_set_names_timeout() -> void:
	if mines.name != "MinesLevel":
		mines.name = "MinesLevel"
	if jellies.name != "Control":
		jellies.name = "Control"
	if puppies.name != "puppies":
		puppies.name = "puppies"
	if rooms.name != "rooms":
		rooms.name = "rooms"

func _on_timer_timeout() -> void:
	Game.gameTime += 1.0
	if Settings.setting_state("fileTimer"):
		var time_dict = {"H" : 0, "M" : 0, "S" : 0}
		var time = int(Game.gameTime)
		while time >= 60:
			time -= 60
			time_dict["M"] += 1
		time_dict["S"] = time
		while time_dict["M"] >= 60:
			time_dict["M"] -= 60
			time_dict["H"] += 1
		var finH
		if time_dict["H"] < 10:
			finH = "0"+str(time_dict["H"])
		else:
			finH = time_dict["H"]
		var finM
		if time_dict["M"] < 10:
			finM = "0"+str(time_dict["M"])
		else:
			finM = time_dict["M"]
		var finS
		if time_dict["S"] < 10:
			finS = "0"+str(time_dict["S"])
		else:
			finS = time_dict["S"]
		var final = str(finH) + ":" + str(finM) + ":" + str(finS)
		$"ShrilowScreen/Time Display".text = final

func _spawnStorage() -> void:
	for i in Jelly.storedJellys.size():
		var cacapoopyGOD2 = load("res://technical/jellies/storedJelly.tscn")
		var caca = cacapoopyGOD2.instantiate()
		caca.jellyNum = i
		caca.jelly = Jelly.storedJellys[i]["Name"]
		caca.money = Jelly.storedJellys[i]["MoneyGain"]
		caca.seconds = Jelly.storedJellys[i]["Seconds"]
		caca.rarity = Jelly.storedJellys[i]["Rarity"]
		add_child(caca)
		caca.reparent($storage/ScrollContainer/GridContainer)
		storage.append(caca)

func _reloadStorage():
	for i in storage.size():
		storage[i].queue_free()
	storage.resize(0)
	_spawnStorage()

func _deleteStorag() -> void:
	for i in storage.size():
		storage[i].queue_free()
	storage.resize(0)

func storageCamShit(type : String):
	if can == true:
		if type == "enter":
			storageReturnA = area
			storageReturnX = $Camera2D.position.x
			storageReturnY = $Camera2D.position.y
			cameraAnimation("storage", -791, -3424, false)
			_spawnStorage()
		if type == "leave":
			cameraAnimation(storageReturnA, storageReturnX, storageReturnY, false)
			if Settings.setting_state("menuTrans"):
				var timer2 = Timer.new()
				timer2.wait_time = 3.1
				timer2.one_shot = true
				timer2.autostart = true
				timer2.connect("timeout", changeArea)
				add_child(timer2)
			else:
				var timer2 = Timer.new()
				timer2.wait_time = 0.1
				timer2.one_shot = true
				timer2.autostart = true
				timer2.connect("timeout", changeArea)
				add_child(timer2)
	can = false

func changeArea():
	area = storageReturnA
	$Camera2D/storg.disabled = false
	$Camera2D/storg.visible = true
	$Camera2D/storgImg.visible = true
	_deleteStorag()

func autosave() -> void:
	Game.saveData()
	DirAccess.make_dir_absolute(Game.scenePaths[Game.curFile])
	Game.loadData()
	urWelcomeSaayo()
	$Camera2D/autoPoop.visible = true
	$Camera2D/autoPoop/poopTimer.start()

func killPoop() -> void:
	$Camera2D/autoPoop.visible = false

func marketState(type : String) -> void:
	if type == "enter":
		if $Market/ShopMusic.playing == false:
			$Market/ShopMusic.play()
		if melShopState != true:
			melShopToggle()
		$Camera2D/bg.self_modulate = Color(0.1,0.1,0.1,1)
		cameraAnimation("market", 1924, 1167, false)
		for i in FizzyDrink.melDialogue.size():
			if FizzyDrink.melDialogue[i]["dialogKey"] == "MARKETCONTINUED":
				FizzyDrink.melDialogue[i]["unlocked"] = true
		await get_tree().create_timer(1.5).timeout
		$Shrilow.visible = true
		$ShrilowScreen.visible = true
		$Shop/Melanie.visible = true
		$Shop/Bricks.visible = true
		$Shop/ItemName.visible = true
		$Shop/ItemDescription.visible = true
		$Shop/ItemExtra.visible = true
		$Shop/Description.visible = true
		$USD.visible = true
		$Shop/ShopMusic.playing = true
		$USDText.visible = true
		$Cutscene.visible = false
	if type == "leave":
		$Camera2D/bg.self_modulate = Color(1,1,1,1)
		cameraAnimation("market", 577, 324, false)
	if type == "void":
		if can == true:
			area = "void"
			var tween = create_tween()
			tween.tween_property($Market, "position", Vector2(186,903), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
			tween.parallel().tween_property($Market, "scale", Vector2(7.5,7.5), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
			tween.tween_callback(canpls)
			$theVoid.position.x = 1923
			$Market/voidDoor.texture = load("res://assets/images/areas/blackMarket/voidDoorOpen.png")
			can = false
	if type == "voidLeave":
		if can == true:
			area = "market"
			var tween = create_tween()
			tween.tween_property($Market, "position", Vector2(1922,1167), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
			tween.parallel().tween_property($Market, "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_callback(canpls)
			$theVoid.position.x = 3117
			$Market/voidDoor.texture = load("res://assets/images/areas/blackMarket/voidDoorClosed.png")
			can = false
	if type == "blackmarket":
		if can == true:
			var tween = create_tween()
			tween.tween_property($Market, "scale", Vector2(7.5,7.5), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
			tween.tween_callback(canpls)
			$BlackMarket.position.x = 1924
			$BlackMarket.position.y = 1167
			$Market/marketDoor.texture = load("res://assets/images/areas/blackMarket/marketDoorOpen.png")
			can = false
	if type == "blackmarketLeave":
		if can == true:
			if marketShopState != true:
				marketShopToggle()
				clearDialogItems()
			var tween = create_tween()
			tween.tween_property($Market, "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_callback(canpls)
			$BlackMarket.position.x = 1937
			$BlackMarket.position.y = 1861
			$Market/marketDoor.texture = load("res://assets/images/areas/blackMarket/marketDoorClosed.png")
			can = false
	if type == "PBJ":
		if can == true:
			var tween = create_tween()
			tween.tween_property($Market, "position", Vector2(186,903), 1).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			tween.parallel().tween_property($Market, "scale", Vector2(7.5,7.5), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
			tween.tween_callback(canpls)
			$theVoid.position.x = 1923
			$Market/voidDoor.texture = load("res://assets/images/areas/blackMarket/PBJDoorOpen.png")
			can = false
	if type == "PBJLeave":
		if can == true:
			var tween = create_tween()
			tween.tween_property($Market, "position", Vector2(1922,1167), 1).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
			tween.parallel().tween_property($Market, "scale", Vector2(1,1), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_callback(canpls)
			$theVoid.position.x = 3117
			$Market/voidDoor.texture = load("res://assets/images/areas/blackMarket/PBJDoorClosed.png")
			can = false

func canpls():
	can = true

func _Rebirth() -> void:
	if Curses.curses.size() >= 1:
		Game.unlock_achievement("spicy")
	if Curses.curses.size() >= 5:
		Game.unlock_achievement("extraspicy")
	rebirthProtocol = true
	for i in range(0, Jelly.storedJellys.size()):
		if Jelly.storedJellys[i] != null:
			if Jelly.storedJellys[i]["Rarity"] == "Market":
				var awesomsmee = {
					"Name":Jelly.storedJellys[i]["Name"],
					"MoneyGain":Jelly.storedJellys[i]["MoneyGain"],
					"Seconds":Jelly.storedJellys[i]["Seconds"],
					"Rarity":Jelly.storedJellys[i]["Rarity"],
					"ID":Jelly.storedJellys[i]["ID"]
					}
				Game.rebirthJellyProtocol.append(awesomsmee)
	can = false
	$Camera2D/AudioStreamPlayer.play()
	$Camera2D/ColorRect.visible = true
	$Camera2D/Timer.start()
	FizzyDrink.stopTheCount = 100
	$Shrilow/Squeak.volume_db = -80
	$Shrilow/Squeak2.volume_db = -80

func rebirth() -> void:
	Game.saveData()
	get_tree().change_scene_to_file("res://scenes/rebirthScene.tscn")

func _on_anim_animation_finished(anim_name: StringName) -> void:
	can = true

func box() -> void:
	if Game.boxed == false:
		$Market/AudioStreamPlayer.play()
		Game.boxed = true
		Game.rebirthTokens += 25
		Game.warn("You found Phantom's secret stash of 25 Rebirth Tokens!...")

func smoke_break() -> void:
	melSmoke = !melSmoke

func _on_first_timeout() -> void:
	if $ShrilowScreen/puppies.get_child_count() > 0:
		var ammo = 3 * FizzyDrink.greasepuppies
		ItemValues.money += ammo
		Interstate.totalmoney += ammo
		$ShrilowScreen/AudioListener2D.play()
		for i in range(0, $ShrilowScreen/puppies.get_child_count()):
			$ShrilowScreen/puppies.get_child(i)._update(true)
	$ShrilowScreen/GPSecond.start()

func _on_gp_second_timeout() -> void:
	if $ShrilowScreen/puppies.get_child_count() > 0:
		for i in range(0, $ShrilowScreen/puppies.get_child_count()):
			$ShrilowScreen/puppies.get_child(i)._update(false)

func ticketSwap(swap: int) -> void:
	selTicket += swap
	
	if selTicket > gambleTickets.size()-1:
		selTicket = 0
	if selTicket < 0:
		selTicket = gambleTickets.size()-1

func gambleRoll() -> void:
	if canGamble == true and ItemValues.money >= gambleTickets[selTicket]["Cost"]:
		ItemValues.money -= gambleTickets[selTicket]["Cost"]
		Interstate.totallost -= gambleTickets[selTicket]["Cost"]
		canGamble = false
		var usedArray = "items"
		var possibles = gambleTickets[selTicket]["possibilities"]
		var itemPicked = possibles[rng.randi_range(0, possibles.size()-1)]
		var itemId = ItemValues._find_item(itemPicked)
		if itemId == 0:
			usedArray = "gamblecore"
			itemId = ItemValues._find_item_in_array(itemPicked, ItemValues.gambleCore)
		var cacaFUCK
		var img
		if usedArray == "items":
			cacaFUCK = load(ItemValues.itemInfomation[itemId]["ScenePath"])
			if ItemValues.itemInfomation[itemId]["Upgradeable?"]:
				if ItemValues.itemInfomation[itemId]["CurUpgrade"] > 0:
					ItemValues.itemInfomation[itemId]["CurUpgrade"] += 1
				else:
					ItemValues.itemInfomation[itemId]["CurUpgrade"] += 1
					var caca = cacaFUCK.instantiate()
					caca.getID(itemId)
					add_child(caca)
			elif itemPicked == "Greasepuppy":
				ItemValues.itemInfomation[itemId]["CurUpgrade"] += 1
				var caca = cacaFUCK.instantiate()
				add_child(caca)
				caca.buy()
				caca.getPuppy(FizzyDrink.greasepuppies)
				FizzyDrink.greasepuppies += 1
			elif ItemValues.itemInfomation[itemId]["Owned"] == true:
				print("lol u already own that!!! tough luck!!!")
			else:
				ItemValues.itemInfomation[itemId]["CurUpgrade"] += 1
				var caca = cacaFUCK.instantiate()
				caca.getID(itemId)
				add_child(caca)
			print(ItemValues.itemInfomation[itemId])
		if usedArray == "gamblecore":
			cacaFUCK = load(ItemValues.gambleCore[itemId]["ScenePath"])
			ItemValues.gambleCore[itemId]["CurUpgrade"] += 1
			var caca = cacaFUCK.instantiate()
			caca.getID(itemId)
			add_child(caca)
			print(ItemValues.gambleCore[itemId])
		if usedArray == "items":
			img = ItemValues.itemInfomation[itemId]["Image"]
			ItemNameDisplay = ItemValues.itemInfomation[itemId]["Name"]
			ItemDescDisplay = ItemValues.itemInfomation[itemId]["Desc"]
		if usedArray == "gamblecore":
			img = ItemValues.gambleCore[itemId]["Image"]
			ItemNameDisplay = ItemValues.gambleCore[itemId]["Name"]
			ItemDescDisplay = ItemValues.gambleCore[itemId]["Desc"]
		if img.containsn(".png"):
			$Shop/Bricks/Gambling/item.texture = load(img)
		else:
			$Shop/Bricks/Gambling/item.texture = load(img+"0.png")
		ItemValues.itemName = ItemNameDisplay
		ItemValues.itemDesc = ItemDescDisplay
		await get_tree().create_timer(5).timeout
		$Shop/Bricks/Gambling/item.texture = load("res://assets/images/areas/melanies/itemBox.png")
		canGamble = true
		ItemValues.itemName = "Ticket"
		revert_bricks_text()

func _on_ticket_mouse_entered() -> void:
	if ItemValues.itemName.containsn("Ticket") or ItemValues.itemName.containsn("Casino"):
		ItemValues.itemName = gambleTickets[selTicket]["Name"]
		ItemValues.itemDesc = gambleTickets[selTicket]["Desc"]

func revert_bricks_text() -> void:
	if ItemValues.itemName.containsn("Ticket"):
		ItemValues.itemName = "Welcome to the Casino!"
		ItemValues.itemDesc = "Need help? Click on the GhostyBricks!"
