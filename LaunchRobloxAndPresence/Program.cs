using System;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using IWshRuntimeLibrary;

namespace RobloxStudioLauncher
{
    class Program
    {
        static void Main(string[] args)
        {
            // Replace the filename with the name of your Roblox Studio shortcut.
            string shortcutFilename = "Roblox Studio.lnk";

            string exepath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            string SP = Path.Combine(exepath, "SP.exe");
            void StartSP()
            {
                Process _SP = new Process();
                _SP.StartInfo = new ProcessStartInfo(SP)
                {
                    UseShellExecute = true
                };
                _SP.Start();
            }
            // Check if Roblox Studio is already running
            if (Process.GetProcessesByName("RobloxStudioBeta").Length == 0)
            {
                // Roblox Studio is not running, so launch it using the shortcut
                string desktopFolderPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
                string robloxStudioShortcutPath = Path.Combine(desktopFolderPath, shortcutFilename);

                Process proc = new Process();
                proc.StartInfo = new ProcessStartInfo(robloxStudioShortcutPath)
                {
                    UseShellExecute = true
                };
                proc.Start();

                // Start SP.exe
                StartSP();
            }
            else
            {
                Console.WriteLine("Roblox Studio is already running.\n launching Studio Prescence");
                StartSP();

            }
        }
    }
}
