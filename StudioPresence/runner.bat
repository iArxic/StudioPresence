@echo off
if not exist %cd%\node_modules (
  echo StudioPresence - Installing Required Packages
  call npm i discord-rpc
cls
echo Required packages installed!
)
Title StudioPresence
node %cd%\index.js
