
extends Control

var currentScreen = "intro.tscn"
var previousScreen = "intro.tscn"

var options = {
fullscreen = false,
windowSize = Vector2(OS.get_window_size()),
screenSize = Vector2(OS.get_screen_size())
}

var level_0Player = {
bullet = "bullet_0"
}

func save_game():
	var f = File.new()
	var err = f.open_encrypted_with_pass("user://savedata.bin", File.WRITE, "mamke_privet,_cheater_poganii")
	f.store_var(options)
	f.close()

func load_game():
	var f = File.new()
	if !f.file_exists("user://savedata.bin"):
		return #Error!  We don't have a save to load
	var err = f.open_encrypted_with_pass("user://savedata.bin", File.READ, "mamke_privet,_cheater_poganii")
	options = f.get_var()
	f.close()

func set_screen(sceneInScreensFolder):
	#add screen changer for all, or rework this systen, cos its pass not for all situations
	get_tree().change_scene("res://screens/" + sceneInScreensFolder)
	previousScreen = currentScreen
	currentScreen = sceneInScreensFolder

func get_currentScreen(scene):
	return(currentScreen)

func get_previousScreen(scene):
	return(previousScreen)

#func save_game():
#	var savegame = File.new()
#	savegame.open("user://savegame.save", File.WRITE)
#	var savenodes = get_tree().get_nodes_in_group("Persist")
#	for i in savenodes:
#		var nodedata = i.save()
#		savegame.store_line(nodedata.to_json())
#		savegame.close()
#
#func load_game():
#	var savegame = File.new()
#	if !savegame.file_exists("user://savegame.save"):
#		return #Error!  We don't have a save to load
#
# We need to revert the game state so we're not cloning objects during loading.  This will vary wildly depending on the needs of a project, so take care with this step.
# For our example, we will accomplish this by deleting savable objects.
#	var savenodes = get_tree().get_nodes_in_group("Persist")
#	for i in savenodes:
#		i.queue_free()
#
# Load the file line by line and process that dictionary to restore the object it represents
#	var currentline = {} # dict.parse_json() requires a declared dict.
#	savegame.open("user://savegame.save", File.READ)
#	while (!savegame.eof_reached()):
#		currentline.parse_json(savegame.get_line())
# First we need to create the object and add it to the tree and set its position.
#		var newobject = load(currentline["filename"]).instance()
#		get_node(currentline["parent"]).add_child(newobject)
#		newobject.set_pos(Vector2(currentline["posx"],currentline["posy"]))
# Now we set the remaining variables.
#		for i in currentline.keys():
#			if (i == "filename" or i == "parent" or i == "posx" or i == "posy"):
#				continue
#			newobject.set(i, currentline[i])
#	savegame.close()

func _ready():
	load_game()

func _exit_tree():
	save_game()
