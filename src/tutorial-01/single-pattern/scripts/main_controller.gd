extends Node
class_name MainController

# This is the model that will be the data for the view.
var model: MainModel

# This is the data for the story itself (this would be loaded from somewhere else in an actual project)
var story_data: Array = [{
	"profile": "Test 1",
	"text": "This is some text which is displayed on the view.",
	"background": 0
},{
	"profile": "Test 1",
	"text": "Here is some more text.",
	"background": 0
},{
	"profile": "Test 1",
	"text": "We now have a new background!",
	"background": 1
},{
	"profile": "Test 2",
	"text": "And I am a new person with a new background.",
	"background": 2
}]

# Current index of the story, used to determine what should be displayed.
var story_index:int = 0

# Components in the view
@export_category("Main Controller")
@export var next_button:BaseButton
@export var name_label: Label
@export var text_label: RichTextLabel
@export var background: TextureRect

@export var available_backgrounds: Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready():
	# We make a new model when the scene is loaded using the defaults in the model.
	model = MainModel.new()
	model.profile_name = story_data[story_index].profile
	model.text = story_data[story_index].text
	model.background = story_data[story_index].background
	
	_update_view()

# Used to update the view 
func _update_view():
	name_label.text = model.profile_name
	text_label.text = model.text
	background.texture = available_backgrounds[model.background]
