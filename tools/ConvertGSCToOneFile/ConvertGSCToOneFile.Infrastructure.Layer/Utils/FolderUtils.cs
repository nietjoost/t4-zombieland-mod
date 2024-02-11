namespace ConvertGSCToOneFile.Infrastructure.Layer.Utils
{
    public static class FolderUtils
    {
        public static void CreateFolder(string path)
        {
            try
            {
                // Check if the folder does not exist, then create it
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                    Console.WriteLine($"Folder created at {path}");
                }
                else
                {
                    Console.WriteLine($"Folder already exists at {path}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error creating folder: {ex.Message}");
            }
        }

        public static List<string> GetFolderFiles(string path) 
        {
            return Directory.GetFiles(path, "*.gsc", SearchOption.AllDirectories)
                .Where(f => !f.Contains("callbacks.gsc"))
                .ToList();
        }

        public static bool FolderExists(string path)
        {
            return Directory.Exists(path);
        }
    }
}
