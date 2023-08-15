import os
import glob
import bpy
from bpy.types import Action

character_file = os.path.abspath(os.environ["GDLIB_CHARACTER_FILE"].strip('"'))
animations_dir = os.path.abspath(os.environ["GDLIB_ANIMATIONS_DIR"].strip('"'))
output_file = os.path.abspath(os.environ["GDLIB_OUTPUT_FILE"].strip('"'))

def get_selected_anim_data():
    for obj in bpy.context.selected_objects:
        if obj.animation_data:
            return obj.animation_data
    return None

for (key, collection) in bpy.data.collections.items():
    bpy.data.collections.remove(collection)

bpy.ops.import_scene.fbx(filepath=character_file)

target_anim_data = get_selected_anim_data()
action: Action = target_anim_data.action
if action is not None:
    track = target_anim_data.nla_tracks.new()
    track.strips.new(action.name, action.frame_start.is_integer(), action)
    track.name = "T-Pose"
    target_anim_data.action = None

animation_files_pattern = os.path.join(animations_dir, "*.fbx")
animation_files = glob.glob(animation_files_pattern)
for file in animation_files:
    head, tail = os.path.split(file)
    basename, ext = os.path.splitext(tail)
    bpy.ops.import_scene.fbx(filepath=file)
    animation_data = bpy.context.object.animation_data
    action: Action = animation_data.action
    if action is not None:
        track = target_anim_data.nla_tracks.new()
        track.strips.new(basename, action.frame_start.is_integer(), action)
        track.name = basename
        animation_data.action = None
    bpy.ops.object.delete()

bpy.ops.export_scene.gltf(
    filepath=output_file,
    export_materials="PLACEHOLDER"
)
