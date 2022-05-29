extends Camera


var move_speed = 20 # velocidad de movimiento de la camara


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# defino el vector velocidad como el vector 0 en 3D
	var vel = Vector3(0, 0, 0)
	
	# Dependiendo del input le sumo la velocidad hacia donde quiero que se mueva
	if Input.is_action_pressed("ui_up"):
		vel.y += move_speed * delta
	
	if Input.is_action_pressed("ui_down"):
		vel.y -= move_speed * delta
	
	if Input.is_action_pressed("ui_left"):
		vel.x -= move_speed * delta
	
	if Input.is_action_pressed("ui_right"):
		vel.x += move_speed * delta
	
	# Uso el vector para realizar el desplazamiento de la camara
	self.translate( vel )


# get_raycast_point: None -> Vector3
# retorna el punto donde el raycast toca al primer objeto con el que se encuentra
func get_raycast_point():
	return $RayCastNode/RayCast.get_collision_point()


# get_raycast_collider: None -> Node
# retorna el primer nodo que el raycast esta tocando
func get_raycast_collider():
	return $RayCastNode/RayCast.get_collider()
