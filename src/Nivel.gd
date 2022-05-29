extends Node


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position() # obtenemos la posicion del mouse en la pantalla
	var from = $Camera.project_ray_origin(mouse_pos) # obtenemos la posicion equivalente a la posicion de la camara
	var to = from + $Camera.project_ray_normal(mouse_pos) # obtenemos la direccion en donde nuestro puntero deberia mirar
	$Camera/RayCastNode.look_at_from_position( from, to, Vector3.UP ) # giramos el RayCastNode para que mire en esa direccion
	
	# Si hacemos click en la pantalla entonces...
	if Input.is_action_just_pressed("ui_select") :
		
		# si el puntero esta tocando un objeto entonces...
		var collider = $Camera.get_raycast_collider()
		if( collider != null ):
			# Efectos de particulas en el punto en el que hicimos click
			var point = $Camera.get_raycast_point()
			$Particles.transform.origin = point
			$Particles.restart()
			
			# Cambiamos el estado del objeto que estamos clickeando
			collider.toggle_estado()
