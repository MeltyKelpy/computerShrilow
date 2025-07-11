extends Node2D

var can = false

var page = 0

func leave():
	can = false

func buttons(which: String) -> void:
	if which == "R":
		print(page)
		can = false
		if (1+(3*(page+1))) >= ItemValues.donationItems.size()-1:
			print("uhmm no?")
		else:
			page += 1
		print("pageNext")
	if which == "L":
		print(page)
		can = false
		if page == 0:
			print("uhmm no?")
		else:
			page -= 1
		print("pageLast")
