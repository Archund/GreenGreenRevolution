extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#create an array of treeblocks
onready var treL = get_node("1");
var treeBlockArray = []; 
onready var camera = get_node("Camera");
var count = 0;

func treeblockmove():
	treL.translate(Vector3(0,100,0));
	print("werk");
	count+=1;

func _input(event):
	if Input.is_action_just_released("space") and count <= 10:
		treeblockmove();
		


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	# iterate over array and rotate
	#for brick in treeBlockArray:
	#	brick.rotate_y(0.1);
	
	#pass
