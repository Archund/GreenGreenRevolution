extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#create an array of treeblocks
onready var treL = get_node("1");
#
onready var paperL = get_node("LineEdit6");
onready var plasticL = get_node("LineEdit5");
onready var trashL = get_node("LineEdit4");

var treeBlockArray = []; 
onready var camera = get_node("Camera");
var recyclecount = 0;
var trashcount = 0;
var totalcount = 0;

var paper = 0;
var plastic = 0;
var trash = 0;

func paperadd():
	paper+=1;

func plasticadd():
	plastic +=1;

func trashadd():
	trash +=1;
	

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

		
	if Input.is_action_just_released("1"):
		paperadd();
		paperL.clear()
		paperL.append_at_cursor(str(paper));
	
	if Input.is_action_just_released("2"):
		plasticadd();
		plasticL.clear()
		plasticL.append_at_cursor(str(plastic));
	
	if Input.is_action_just_released("3"):
		trashadd();
		trashL.clear()
		trashL.append_at_cursor(str(trash));


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
	