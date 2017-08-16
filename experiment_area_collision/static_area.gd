extends Area2D

export var make_it_work = false setget set_working

func _ready():
	connect("area_enter", self, "on_area_enter")

func on_area_enter(area):
	print("static area works! area: " + str(area))

func _fixed_process(delta):
	set_pos(get_pos())

func set_working(val):
	make_it_work = val
	set_fixed_process(val)
