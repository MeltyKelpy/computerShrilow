extends TextureRect

var ItemID : int
var MaxedOut = false
var ItemSpecificString = ""
var lastWorkingNumber = 0

func _process(_delta: float) -> void:
	
	if ItemValues.itemInfomation[ItemID]["Upgradeable?"] == true:
		if ResourceLoader.exists(ItemValues.itemInfomation[ItemID]["Image"]+str(ItemValues.itemInfomation[ItemID]["CurUpgrade"])+".png"):
			$ItemIcon.texture = load(ItemValues.itemInfomation[ItemID]["Image"]+str(ItemValues.itemInfomation[ItemID]["CurUpgrade"])+".png")
			lastWorkingNumber = ItemValues.itemInfomation[ItemID]["CurUpgrade"]
		else:
			$ItemIcon.texture = load(ItemValues.itemInfomation[ItemID]["Image"]+str(lastWorkingNumber)+".png")

		if ItemValues.itemInfomation[ItemID]["CurUpgrade"] != ItemValues.itemInfomation[ItemID]["MaxUpgrade"]:
			$INFO.text = "Next Level: "+str(ItemValues.itemInfomation[ItemID]["CurUpgrade"]+1)
		else:
			$Cost.text = "Level: "+str(ItemValues.itemInfomation[ItemID]["CurUpgrade"])
			$INFO.text = "MAXED OUT"
			MaxedOut = true
	else:
		$ItemIcon.texture = load(ItemValues.itemInfomation[ItemID]["Image"])
		$INFO.text = ""
		if ItemValues.itemInfomation[ItemID]["CurUpgrade"] == ItemValues.itemInfomation[ItemID]["MaxUpgrade"]:
			$Cost.text = "SOLD OUT"
			MaxedOut = true
	
	if (ItemValues.itemInfomation[ItemID]["Type"] == "Generic" and ItemValues.itemInfomation[ItemID]["CurUpgrade"] != 0 and MaxedOut == false) or ItemValues.itemInfomation[ItemID]["Type"] == "Consumable":
		$Cost.text = str(ItemValues.itemInfomation[ItemID]["Cost"]*(ItemValues.itemInfomation[ItemID]["CurUpgrade"]+1))+"$"
		if ItemValues.itemInfomation[ItemID]["Name"] == "Jelly!":
			var multi = FizzyDrink.jellys - 4
			if multi < 0:
				multi = 0
			$Cost.text = str(ItemValues.itemInfomation[ItemID]["Cost"] + ((ItemValues.itemInfomation[ItemID]["Cost"] * 2) * multi))+"$"
	elif (ItemValues.itemInfomation[ItemID]["Type"] == "Generic" and ItemValues.itemInfomation[ItemID]["CurUpgrade"] == 0 and MaxedOut == false) or ItemValues.itemInfomation[ItemID]["Type"] == "Consumable":
		$Cost.text = str(ItemValues.itemInfomation[ItemID]["Cost"])+"$"

	if Input.is_action_just_pressed("increaseMoney"):
		ItemValues.money += 1000
	
	
	if MaxedOut == true:
		modulate = Color(1,1,0)

func _on_button_mouse_entered() -> void:
	ItemValues.itemName = ItemValues.itemInfomation[ItemID]["Name"]
	ItemValues.itemDesc = ItemValues.itemInfomation[ItemID]["Desc"]
	ItemSpecificString = ""
	if ItemValues.itemName == "Autoclick":
		var second = str(ItemValues.itemInfomation[ItemID]["BaseValue"]+(ItemValues.itemInfomation[ItemID]["CurUpgrade"]*ItemValues.itemInfomation[ItemID]["UpgradeIncrease"]))
		if second != "1":
			ItemSpecificString = "Clicks Shrilow every "+second+" Seconds"
		else:
			ItemSpecificString = "Clicks Shrilow every "+second+" Second"
	if ItemValues.itemName == "Plus One":
		var clicks = str(ItemValues.itemInfomation[ItemID]["BaseValue"]+(ItemValues.itemInfomation[ItemID]["CurUpgrade"]*ItemValues.itemInfomation[ItemID]["UpgradeIncrease"]))
		ItemSpecificString = "Base clicks value increased by "+clicks
	if ItemValues.itemName == "Plus One Auto":
		var clicks = str(ItemValues.itemInfomation[ItemID]["BaseValue"]+(ItemValues.itemInfomation[ItemID]["CurUpgrade"]*ItemValues.itemInfomation[ItemID]["UpgradeIncrease"]))
		ItemSpecificString = "Autoclick clicks value increased by "+clicks
	if ItemValues.itemName == "Jelly!":
		ItemSpecificString = "You have " + str(FizzyDrink.jellys+1) + " Jellys"
	ItemValues.itemExtra = ItemSpecificString

