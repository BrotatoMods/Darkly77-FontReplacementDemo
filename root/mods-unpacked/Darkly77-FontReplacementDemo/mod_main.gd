extends Node

const MOD_DIR = "Darkly77-FontReplacementDemo/" # name of the folder that this file is in
const D77_FONTDEMO_MODID = "Darkly77-FontReplacementDemo" # full ID of your mod (AuthorName-ModName)


func _init(_modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", D77_FONTDEMO_MODID)
	replace_fonts_preload()


func _ready()->void:
	ModLoaderUtils.log_info("Ready", D77_FONTDEMO_MODID)


# Replace fonts with our custom one
func replace_fonts_preload() -> void:
	var font_resources = [
		preload("res://resources/fonts/actual/base/font_biggest.tres"),
		preload("res://resources/fonts/actual/base/font_big_outlined.tres"),
		preload("res://resources/fonts/actual/base/font_big_title.tres"),
		preload("res://resources/fonts/actual/base/font_button.tres"),
		preload("res://resources/fonts/actual/base/font_floating_text.tres"),
		preload("res://resources/fonts/actual/base/font_menus.tres"),
		preload("res://resources/fonts/actual/base/font_smallest_text.tres"),
		preload("res://resources/fonts/actual/base/font_small_button.tres"),
		preload("res://resources/fonts/actual/base/font_small_text.tres"),
		preload("res://resources/fonts/actual/base/font_small_title.tres"),
		preload("res://resources/fonts/actual/base/font_subtitle.tres"),
	]

	var replacement_font = load("res://mods-unpacked/Darkly77-FontReplacementDemo/fonts/Caveat-Medium.ttf")

	# Loop over vanilla font files
	for font_res in font_resources:
		# Replace the font source
		font_res.font_data = replacement_font
		ModLoaderUtils.log_info("Replaced font: " + font_res.resource_path, D77_FONTDEMO_MODID)
