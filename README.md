# StudioPresence v3.0.5

A plugin to connect your Studio with Discord!  
Heavily inspired by [DRPC by RigidStudios](https://devforum.roblox.com/t/1086405)

# Examples

![image](https://github.com/iArxic/StudioPresence/assets/77511250/d23b22c2-af73-4f40-a2e8-7e5eeb4a0ada)

# Installation

• Download [Server Here](https://github.com/iArxic/StudioPresence/releases/tag/v3.0.4) and [Roblox Plugin Here](https://www.roblox.com/library/11213975679/StudioPresence)  
• Next, extract the already installed [Server](https://github.com/iArxic/StudioPresence/releases/tag/v3.0.1) to a new folder (Inside desktop recommended).  
• Run it!

*Additional steps for **MacOS** users*
1. Download the Mac server
2. Extract it using the archive utility from the App Store
3. [Open your terminal](https://support.apple.com/guide/terminal/open-or-quit-terminal-apd5265185d-f365-44cb-8b09-71a064a42125) and type `chmod u+x ` and then drag the server file into your terminal, press enter and it will turn the server into an executable file.
4. Open the executable file! (If it cannot verify for malware go to settings > Privacy and Security, scroll down until you find the warning, and press open anyway)

*Additional optional steps for **Windows** users for automatic boot, not required.*
1. Locate the `startup.vbs` file
2. Press Win + R and open `shell:startup`
3. Drag `startup.vbs` into the folder that opens
4. Edit `startup.vbs` with notepad
5. Copy the path to the server exe file
6. Replace `PATH_TO_EXE` with said path, make sure there is only one set of quotation marks  
This will automatically start the server without opening a command window

## How to Use the Menu  
*(Created by [Papgy100](https://github.com/Papgy))*
 
The menu has **4 different text boxes**, which you can fill in to configure your plugin:  

1. **Plugin Name**  
2. **Output**  
3. **Output Location**  
4. **Description**  

### Explanation of each field

- **Plugin Name:**  
  The name of your plugin. This will also appear as the *hover text* (the “editing” value) when you use the plugin. You can set this to anything you like.

- **Output:**  
  The name of the folder, part, or object that the plugin creates when used.

- **Output Location:**  
  Where the output object is created. See the list of available locations below.

- **Description:**  
  The text shown in the activity description when the plugin is active.

---

### Available Output Locations

You can choose any of the following locations for your output:  

```
Workspace, Camera, ReplicatedStorage, StarterGui, StarterPack, StarterPlayer, 
ServerStorage, ServerScriptService, Lighting, Players, Teams, SoundService, 
Chat, TestService, HttpService, RunService, LocalizationService
```

*If you’d like to add more locations, you can edit the `activityCreator` module script inside:  
`src/client/src/generators/activityCreator.server.luau`.*

---

### Usage Example:

Here’s an example setup for **Moon Animator 2**:  

| Field           | Value                       |
|-----------------|-----------------------------|
| Plugin Name     | Moon Animator 2             |
| Output          | MoonAnimator2MouseFilter    |
| Output Location | Camera                      |
| Description     | Animating                   |

It would look something like this:  
<img width="330" height="139" alt="image" src="https://github.com/user-attachments/assets/49c5e826-5a1b-48f2-9378-1cef63cf086d" />

---

**Make sure to have the Output Console open while using the plugin. It will display messages confirming whether the plugin was added successfully or if there were any errors.**

---

You might have an issue with the antivirus incorrectly flagging it as a virus, click "keep" and if needed exclude the file from your antivirus.

_Note: The cmd window needs to be open in order for the plugin to work!_

If the activity doesn't show up, double check you have activity privacy enabled!

**If you have any issues, *reply to this devforum thread* or contact me via my [twitter](https://twitter.com/iArxic)!**

# Special thanks to

[xhayper](https://github.com/xhayper) - v3.0.1  
[Coyenn](https://github.com/Coyenn) - v2  
[Rigid Studios](https://devforum.roblox.com/u/Rigid_Studios) - Original DRPC  
[Eltobb](https://devforum.roblox.com/u/Elttob) - Vanilla icons (Modified)  
[pruzae](https://devforum.roblox.com/u/pruzae) - MacOS installation guide  
[purn8r](https://devforum.roblox.com/u/purn8r) - Windows automatic boot guide

*PS: If you're a scripter you can check out my [RoCommit](https://devforum.roblox.com/t/rocommit-git-like-webhook-logging/1886532) plugin!  
And if you're a builder you can check out [Color Offset](https://devforum.roblox.com/t/color-offset-plugin-add-color-variations-to-your-builds/2333459) plugin!*
