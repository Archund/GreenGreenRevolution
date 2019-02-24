extends Spatial


var objectList = []
var object
var count



# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#create an array of treeblocks
onready var treL = get_node("1");
var treeBlockArray = []; 
onready var camera = get_node("Camera");
var recyclecount = 0;
var trashcount = 0;
var totalcount = 0;

func treeblockmove():
	treL.translate(Vector3(0,100,0));
	recyclecount+=1;
	totalcount +=1;
	
func treeblockmove2():
	treL.translate(Vector3(0,-20,0));
	trashcount+=1;	
	totalcount -=0.2;

	
func _input(event):
	if Input.is_action_just_released("space") and totalcount <= 10:
		treeblockmove();
		
	if Input.is_action_just_released("backspace") and totalcount <= 10:
		treeblockmove2();
		






func _ready():
	objectList = [
		preload("res://objects/tree.tscn")]#,
		#preload("res://")
	#]
	camera = get_node("Camera");
	newObject();



func newObject():
	if object != null :
		get_parent().remove_child(self)
	
	object = randomObject().instance()
	add_child(object)
	object.translate(Vector3(0,object.offset,0))
	count = 0


func randomObject():
	var rob = objectList[randi() % objectList.size()]
	return rob


func moveObject():
	object.translate(Vector3(0,object.step,0));
	count+=1;


func trash():
	pass


func recycling():
	pass


func finish():
	pass


func _inputTest(event):
	if Input.is_action_just_released("ui_accept") and object != null :
			trash()

	if Input.is_action_just_released("ui_select") and object != null :
		if count < object.count:
			recycling()


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
