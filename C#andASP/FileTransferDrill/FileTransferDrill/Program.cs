using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace FileTransferDrill
{
    delegate bool ModTimeDel(string filename);
    class Program
    {
        #region
        static bool ModLast24Hours(string filename) 
        { 
            return (File.GetLastWriteTime(filename) >= DateTime.Now.AddHours(-24));
        }
        static bool ModLastHour(string filename)
        {
            return (File.GetLastWriteTime(filename) >= DateTime.Now.AddHours(-1));
        }
        static bool ModLastWeek(string filename)
        {
            return (File.GetLastWriteTime(filename) >= DateTime.Now.AddDays(-7));
        }
        static bool ModLastMonth(string filename)
        {
            return (File.GetLastWriteTime(filename) >= DateTime.Now.AddDays(-30));
        }
        static bool ModLastYear(string filename)
        {
            return (File.GetLastWriteTime(filename) >= DateTime.Now.AddYears(-1));
        }
        #endregion

        static void Main(string[] args)
        {
            string OriginalDirectory = "..\\..\\FolderA";
            string DestinationDirectory = "..\\..\\FolderB";
            IEnumerable<string> files = Directory.GetFiles(OriginalDirectory);
            IEnumerable<string> filesToBeCopied = CheckModTime(files, ModLast24Hours);
            PrintFilesToBeCopied(filesToBeCopied);
            CopyFiles(filesToBeCopied, DestinationDirectory);
        }

        #region
        static IEnumerable<string> CheckModTime(
            IEnumerable<string> files, ModTimeDel TimePeriod)
        {
            foreach(string f in files)
            {
                if (TimePeriod(f))
                {
                    yield return f;
                }
            }
        }

        static void PrintFilesToBeCopied(IEnumerable<string> files)
        {
            Print("THE FOLLOWING FILES WILL BE TRANSFERED: ");
            foreach (string f in files)
            {
                Print(Path.GetFullPath(f).ToString());
            }
            Print("Enter to continue...");
            Console.ReadLine();
        }

        static void CopyFiles(IEnumerable<string> files, string destFolder)
        {
            string fileName;
            foreach(string f in files)
            {
                fileName = Path.GetFileName(f);
                File.Copy(f, destFolder + "\\" + fileName);
            }

            Print("Files Copied Successfully. Enter to continue...");
            Console.ReadLine();
        }

        static void Print(string s)
        {
            Console.WriteLine(s);
        }
        #endregion
    }
}
