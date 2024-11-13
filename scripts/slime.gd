extends Node2D

const SPEED = 60
var direction = 1
@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft
@onready var ray_cast_2d_right_down: RayCast2D = $RayCast2DRightDown
@onready var ray_cast_2d_left_down: RayCast2D = $RayCast2DLeftDown

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_enemy(delta)
	
func move_enemy(delta: float):
	if ray_cast_2d_right.is_colliding() or not ray_cast_2d_right_down.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_2d_left.is_colliding() or not ray_cast_2d_left_down.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * SPEED * delta
