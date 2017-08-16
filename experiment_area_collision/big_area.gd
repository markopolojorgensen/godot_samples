extends Area2D

export(int) var layer_bit = 0
export(bool) var debug = false

onready var button = get_node("Button")
onready var enabled_timer = get_node("enabled_timer")

func _ready():
	disable_hitbox()
	button.connect("pressed", self, "button_pressed")
	connect("area_enter", self, "on_area_enter")

func on_area_enter(area):
	print("big area works! area: " + str(area))

func button_pressed():
	enable_hitbox()
	enabled_timer.start()
	yield(enabled_timer, "timeout")
	disable_hitbox()

func enable_hitbox():
	if debug:
		print("on")
	set_collision_mask_bit(layer_bit, true)
	set_layer_mask_bit(    layer_bit, true)

func disable_hitbox():
	if debug:
		print("off")
	set_collision_mask_bit(layer_bit, false)
	set_layer_mask_bit(    layer_bit, false)
