extends TextureRect

var ItemID : int
var MaxedOut = false
var ItemSpecificString = ""

func _process(delta: float) -> void:
	
	if ItemValues.itemInfomation[ItemID]["Upgradeable?"] == true:
		$ItemIcon.texture = load(ItemValues.itemInfomation[ItemID]["Image"]+str(ItemValues.itemInfomation[ItemID]["CurUpgrade"])+".png")

		if ItemValues.itemInfomation[ItemID]["CurUpgrade"] != ItemValues.itemInfomation[ItemID]["MaxUpgrade"]:
			$INFO.text = "Next Level: "+str(ItemValues.itemInfomation[ItemID]["CurUpgrade"]+1)
		else:
			$Cost.text = "Level: "+str(ItemValues.itemInfomation[ItemID]["CurUpgrade"]+1)
			$INFO.text = "MAXED OUT"
			MaxedOut = true
	else:
		$ItemIcon.texture = load(ItemValues.itemInfomation[ItemID]["Image"])
		$INFO.text = ""
		if ItemValues.itemInfomation[ItemID]["CurUpgrade"] == ItemValues.itemInfomation[ItemID]["MaxUpgrade"]:
			$Cost.text = "SOLD OUT"
			MaxedOut = true
	
	if ItemValues.itemInfomation[ItemID]["CurUpgrade"] != 0 and MaxedOut == false:
		$Cost.text = str(ItemValues.itemInfomation[ItemID]["Cost"]*(ItemValues.itemInfomation[ItemID]["CurUpgrade"]+1))+"$"
	elif ItemValues.itemInfomation[ItemID]["CurUpgrade"] == 0 and MaxedOut == false:
		$Cost.text = str(ItemValues.itemInfomation[ItemID]["Cost"])+"$"

	if ItemID == 0:
		var second = str(ItemValues.itemInfomation[0]["BaseValue"]+(ItemValues.itemInfomation[0]["CurUpgrade"]*ItemValues.itemInfomation[0]["UpgradeIncrease"]))
		if second != "1":
			ItemSpecificString = "Clicks Shrilow every "+second+" Seconds"
		else:
			ItemSpecificString = "Clicks Shrilow every "+second+" Second"
	
	if MaxedOut == true:
		modulate = Color(1,1,0)

func _on_button_mouse_entered() -> void:
	ItemValues.itemName = ItemValues.itemInfomation[ItemID]["Name"]
	ItemValues.itemDesc = ItemValues.itemInfomation[ItemID]["Desc"]
	ItemValues.itemExtra = ItemSpecificString

func _on_button_mouse_exited() -> void:
	ItemValues.itemName = "Item Name will show up Here"
	ItemValues.itemDesc = "Right here, an Item's description will show up."
	ItemValues.itemExtra = ""

func _on_button_pressed() -> void:
	if ItemValues.money >= ItemValues.itemInfomation[ItemID]["Cost"] and MaxedOut == false:
		if ItemValues.itemInfomation[ItemID]["Owned"] == false and ItemValues.itemInfomation[ItemID]["ScenePath"] != null:
			var cacapoopyGOD = load(ItemValues.itemInfomation[ItemID]["ScenePath"])
			var caca = cacapoopyGOD.instantiate()
			add_child(caca)
			caca.reparent($/root/computerShrilow/Shrilow)
		ItemValues.itemInfomation[ItemID]["Owned"] = true
		ItemValues.money -= ItemValues.itemInfomation[ItemID]["Cost"]
		ItemValues.itemInfomation[ItemID]["CurUpgrade"] += 1
		ItemValues.itemExtra = ItemSpecificString
