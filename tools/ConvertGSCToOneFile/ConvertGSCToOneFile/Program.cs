using static System.Net.Mime.MediaTypeNames;

const string CYAN = "\x1b[96m";
const string RED = "\x1b[91m";
const string GREEN = "\x1b[92m";
const string NORMAL = "\x1b[39m";

// Console start message
Console.WriteLine("Welcome to the RooieRonnie's GSC project to one file converter tool");
Console.WriteLine("Paste the folder path to the init.gsc file:");

// Read the folder line
var folderPlace = Console.ReadLine();

// If folder is null, stop the process
if (folderPlace == null || folderPlace.Length == 0)
{
    Console.WriteLine($"{RED}No folder given!{NORMAL}");
    return;
}

if (Directory.Exists(folderPlace) == false)
{
    Console.WriteLine($"{RED}The given folder does not exists!{NORMAL}");
    return;
}

if (File.Exists($"{folderPlace}/init.gsc") == false)
{
    Console.WriteLine($"{RED}The given folder does not contain an valid start file (init.gsc)!{NORMAL}");
    return;
}

// Get all the files in the given directory
var files = Directory.GetFiles(folderPlace, "*.*", SearchOption.AllDirectories);

// Remove unwanted files
var cleanedFiles = files.Where(f => !f.Contains(".git"))
    .Where(f => !f.Contains("assets"))
    .Where(f => !f.Contains("tools"))
    .Where(f => !f.Contains("README.md"))
    .Where(f => !f.Contains("callbacks.gsc"))
    .Where(f => f.Contains(".gsc"))
    .ToList();
Console.WriteLine($"Total files found: {GREEN}{cleanedFiles.Count}{NORMAL}");

// Set variables for the custom map edits
var loadMapCount = 1;
var loadFunctionCount = 1;

// Check if the directory exests
bool folderExists = Directory.Exists($"{folderPlace}/exports/");

if (!folderExists)
{
    Directory.CreateDirectory($"{folderPlace}/exports/");
}

// Removes export file if exists
string path = $"{folderPlace}/exports/Export.txt";

if (File.Exists(path))
{
    File.Delete(path);
}

// Check each line if we want to include it in the file
foreach (var file in cleanedFiles)
{
    Console.WriteLine($"Converting file {CYAN}{Path.GetFileName(file)}{NORMAL}");
    string text = File.ReadAllText(file);
    string[] lines = text.Split(Environment.NewLine);

    foreach (var line in lines)
    {
        var newLine = line;

        if (newLine.Contains("#include scripts"))
        {
            continue;
        }

        if (newLine.Contains("#include"))
        {
            continue;
        }

        if (newLine.Contains("::Load();"))
        {
            newLine = newLine.Replace(newLine, $"Load{loadMapCount}();");
            loadMapCount++;
        }

        if (newLine.StartsWith("Load()"))
        {
            newLine = newLine.Replace(newLine, $"Load{loadFunctionCount}()");
            loadFunctionCount++;
        }

        if (newLine.StartsWith("init()"))
        {
            newLine = newLine.Replace(newLine, "ZombieLand()");
        }

        File.AppendAllLines(path, new[] { newLine });
    }
}

// Export file with at the beginning #includes (#includes at start otherwise the script does not work)
string content = File.ReadAllText(path);
content = "#include maps\\mp\\_utility;" + "\n" + "#include maps\\mp\\gametypes\\_hud_util;" + "\n" + content;
File.WriteAllText(path, content);

Console.WriteLine();
Console.WriteLine($"File is saved to: {GREEN}{path}{NORMAL}");