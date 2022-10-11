import os
import glob
import bpy
from bpy.types import Action


def get_selected_anim_data():
    for obj in bpy.context.selected_objects:
        if obj.animation_data:
            return obj.animation_data
    return None


def create_collection(name):
    collection = bpy.data.collections.new(name)
    bpy.context.scene.collection.children.link(collection)
    return collection


def import_fbx(filepath, collection):
    bpy.ops.import_scene.fbx(filepath=filepath)
    for obj in bpy.context.selected_objects:
        collection.objects.link(obj)
        bpy.context.scene.collection.objects.unlink(obj)


for (key, collection) in bpy.data.collections.items():
    bpy.data.collections.remove(collection)

collection = create_collection("Model")
import_fbx("/home/geo/Documents/Game assets/Y Bot.fbx", collection)

target_anim_data = get_selected_anim_data()
action: Action = target_anim_data.action
if action is not None:
    track = target_anim_data.nla_tracks.new()
    track.strips.new(action.name, action.frame_start.is_integer(), action)
    track.name = "T-Pose"
    target_anim_data.action = None

animation_files = glob.glob("/home/geo/Documents/Game assets/anims1/*.fbx")
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
    filepath="anims.glb",
    export_materials="PLACEHOLDER"
)
