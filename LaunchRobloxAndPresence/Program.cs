using System;
using System.Diagnostics;
using System.Reflection;
using IWshRuntimeLibrary; // Import the Windows Script Host COM library.

namespace RobloxStudioLauncher
{
    class Program
    {
        static void Main(string[] args)
        {
            // Replace the filename with the name of your Roblox Studio shortcut.
            string shortcutFilename = "Roblox Studio.lnk";

#pragma warning disable CS8600 // Converting null literal or possible null value to non-nullable type.
            string exepath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
#pragma warning restore CS8600 // Converting null literal or possible null value to non-nullable type.
#pragma warning disable CS8602 // Dereference of a possibly null reference.
            string SP = exepath.ToString() + "/SP.exe";
#pragma warning restore CS8602 // Dereference of a possibly null reference.
            // Get the path to the desktop folder.
            string desktopFolderPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);

            // Combine the desktop folder path with the Roblox Studio shortcut filename.
            string robloxStudioShortcutPath = System.IO.Path.Combine(desktopFolderPath, shortcutFilename);

            Process proc = new Process();
            proc.StartInfo = new ProcessStartInfo(robloxStudioShortcutPath)
            {
                UseShellExecute = true
            };
            proc.Start();
            Process _SP = new Process();
            _SP.StartInfo = new ProcessStartInfo(SP)
            {
                UseShellExecute = true
            };
            _SP.Start();


        }
    }
}
