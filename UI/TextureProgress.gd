extends TextureProgress

export var health = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.value = health
