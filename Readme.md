# Godot Project Starter
This project is forked from Cogito and includes addons and libraries for making my game projects.

## Cogito
Cogito is a First Person Immersive Sim Template Project for Godot 4, providing a framework for creating interactable objects, various items to use and mechanics to influence the player and game environment.
In short, with COGITO you get a quick start for a fully-featured first person game with a great variety of mechanics and a solid base to create your own.

[Online documentation](https://cogito.readthedocs.io/en/latest/index.html)

[Video tutorial series](https://cogito.readthedocs.io/en/latest/tutorials.html)

[Cogito in the Godot Asset Store (beta)](https://store-beta.godotengine.org/asset/philip-drobar/cogito)

COGITO is made by [Philip Drobar](https://www.philipdrobar.com) with help from [these contributors](https://github.com/Phazorknight/Cogito/graphs/contributors).

[Credits, Contributors and License](https://cogito.readthedocs.io/en/latest/about.html)

## Func Godot and Trenchbroom
Setup
1. Download and install Trenchbroom at root (i.e. C:\Trenchbroom)
2. Add the Godot project folder to the Trenchbroom games folder (i.e. C:\Trenchbroom\games\GodotProjectStarter)
3. Check that func_godot is enabled in Project Settings
4. Navigate to res://addons/func_godot/func_godot_local_config.tres
5. Paste path to Trenchbroom /games folder (i.e. C:\Trenchbroom\games\GodotProjectStarter) into Fgd Output Folder and Trenchbroom Game Config Folder fields
6. Paste path to Godot project folder into Map Editor Game Path (C:\Users\adamp\Projects\Godot\GodotProjectStarter)
7. Navigate to res://trenchbroom/godotprojectstarter_fgd.tres and press Export FGD file
8. Navigate to res://trenchbroom/trenchbroom_config.tres and press Export Game Config
9. Confirm that GameConfig.cfg and GodotProjectStarter.fgd are in the Trenchbroom games folder (C:\Trenchbroom\games\GodotProjectStarter)
10. Open Trenchbroom and click New Map then Open Preferences
11. Find GodotProjectStarter, paste the project folder into the game path (i.e. C:\Users\adamp\Projects\Godot\GodotProjectStarter), and click Apply
Create a map
1. Open Trenchbroom, click New Map, and select GodotProjectStarter
2. Click Mods, find trenchbroom, and click the + to enable it
3. Click on the Face tab and press F5. You should see all of the textures available.
4. Save the map in the Godot project trenchbroom folder (i.e. C:\Users\adamp\Projects\Godot\GodotProjectStarter\trenchbroom\maps)
5. Add a FuncGodotMap to a 3D scene.
6. Drag godotprojectstarter_fgd.tres into Map Settings, and add the path to the Trenchbroom map (i.e. res://trenchbroom/maps/test.map) to Local Map File
7. Open Map Settings and add res://trenchbroom/textures to Base Texture Dir
8. Click Build Map

## Credits
Sounds effects by Zapsplat
'WRAD TEXTURES' by Erik Engström: https://wriks.itch.io/wrad-textures
