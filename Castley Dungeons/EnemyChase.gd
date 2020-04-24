extends KinematicBody

# ChaseState.gd
var speed = 10


func _init(enemy, params):
  enemy.dir = (enemy.target.position - enemy.position).normalized()

func _physics_process(delta):
  var motion = enemy.dir * enemy.speed
  enemy.move_and_slide(motion)
