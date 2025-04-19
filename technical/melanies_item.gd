extends TextureRect

var ItemID : int
var MaxedOut = false
var ItemSpecificString = ""
var type = "melanie"
var lastWorkingNumber = 0

var hearMeOut = {
	"melanie":ItemValues.itemInfomation,
	"tutorial":ItemValues.shopTUTORIAL,
	"melvin":ItemValues.melvinItems,
	}

func _process(_delta: float) -> void:
	if hearMeOut[type][ItemID]["Upgradeable?"] == true:
		if ResourceLoader.exists(hearMeOut[type][ItemID]["Image"]+str(hearMeOut[type][ItemID]["CurUpgrade"])+".png"):
			$ItemIcon.texture = load(hearMeOut[type][ItemID]["Image"]+str(hearMeOut[type][ItemID]["CurUpgrade"])+".png")
			lastWorkingNumber = hearMeOut[type][ItemID]["CurUpgrade"]
		else:
			$ItemIcon.texture = load(hearMeOut[type][ItemID]["Image"]+str(lastWorkingNumber)+".png")

		if hearMeOut[type][ItemID]["CurUpgrade"] != hearMeOut[type][ItemID]["MaxUpgrade"]:
			if hearMeOut[type][ItemID]["CurUpgrade"] == null:
				hearMeOut[type][ItemID]["CurUpgrade"] = 0
			$INFO.text = "Next Level: "+str(hearMeOut[type][ItemID]["CurUpgrade"]+1)
		else:
			$Cost.text = "Level: "+str(hearMeOut[type][ItemID]["CurUpgrade"])
			$INFO.text = "MAXED OUT"
			MaxedOut = true
	else:
		$ItemIcon.texture = load(hearMeOut[type][ItemID]["Image"])
		$INFO.text = ""
		if hearMeOut[type][ItemID]["CurUpgrade"] == hearMeOut[type][ItemID]["MaxUpgrade"]:
			$Cost.text = "SOLD OUT"
			MaxedOut = true
	
	if (hearMeOut[type][ItemID]["Type"] == "Generic" and hearMeOut[type][ItemID]["CurUpgrade"] != 0 and MaxedOut == false) or hearMeOut[type][ItemID]["Type"] == "Consumable":
		$Cost.text = str(Game.commizeNumber(hearMeOut[type][ItemID]["Cost"]*(hearMeOut[type][ItemID]["CurUpgrade"]+1)))+"$"
		if hearMeOut[type][ItemID]["Name"] == "Greasepuppy":
			var multi = FizzyDrink.greasepuppies - 4
			if multi < 0:
				multi = 0
			$Cost.text = str(Game.commizeNumber(hearMeOut[type][ItemID]["Cost"] + ((hearMeOut[type][ItemID]["Cost"] * 0.1) * multi)))+"$"
	elif (hearMeOut[type][ItemID]["Type"] == "Generic" and hearMeOut[type][ItemID]["CurUpgrade"] == 0 and MaxedOut == false) or hearMeOut[type][ItemID]["Type"] == "Consumable":
		$Cost.text = str(Game.commizeNumber(hearMeOut[type][ItemID]["Cost"]))+"$"
	
	
	if MaxedOut == true:
		modulate = Color(1,1,0)

func _on_button_mouse_entered() -> void:
	ItemValues.itemName = hearMeOut[type][ItemID]["Name"]
	ItemValues.itemDesc = hearMeOut[type][ItemID]["Desc"]
	ItemSpecificString = ""
	if ItemValues.itemName == "Autoclick":
		var second = str(hearMeOut[type][ItemID]["BaseValue"]+(hearMeOut[type][ItemID]["CurUpgrade"]*hearMeOut[type][ItemID]["UpgradeIncrease"]))
		if second != "1":
			ItemSpecificString = "Clicks Shrilow every "+second+" Seconds"
		else:
			ItemSpecificString = "Clicks Shrilow every "+second+" Second"
	if ItemValues.itemName == "Plus One":
		var clicks = str((hearMeOut[type][ItemID]["BaseValue"]+(hearMeOut[type][ItemID]["CurUpgrade"]*hearMeOut[type][ItemID]["UpgradeIncrease"]))+1)
		ItemSpecificString = "Base clicks value increased by "+clicks
	if ItemValues.itemName == "Plus One Auto":
		var clicks = str(hearMeOut[type][ItemID]["BaseValue"]+(hearMeOut[type][ItemID]["CurUpgrade"]*hearMeOut[type][ItemID]["UpgradeIncrease"]))
		ItemSpecificString = "Autoclick clicks value increased by "+clicks
	if ItemValues.itemName == "Greasepuppy":
		ItemSpecificString = "You have " + str(FizzyDrink.greasepuppies) + " Greasepuppies"
	ItemValues.itemExtra = ItemSpecificString

