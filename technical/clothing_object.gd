extends TextureRect

var ItemID : int
var PlaceholderID : int
var array = [
	ClothingObjects.clothes,
	ClothingObjects.clothesTUTORIAL,
	]
var arrayToUse = 0

func _ready() -> void:
	$Clothing.texture = load(array[arrayToUse][ItemID]["IconKey"])

func _process(_delta: float) -> void:
	if array[arrayToUse][ItemID]["Owned"] == true:
		$Clothing/Cost.text = "Owned!"
	else:
		$Clothing/Cost.text = str(array[arrayToUse][ItemID]["Cost"])+"$"
	
	if array[arrayToUse][ItemID]["Owned"] == true:
		modulate = Color(1,1,0)
	elif PlaceholderID == ItemID:
		modulate = Color(0,1,1)
	else:
		modulate = Color(1,1,1)

func _on_button_mouse_entered() -> void:
	PlaceholderID = ClothingObjects.equippedClothing
	ClothingObjects.equippedClothing = ItemID
	ClothingObjects.itemName = array[arrayToUse][ItemID]["Name"]
	ClothingObjects.itemDesc = array[arrayToUse][ItemID]["Desc"]

func _on_button_mouse_exited() -> void:
	ClothingObjects.equippedClothing = PlaceholderID
	ClothingObjects.itemName = "Clothing name will show up here"
	ClothingObjects.itemDesc = "Click a second time once you've selected an item to buy it!"

func _on_button_pressed() -> void:
	if array[arrayToUse][ItemID]["Owned"] == true:
		PlaceholderID = ItemID
		ClothingObjects.equippedClothing = ItemID
		FizzyDrink.updateClothes()
	elif array[arrayToUse][ItemID]["Owned"] == false:
		if ItemValues.money >= array[arrayToUse][ItemID]["Cost"]:
			ItemValues.money -= array[arrayToUse][ItemID]["Cost"]
			array[arrayToUse][ItemID]["Owned"] = true
			_on_button_pressed()
