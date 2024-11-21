Vehicle Wheel Breaking Script for FiveM
Overview
This Lua script enhances vehicle dynamics in FiveM by randomly breaking a wheel of the player's vehicle if it remains airborne for more than 1 second. The script is optimized for performance, ensuring minimal delay.
Features
Breaks a random wheel when the vehicle lands after being airborne.
Excludes specific vehicle types (e.g., motorcycles, off-road vehicles, boats, airplanes, helicopters, trains, open-wheel cars, bicycles).
Supports custom off-road vehicles through a predefined list.
Installation
Download the Script: Clone or download the repository from GitHub.
Add to Your Server: Place the script file in your server's resource folder.
Start the Resource: Add start [NoFailDrive] to your server.cfg file.
Editing the Script
To customize the script, follow these steps:
Open the Script: Use a text editor (e.g., Visual Studio Code, Notepad++) to open the Lua script file.
Modify Excluded Vehicles:
Locate the excludedVehicles table in the script.
Add or remove vehicle model names as needed. For example:


.lua
local excludedVehicles = {
    "bifta",
    "sandking",
    "rebel",
    "monster",
    -- Add more custom models here
}

Adjust Airborne Time:
Change the value in the conditional statement that checks airborne time to modify how long a vehicle must be in the air before a wheel is broken:
lua
if vehicleAirTime > 1 then

Save Changes: After making your edits, save the file.
Restart Your Server: Restart your FiveM server to apply the changes.
Support
For any issues or questions, feel free to open an issue on the GitHub repository or contact me directly. Feel free to customize this README further based on your preferences!
