extends TextureRect

var ItemID : int
var PlaceholderID : int

func _ready() -> void:
	$Clothing.texture = load(ClothingObjects.clothes[ItemID]["IconKey"])

func _process(_delta: float) -> void:
	if ClothingObjects.clothes[ItemID]["Owned"] == true:
		$Clothing/Cost.text = "Owned!"
	else:
		$Clothing/Cost.text = str(ClothingObjects.clothes[ItemID]["Cost"])+"$"
	
	if ClothingObjects.clothes[ItemID]["Owned"] == true:
		modulate = Color(1,1,0)
	elif PlaceholderID == ItemID:
		modulate = Color(0,1,1)
	else:
		modulate = Color(1,1,1)

func _on_button_mouse_entered() -> void:
	PlaceholderID = ClothingObjects.equippedClothing
	ClothingObjects.equippedClothing = ItemID
	ClothingObjects.itemName = ClothingObjects.clothes[ItemID]["Name"]
	ClothingObjects.itemDesc = ClothingObjects.clothes[ItemID]["Desc"]

func _on_button_mouse_exited() -> void:
	ClothingObjects.equippedClothing = PlaceholderID
	ClothingObjects.itemName = "Clothing name will show up here"
	ClothingObjects.itemDesc = "Click a second time once you've selected an item to buy it!"

func _on_button_pressed() -> void:
	if ClothingObjects.clothes[ItemID]["Owned"] == true:
		PlaceholderID = ItemID
		ClothingObjects.equippedClothing = ItemID
		FizzyDrink.updateClothes()
	elif ClothingObjects.clothes[ItemID]["Owned"] == false:
		if ItemValues.money >= ClothingObjects.clothes[ItemID]["Cost"]:
			ItemValues.money -= ClothingObjects.clothes[ItemID]["Cost"]
			ClothingObjects.clothes[ItemID]["Owned"] = true
			_on_button_pressed()
