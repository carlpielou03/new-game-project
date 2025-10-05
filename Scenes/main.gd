extends Node

var health = 120
#export makes it so it appears in the inspector.
enum Alignment {ALLY, NUETRAL, ENEMY}
@export var damage : int = 14
# Alternatively Can do
# var damage := 20 -- Automatically makes it an int that cannot be changed ever.
@export var items = ["Potion", "Sword"]
@export var dictionary_test = {
	"Test1": 20,
	"Test2": 35,
}
@export var unit_alignment : Alignment 

@onready var label: Label = $Label
@onready var test_button: Button = $TestButton

signal died



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in 2:
		print("Hello World!")
	
	label.add_theme_font_size_override("font_size", 50)
	label.text = "Hello, World! Press Spacebar to do something."
	label.modulate = Color.GREEN
#	pass # Replace with function body. Pass allows the function to go on without an error.

#Go to prject, Project Settings, Input Map, and create a new action. 
#Bind a key to that action.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("my_action"):
		health -= damage
		label.add_theme_font_size_override("font_size", 72)
		if health <= 0:
			label.text = "Goodbye, World! I have died!"
			died.emit()
		else:
			label.modulate = Color.RED
			label.text = "Hello, World! I have " + str(health) + " health"
		
		
	if event.is_action_released("my_action"):
		$Label.modulate = Color.GREEN
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
#	pass


func _on_button_pressed() -> void:
	health = 120
	label.modulate = Color.GREEN
	label.text = "Hello, World! I have " + str(health) + " health"
	test_button.release_focus()


func _on_died() -> void:
	print("Died!")
	pass # Replace with function body.
