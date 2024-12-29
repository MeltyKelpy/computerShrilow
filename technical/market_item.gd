extends TextureRect

var ItemID : int
var MaxedOut = false
var ItemSpecificString = ""
var type = "market"
var lastWorkingNumber = 0

var hearMeOut = [{
	"market":ItemValues.marketItems,
	}]

func _process(_delta: float) -> void:
	if hearMeOut[0][type][ItemID]["Upgradeable?"] == true:
		if ResourceLoader.exists(hearMeOut[0][type][ItemID]["Image"]+str(hearMeOut[0][type][ItemID]["CurUpgrade"])+".png"):
			$ItemIcon.texture = load(hearMeOut[0][type][ItemID]["Image"]+str(hearMeOut[0][type][ItemID]["CurUpgrade"])+".png")
			lastWorkingNumber = hearMeOut[0][type][ItemID]["CurUpgrade"]
		else:
			$ItemIcon.texture = load(hearMeOut[0][type][ItemID]["Image"]+str(lastWorkingNumber)+".png")

		if hearMeOut[0][type][ItemID]["CurUpgrade"] != hearMeOut[0][type][ItemID]["MaxUpgrade"]:
			$INFO.text = "Next Level: "+str(hearMeOut[0][type][ItemID]["CurUpgrade"]+1)
		else:
			$Cost.text = "Level: "+str(hearMeOut[0][type][ItemID]["CurUpgrade"])
			$INFO.text = "MAXED OUT"
			MaxedOut = true
	else:
		$ItemIcon.texture = load(hearMeOut[0][type][ItemID]["Image"])
		$INFO.text = ""
		if hearMeOut[0][type][ItemID]["CurUpgrade"] == hearMeOut[0][type][ItemID]["MaxUpgrade"]:
			$Cost.text = "SOLD OUT"
			MaxedOut = true
	
	if (hearMeOut[0][type][ItemID]["Type"] == "Generic" and hearMeOut[0][type][ItemID]["CurUpgrade"] != 0 and MaxedOut == false) or hearMeOut[0][type][ItemID]["Type"] == "Consumable":
		$Cost.text = str(hearMeOut[0][type][ItemID]["Cost"]*(hearMeOut[0][type][ItemID]["CurUpgrade"]+1))+"#"
	elif (hearMeOut[0][type][ItemID]["Type"] == "Generic" and hearMeOut[0][type][ItemID]["CurUpgrade"] == 0 and MaxedOut == false) or hearMeOut[0][type][ItemID]["Type"] == "Consumable":
		$Cost.text = str(hearMeOut[0][type][ItemID]["Cost"])+"#"
	
	
	if MaxedOut == true:
		modulate = Color(1,1,0)

func _on_button_mouse_entered() -> void:
	ItemValues.itemName = hearMeOut[0][type][ItemID]["Name"]
	ItemValues.itemDesc = hearMeOut[0][type][ItemID]["Desc"]
	ItemSpecificString = ""
	if ItemValues.itemName == "MARKETCLICKER":
		var second = str(hearMeOut[0][type][ItemID]["BaseValue"]+(hearMeOut[0][type][ItemID]["CurUpgrade"]*hearMeOut[0][type][ItemID]["UpgradeIncrease"]))
		if second != "1":
			ItemSpecificString = "Clicks Shrilow every "+second+" Seconds"
		else:
			ItemSpecificString = "Clicks Shrilow every "+second+" Second"
	if ItemValues.itemName == "Persistent Plus One":
		var clicks = str((hearMeOut[0][type][ItemID]["BaseValue"]+(hearMeOut[0][type][ItemID]["CurUpgrade"]*hearMeOut[0][type][ItemID]["UpgradeIncrease"]))+1)
		ItemSpecificString = "Base clicks value increased by "+clicks
	if ItemValues.itemName == "Plus One MC":
		var clicks = str(hearMeOut[0][type][ItemID]["BaseValue"]+(hearMeOut[0][type][ItemID]["CurUpgrade"]*hearMeOut[0][type][ItemID]["UpgradeIncrease"]))
		ItemSpecificString = "Autoclick clicks value increased by "+clicks
	ItemValues.itemExtra = ItemSpecificString

func _on_button_mouse_exited() -> void:
	ItemValues.itemName = "Item Name will show up Here"
	ItemValues.itemDesc = "Right here, an Item's description will show up."
	ItemValues.itemExtra = ""

func _on_button_pressed() -> void:
	if hearMeOut[0][type][ItemID]["Type"] == "Generic" or (hearMeOut[0][type][ItemID]["Type"] == "Consumable" and hearMeOut[0][type][ItemID]["Owned"] == false):
		if hearMeOut[0][type][ItemID]["CurUpgrade"] != 0:
			if (Game.rebirthTokens >= hearMeOut[0][type][ItemID]["Cost"]*(hearMeOut[0][type][ItemID]["CurUpgrade"]+1)) and MaxedOut == false:
				calculate()
		elif hearMeOut[0][type][ItemID]["CurUpgrade"] == 0:
			if (Game.rebirthTokens >= hearMeOut[0][type][ItemID]["Cost"]) and MaxedOut == false:
				calculate()

func calculate():
	var cacapoopyGOD
	var caca
	hearMeOut[0][type][ItemID]["Owned"] = true
	if hearMeOut[0][type][ItemID]["ScenePath"] != null:
		if hearMeOut[0][type][ItemID]["Upgradeable?"] == true:
			if hearMeOut[0][type][ItemID]["CurUpgrade"] == 0:
				cacapoopyGOD = load(hearMeOut[0][type][ItemID]["ScenePath"])
				caca = cacapoopyGOD.instantiate()
				add_child(caca)
				caca.getID(ItemID)
		else:
			cacapoopyGOD = load(hearMeOut[0][type][ItemID]["ScenePath"])
			caca = cacapoopyGOD.instantiate()
			add_child(caca)
			caca.getID(ItemID)
	if hearMeOut[0][type][ItemID]["CurUpgrade"] != 0:
		Game.rebirthTokens -= hearMeOut[0][type][ItemID]["Cost"]*(hearMeOut[0][type][ItemID]["CurUpgrade"]+1)
	if hearMeOut[0][type][ItemID]["Type"] == "Generic":
		Game.rebirthTokens -= hearMeOut[0][type][ItemID]["Cost"]*(hearMeOut[0][type][ItemID]["CurUpgrade"]+1)
		hearMeOut[0][type][ItemID]["CurUpgrade"] += 1
	ItemValues.itemExtra = ItemSpecificString
