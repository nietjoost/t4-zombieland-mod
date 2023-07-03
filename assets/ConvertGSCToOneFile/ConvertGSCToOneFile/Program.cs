Console.WriteLine("Welcome by the RooieRonnie's GSC project to one file converter");
Console.WriteLine("Paste the folder URL:");

var folderPlace = Console.ReadLine();

if (folderPlace == null || folderPlace.Length == 0)
{
    Console.WriteLine("No folder given!");
    return;
}

var files = Directory.GetFiles(folderPlace, "*.*", SearchOption.AllDirectories);

var cleanedFiles = files.Where(f => !f.Contains(".git"))
    .Where(f => !f.Contains("assets"))
    .Where(f => !f.Contains("README.md"))
    .Where(f => f.Contains(".gsc"))
    .ToList();

var loadMapCount = 1;
var loadFunctionCount = 1;

string path = $"{folderPlace}/assets/exports/Export.txt";

if (File.Exists(path))
{
    File.Delete(path);
}

foreach (var file in cleanedFiles)
{
    string text = File.ReadAllText(file);
    string[] lines = text.Split(Environment.NewLine);

    foreach (var line in lines)
    {
        var newLine = line;

        if (newLine.Contains("#include scripts"))
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

        File.AppendAllLines(path, new[] { newLine });
    }
}