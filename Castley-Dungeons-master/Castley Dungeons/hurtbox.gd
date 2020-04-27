extends Area2D

signal damage_inflicted(amount)
signal hurt()
signal hit_landed()

var is_invincible = false setget set_invincible


func get_hurt(hit):
	if is_invincible:
		return
	emit_signal("hurt")
	emit_signal("damage_inflicted", hit.damage)
	
func _on_area_shape_entered(area_id, area_shape, self_shape):
	var hit = area.hit
	if not is_in_group(hit.team):
		emit_signal("hit_landed", hit)
		get_hurt(hit)
func set_invincible(enabled):
	is_invincible = enable
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
