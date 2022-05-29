extends StaticBody


var estado = false
var material

# Called when the node enters the scene tree for the first time.
func _ready():
	material = SpatialMaterial.new() # Creo un nuevo material cuando spawnea el objeto
	$MeshInstance.set_surface_material( 0, material ) # seteo el material a la mesh (el cubo 3D)


# toggle_estado: None -> None
# cambio el color del material dependiendo del estado actual
func toggle_estado():
	
	# Cambio el color dependiendo del estado
	if not estado:
		material.albedo_color = Color(0, 1, 0) # verde
	else:
		material.albedo_color = Color(1, 1, 1) # blanco
	
	# seteo el material de la mesh
	$MeshInstance.set_surface_material( 0, material )
	
	# cambio el estado para que la proxima vez que cambie de estado sea el otro color
	self.estado = not self.estado