func _on_button_mouse_exited() -> void:
	ItemValues.itemName = "Item Name will show up Here"
	ItemValues.itemDesc = "Right here, an Item's description will show up."
	ItemValues.itemExtra = ""

func _on_button_pressed() -> void:
	if hearMeOut[type][ItemID]["Type"] == "Generic" or (hearMeOut[type][ItemID]["Type"] == "Consumable" and hearMeOut[type][ItemID]["Owned"] == false):
		if hearMeOut[type][ItemID]["Name"] == "Greasepuppy":
			var multi = FizzyDrink.greasepuppies - 4
			if multi < 0:
				multi = 0
			if (ItemValues.money >= (hearMeOut[type][ItemID]["Cost"] + (hearMeOut[type][ItemID]["Cost"] * 0.1) * multi)):
				calculate()
		elif hearMeOut[type][ItemID]["CurUpgrade"] != 0:
			if (ItemValues.money >= hearMeOut[type][ItemID]["Cost"]*(hearMeOut[type][ItemID]["CurUpgrade"]+1)) and MaxedOut == false:
				calculate()
		elif hearMeOut[type][ItemID]["CurUpgrade"] == 0:
			if (ItemValues.money >= hearMeOut[type][ItemID]["Cost"]) and MaxedOut == false:
				calculate()

func calculate():
	hearMeOut[type][ItemID]["Purchased"] = true
	var cacapoopyGOD
	var caca
	hearMeOut[type][ItemID]["Owned"] = true
	if hearMeOut[type][ItemID]["ScenePath"] != null:
		if hearMeOut[type][ItemID]["Upgradeable?"] == true:
			if hearMeOut[type][ItemID]["CurUpgrade"] == 0:
				cacapoopyGOD = load(hearMeOut[type][ItemID]["ScenePath"])
				caca = cacapoopyGOD.instantiate()
				caca.getID(ItemID)
				add_child(caca)
		else:
			cacapoopyGOD = load(hearMeOut[type][ItemID]["ScenePath"])
			caca = cacapoopyGOD.instantiate()
			add_child(caca)
			caca.getID(ItemID)
	if hearMeOut[type][ItemID]["Name"] == "Greasepuppy":
		caca.buy()
		caca.getPuppy(FizzyDrink.greasepuppies)
	if hearMeOut[type][ItemID]["Name"] == "Plus One" or hearMeOut[type][ItemID]["Name"] == "Plus One Auto":
		Interstate.plusones += 1
	if hearMeOut[type][ItemID]["CurUpgrade"] != 0:
		var ammo = hearMeOut[type][ItemID]["Cost"]*(hearMeOut[type][ItemID]["CurUpgrade"]+1)
		ItemValues.money -= ammo
		Interstate.totallost -= ammo
	if hearMeOut[type][ItemID]["CurUpgrade"] == 0:
		if hearMeOut[type][ItemID]["Name"] == "Greasepuppy":
			var multi = FizzyDrink.greasepuppies - 4
			if multi < 0:
				multi = 0
			var ammo = hearMeOut[type][ItemID]["Cost"] + (hearMeOut[type][ItemID]["Cost"] * 0.1) * multi
			ItemValues.money -= ammo
			Interstate.totallost -= ammo
			FizzyDrink.greasepuppies += 1
		else:
			ItemValues.money -= hearMeOut[type][ItemID]["Cost"]
			Interstate.totallost -= hearMeOut[type][ItemID]["Cost"]
	if hearMeOut[type][ItemID]["Type"] == "Generic":
		hearMeOut[type][ItemID]["CurUpgrade"] += 1
	ItemValues.itemExtra = ItemSpecificString
