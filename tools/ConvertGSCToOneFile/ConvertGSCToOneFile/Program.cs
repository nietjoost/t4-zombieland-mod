using ConvertGSCToOneFile.Infrastructure.Layer.Const;
using ConvertGSCToOneFile.Infrastructure.Layer.Utils;

namespace ConvertGSCToOneFile {

    public class Program
    {
        const string DEFAULT_FILE = "init.gsc";
        const string DEFAUL_EXPORT_FOLDER = "\\exports\\";
        const string DEFAUL_EXPORT_FILE_NAME = "Export.txt";

        static void Main(string[] args)
        {
            // Default vars
            var loadMapCount = 1;
            var loadFunctionCount = 1;

            // Console start message
            Console.WriteLine($"Welcome to the {COLOR.CYAN}RooieRonnie's {COLOR.NORMAL}GSC project to one file converter tool");
            Console.WriteLine($"Paste the folder path to the {DEFAULT_FILE} file:");

            // Read the folder line
            var folderPlace = Console.ReadLine();

            // If folder is null, stop the process
            if (folderPlace == null || folderPlace.Length == 0)
            {
                Console.WriteLine($"{COLOR.RED}No folder given!{COLOR.NORMAL}");
                return;
            }

            if (FolderUtils.FolderExists(Path.Combine(folderPlace, DEFAULT_FILE)))
            {
                Console.WriteLine($"{COLOR.RED}The given folder does not contain an init file!{COLOR.NORMAL}");
                return;
            }

            // Get all the files in the given directory
            var files = FolderUtils.GetFolderFiles(folderPlace);
            Console.WriteLine($"Total files found: {COLOR.GREEN}{files.Count}{COLOR.NORMAL}");

            // Check if the directory exests
            bool folderExists = FolderUtils.FolderExists(Path.Combine(folderPlace, DEFAUL_EXPORT_FOLDER));

            if (!folderExists)
            {
                Directory.CreateDirectory(Path.Combine(folderPlace, DEFAUL_EXPORT_FOLDER));
            }

            // Removes export file if exists
            string exportPath = Path.Combine(folderPlace, DEFAUL_EXPORT_FOLDER, DEFAUL_EXPORT_FILE_NAME);

            if (File.Exists(exportPath))
            {
                File.Delete(exportPath);
            }

            // Check each line if we want to include it in the file
            foreach (var file in files)
            {
                Console.WriteLine($"Converting file {COLOR.CYAN}{Path.GetFileName(file)}{COLOR.NORMAL}");
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

                    File.AppendAllLines(exportPath, new[] { newLine });
                }
            }

            // Export file with at the beginning #includes (#includes at start otherwise the script does not work)
            string content = File.ReadAllText(exportPath);
            content = "#include maps\\mp\\_utility;" + "\n" + "#include maps\\mp\\gametypes\\_hud_util;" + "\n" + content;
            File.WriteAllText(exportPath, content);

            Console.WriteLine();
            Console.WriteLine($"File is saved to: {COLOR.GREEN}{exportPath}{COLOR.NORMAL}");
        }
    }
}