func _on_button_mouse_exited() -> void:
	ItemValues.itemName = "Item Name will show up Here"
	ItemValues.itemDesc = "Right here, an Item's description will show up."
	ItemValues.itemExtra = ""

func _on_button_pressed() -> void:
	if ItemValues.itemInfomation[ItemID]["Type"] == "Generic" or (ItemValues.itemInfomation[ItemID]["Type"] == "Consumable" and ItemValues.itemInfomation[ItemID]["Owned"] == false):
		if ItemValues.itemInfomation[ItemID]["Name"] == "Jelly!":
			var multi = FizzyDrink.jellys - 4
			if multi < 0:
				multi = 0
			if (ItemValues.money >= ItemValues.itemInfomation[ItemID]["Cost"] + (ItemValues.itemInfomation[ItemID]["Cost"] * 2) * multi):
				calculate()
		elif ItemValues.itemInfomation[ItemID]["CurUpgrade"] != 0:
			if (ItemValues.money >= ItemValues.itemInfomation[ItemID]["Cost"]*(ItemValues.itemInfomation[ItemID]["CurUpgrade"]+1)) and MaxedOut == false:
				calculate()
		elif ItemValues.itemInfomation[ItemID]["CurUpgrade"] == 0:
			if (ItemValues.money >= ItemValues.itemInfomation[ItemID]["Cost"]) and MaxedOut == false:
				calculate()

func calculate():
	var cacapoopyGOD
	var caca
	ItemValues.itemInfomation[ItemID]["Owned"] = true
	if ItemValues.itemInfomation[ItemID]["ScenePath"] != null:
		if ItemValues.itemInfomation[ItemID]["Upgradeable?"] == true:
			if ItemValues.itemInfomation[ItemID]["CurUpgrade"] == 0:
				cacapoopyGOD = load(ItemValues.itemInfomation[ItemID]["ScenePath"])
				caca = cacapoopyGOD.instantiate()
				add_child(caca)
				caca.getID(ItemID)
		else:
			cacapoopyGOD = load(ItemValues.itemInfomation[ItemID]["ScenePath"])
			caca = cacapoopyGOD.instantiate()
			add_child(caca)
			caca.getID(ItemID)
	if ItemValues.itemInfomation[ItemID]["Name"] == "Jelly!":
		FizzyDrink.jellys += 1
		caca.getJelly(FizzyDrink.jellys)
	if ItemValues.itemInfomation[ItemID]["CurUpgrade"] != 0:
		ItemValues.money -= ItemValues.itemInfomation[ItemID]["Cost"]*(ItemValues.itemInfomation[ItemID]["CurUpgrade"]+1)
	if ItemValues.itemInfomation[ItemID]["CurUpgrade"] == 0:
		if ItemValues.itemInfomation[ItemID]["Name"] == "Jelly!":
			var multi = FizzyDrink.jellys - 4
			if multi < 0:
				multi = 0
			ItemValues.money -= ItemValues.itemInfomation[ItemID]["Cost"] + (ItemValues.itemInfomation[ItemID]["Cost"] * 2) * multi
		else:
			ItemValues.money -= ItemValues.itemInfomation[ItemID]["Cost"]
	if ItemValues.itemInfomation[ItemID]["Type"] == "Generic":
		ItemValues.itemInfomation[ItemID]["CurUpgrade"] += 1
	ItemValues.itemExtra = ItemSpecificString
