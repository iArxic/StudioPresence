# StudioPresence with a menu V1.0.0

**[Link to original project with instractions on how to install](https://github.com/iArxic/StudioPresence)**

---
**[Link to the plugin](https://create.roblox.com/store/asset/127737507985445/StudioPresence-with-a-Menu)**


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
`src/client/src/generators/activityCreator.luau`.*

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
