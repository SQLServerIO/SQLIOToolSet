//SQLIOParser thrown together by Wes Brown
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, and to permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//
//using NDesk.Options for the command line parsing way tired of writing command line parsers!
//
//
//This will parse the output of the unsupported tool sqlio from
//Microsoft at http://www.microsoft.com/downloads/details.aspx?familyid=9a8b005b-84e4-4f24-8d65-cb53442d9e19&displaylang=en
//this tool should parse the output of version 1.5SG
//the -LS option is expected for full results. 
//Command line sample: sqlio -kW -s60 -frandom -o1 -b1 -LS -BN -Fc:\params.txt >> result.txt
//or you can use the batch file I've put together contained in this archive.

using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using NDesk.Options;

namespace SQLIOParser
{
    class ParseSQLIOFile
    {
        static void Main(string[] args)
        {
            Console.WriteLine("SQLIOParser 0.20");
            int parseerr = ParseCommandLine(args);
            if (parseerr == 1)
                return;

            //set globals to some defaults. I use this mostly to debug insert issues.
            GlobalVariables.TestDate = Convert.ToDateTime("01/01/1900 12:00:00.000");
            GlobalVariables.ComputerName = "";
            GlobalVariables.TestDescription = "";
            GlobalVariables.SQLIOCommandLine = "";
            GlobalVariables.ParamFile = "";
            GlobalVariables.RunTime = 0;
            GlobalVariables.CoolOff = 0;
            GlobalVariables.NumberOfFiles = 0;
            GlobalVariables.TestFiles = "";
            GlobalVariables.FileSize = 0;
            GlobalVariables.NumberOfThreads = 0;
            GlobalVariables.IOOperation = "";
            GlobalVariables.IOSize = "";
            GlobalVariables.IOOutstanding = 0;
            GlobalVariables.IOType = "";
            GlobalVariables.IOSec = 0;
            GlobalVariables.MBSec = 0;
            GlobalVariables.MinLatency = 0;
            GlobalVariables.AvgLatency = 0;
            GlobalVariables.MaxLatency = 0;

            var importFileList = new List<string>();

            //the data holder
            var traces = new DataSet();
            DataTable sqlioData = traces.Tables.Add();

            //raw data
            sqlioData.Columns.Add("ComputerName", typeof(string));
            sqlioData.Columns.Add("TestDescription", typeof(string));
            sqlioData.Columns.Add("SQLIOCommandLine", typeof(string));
            sqlioData.Columns.Add("SQLIOFileName", typeof(string));
            sqlioData.Columns.Add("ParameterFile", typeof(string));
            sqlioData.Columns.Add("TestDate", typeof(DateTime));
            sqlioData.Columns.Add("RunTime", typeof(Int32));
            sqlioData.Columns.Add("CoolOff", typeof(Int32));
            sqlioData.Columns.Add("NumberOfFiles", typeof(Int32));
            sqlioData.Columns.Add("TestFiles", typeof(string));
            sqlioData.Columns.Add("FileSize", typeof(Int32));
            sqlioData.Columns.Add("NumberOfThreads", typeof(Int32));
            sqlioData.Columns.Add("IOOperation", typeof(string));
            sqlioData.Columns.Add("IOSize", typeof(string));
            sqlioData.Columns.Add("IOOutstanding", typeof(Int32));
            sqlioData.Columns.Add("IOType", typeof(string));
            sqlioData.Columns.Add("IOSec", typeof(decimal));
            sqlioData.Columns.Add("MBSec", typeof(decimal));
            sqlioData.Columns.Add("MinLatency", typeof(Int32));
            sqlioData.Columns.Add("AvgLatency", typeof(Int32));
            sqlioData.Columns.Add("MaxLatency", typeof(Int32));

            if (GlobalVariables.SQLIODirectoryName != null)
            {
                GlobalVariables.SQLIODirectoryName = GlobalVariables.SQLIODirectoryName.Replace('"',' ').Trim();
                Console.WriteLine("Directory To Process:" + GlobalVariables.SQLIODirectoryName);
                try
                {
                    foreach (string fileName in Directory.GetFiles(GlobalVariables.SQLIODirectoryName))
                    {
                        if (!FileInUse(fileName))
                            if(fileName.Contains(".txt"))
                                importFileList.Add(fileName);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("Failed to import files");
                    Console.WriteLine(e.Message);
                }
            }
            else
            {
                importFileList.Add(GlobalVariables.SQLIOFileName);
            }

            StreamReader re;

            foreach (string fileName in importFileList)
            {
                try
                {
                    re = File.OpenText(fileName);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                    return;
                }

                try
                {
                    GlobalVariables.TestDate = File.GetCreationTime(fileName);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                    return;
                }

                bool addRecord = false;
                string input;

                Console.WriteLine("Processing File:"+ fileName +"...");
                Console.WriteLine();

                while ((input = re.ReadLine()) != null)
                {
                    if (input.Contains("ComputerName"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.ComputerName = splitInput[1];
                    }

                    if (input.Contains("Date"))
                    {
                        Match m = Regex.Match(input, @"\d{1,2}[-/\.]\d{1,2}[-/\.]\d{4}\s*\d{1,2}:\d\d(:\d\d)?");

                        if (m.Success)
                        {
                            string datePart = m.Value;
                            try
                            {
                                GlobalVariables.TestDate = DateTime.ParseExact(datePart, "MM/dd/yyyy HH:mm:ss", null);
                            }
                            catch
                            {
                                try
                                {
                                    GlobalVariables.TestDate = DateTime.ParseExact(datePart, "MM/dd/yyyy H:mm:ss", null);
                                }
                                catch (Exception e)
                                {
                                    Console.WriteLine(e.Message);
                                }
                            }
                        }
                    }

                    if (input.Contains("from file"))
                    {
                        try
                        {
                            string[] splitInput = input.Split(' ');
                            GlobalVariables.TestFiles = (splitInput[splitInput.Length - 1]);
                        }
                        catch (Exeption e)
                        {
                            Console.WriteLine("Error Parsing Input File: " + fileName);
                            Console.WriteLine(e.Message);
                        }
                    }
                    if (input.Contains("Runtime"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.CoolOff = Convert.ToInt32(splitInput[1]);
                    }

                    if (input.Contains("Cool Off"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.CoolOff = Convert.ToInt32(splitInput[2]);
                    }

                    if (input.Contains("Parameters File:"))
                    {
                        GlobalVariables.ParamFile = input.Substring((input.IndexOf(':') + 2));
                    }

                    if (input.Contains("Description"))
                    {
                        string[] splitInput = input.Split(':');
                        GlobalVariables.TestDescription = splitInput[1].Replace("\"", "").Trim();
                    }

                    if (input.Contains("Command Line:"))
                    {
                        string[] splitInput = input.Split(':');
                        GlobalVariables.SQLIOCommandLine = splitInput[1].Replace("\"", "").Trim();
                    }

                    if (input.Contains("threads writing") || input.Contains("threads reading") || input.Contains("thread writing") || input.Contains("thread reading"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.NumberOfThreads = Convert.ToInt32(splitInput[0]);
                        GlobalVariables.RunTime = Convert.ToInt32(splitInput[4]);
                        GlobalVariables.IOOperation = splitInput[2];

                        if (input.Contains("to files "))
                        {
                            GlobalVariables.NumberOfFiles = splitInput.Length - 9;
                        }
                        else if (input.Contains("to file "))
                        {
                            GlobalVariables.NumberOfFiles = 1;
                        }
                    }
                    if (input.Contains("IOs") && input.Contains("using"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.IOSize = splitInput[1];
                        GlobalVariables.IOType = splitInput[2];
                    }
                    if (input.Contains("outstanding"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.IOOutstanding = Convert.ToInt32(splitInput[6]);
                    }
                    if (input.Contains("IOs/sec:"))
                    {
                        var decregex = new Regex(@"[0-9]+(?:\.[0-9]*)?", RegexOptions.Compiled);
                        var match = decregex.Match(input);
                        GlobalVariables.IOSec = Convert.ToDecimal(match.Groups[0].Value);
                    }
                    if (input.Contains("MBs/sec:"))
                    {
                        var decregex = new Regex(@"[0-9]+(?:\.[0-9]*)?", RegexOptions.Compiled);
                        var match = decregex.Match(input);
                        GlobalVariables.MBSec = Convert.ToDecimal(match.Groups[0].Value);
                    }
                    if (input.Contains("Min_Latency(ms):"))
                    {
                        var splitInput = input.Split(' ');
                        GlobalVariables.MinLatency = Convert.ToInt32(splitInput[1]);
                    }
                    if (input.Contains("Avg_Latency(ms):"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.AvgLatency = Convert.ToInt32(splitInput[1]);
                    }
                    if (input.Contains("Max_Latency(ms):"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.MaxLatency = Convert.ToInt32(splitInput[1]);
                        addRecord = true;
                    }
                    if (input.Contains("using specified size:"))
                    {
                        string[] splitInput = input.Split(' ');
                        GlobalVariables.FileSize = Convert.ToInt32(splitInput[3]);
                    }

                    if (addRecord)
                        sqlioData.Rows.Add
                            (
                            GlobalVariables.ComputerName,
                            GlobalVariables.TestDescription,
                            GlobalVariables.SQLIOCommandLine,
                            fileName,
                            GlobalVariables.ParamFile,
                            GlobalVariables.TestDate,
                            GlobalVariables.RunTime,
                            GlobalVariables.CoolOff,
                            GlobalVariables.NumberOfFiles,
                            GlobalVariables.TestFiles,
                            GlobalVariables.FileSize,
                            GlobalVariables.NumberOfThreads,
                            GlobalVariables.IOOperation,
                            GlobalVariables.IOSize,
                            GlobalVariables.IOOutstanding,
                            GlobalVariables.IOType,
                            GlobalVariables.IOSec,
                            GlobalVariables.MBSec,
                            GlobalVariables.MinLatency,
                            GlobalVariables.AvgLatency,
                            GlobalVariables.MaxLatency);
                    addRecord = false;
                }
                //reset to defaults keep bogus data from crossing record lines
                GlobalVariables.TestDate = Convert.ToDateTime("01/01/1900 12:00:00.000");
                GlobalVariables.ComputerName = "";
                GlobalVariables.TestDescription = "";
                GlobalVariables.SQLIOCommandLine = "";
                GlobalVariables.ParamFile = "";
                GlobalVariables.RunTime = 0;
                GlobalVariables.CoolOff = 0;
                GlobalVariables.NumberOfFiles = 0;
                GlobalVariables.TestFiles = "";
                GlobalVariables.FileSize = 0;
                GlobalVariables.NumberOfThreads = 0;
                GlobalVariables.IOOperation = "";
                GlobalVariables.IOSize = "";
                GlobalVariables.IOOutstanding = 0;
                GlobalVariables.IOType = "";
                GlobalVariables.IOSec = 0;
                GlobalVariables.MBSec = 0;
                GlobalVariables.MinLatency = 0;
                GlobalVariables.AvgLatency = 0;
                GlobalVariables.MaxLatency = 0;

                re.Close();
            }
            Console.WriteLine(sqlioData.Rows.Count);
            //CSV export
            if (GlobalVariables.CSVOutFIle != null)
            {
                Console.WriteLine("Exporting CVS to: " + GlobalVariables.CSVOutFIle);
                Console.WriteLine();
                try
                {
                    CreateCSVFile(sqlioData, GlobalVariables.CSVOutFIle);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }

            //sql bulk insert
            if (GlobalVariables.SQLServer != null && GlobalVariables.Database != null && GlobalVariables.TableName != null)
            {
                Console.WriteLine("Inserting into server " + GlobalVariables.SQLServer + " database " + GlobalVariables.Database + " table " + GlobalVariables.TableName + " using a trusted connection");
                Console.WriteLine();
                if (!GlobalVariables.TableName.Contains("."))
                {
                    GlobalVariables.TableName = "dbo." + GlobalVariables.TableName;
                }

                var bulkCopy = new SqlBulkCopy("Server=" + GlobalVariables.SQLServer + ";Database=" + GlobalVariables.Database + ";Trusted_Connection=True;",
                    SqlBulkCopyOptions.TableLock) {BatchSize = 10000, DestinationTableName = GlobalVariables.TableName};
                try
                {
                    bulkCopy.WriteToServer(sqlioData);// SQLIOData is a DataTable type
                }
                catch (Exception e)
                {
                    Console.WriteLine(GlobalVariables.TableName + " Failed to Import");
                    Console.WriteLine(e.Message);
                }
                finally
                {
                    bulkCopy.Close();
                }
            }

            Console.WriteLine("Complete");
        }
        static public void CreateCSVFile(DataTable dt, string strFilePath)
        {
            var sw = new StreamWriter(strFilePath, false);
            int iColCount = dt.Columns.Count;
            for (int i = 0; i < iColCount; i++)
            {
                sw.Write(dt.Columns[i]);
                if (i < iColCount - 1)
                {
                    sw.Write(",");
                }
            }
            sw.Write(sw.NewLine);
            foreach (DataRow dr in dt.Rows)
            {
                for (int i = 0; i < iColCount; i++)
                {
                    if (!Convert.IsDBNull(dr[i]))
                    {
                        sw.Write(dr[i].ToString());
                    }
                    if (i < iColCount - 1)
                    {
                        sw.Write(",");
                    }
                }
                sw.Write(sw.NewLine);
            }
            sw.Close();
        }

        static public int ParseCommandLine(string[] args)
        {
            bool showHelp = false;

            var p = new OptionSet
                        {
            { "c:|computername:", "The comptuer name that the test was executed on.",
              v => GlobalVariables.ComputerName = v },

              { "s:|sqlserver:", "The SQL Server you want to import the data into.",
              v => GlobalVariables.SQLServer = v },

              { "u:|sqluser:", "If using SQL Server authentication specify a user",
              v => GlobalVariables.SQLServerUser = v},

              { "p:|sqlpass:", "If using SQL Server authentication specify a password",
              v => GlobalVariables.SQLServerPassword = v},

              { "t:|tablename:", "The table you want to import the data into.",
              v => GlobalVariables.TableName = v },

              { "d:|databasename:", "The database you want to import the data into.",
              v => GlobalVariables.Database = v },

              { "f:|sqliofilename:", "The file name you want to import the data from.",
              v => GlobalVariables.SQLIOFileName = v},

              { "a:|sqliofiledirectory:", "The directory containing the files you want to import the data from.",
              v => GlobalVariables.SQLIODirectoryName = v},

              { "o:|csvoutputfilename:", "The file name you want to export the data to.",
              v => GlobalVariables.CSVOutFIle = v },

              { "?|h|help",  "show this message and exit", 
              v => showHelp = v != null },
            };

            try
            {
                p.Parse(args);
            }

            catch (OptionException e)
            {
                Console.Write("SQLIOParse Error: ");
                Console.WriteLine(e.Message);
                Console.WriteLine("Try `SQLIOParse --help' for more information.");
                return 1;
            }

            if (args.Length == 0)
            {
                ShowHelp("Error: please specify some commands....", p);
                return 1;
            }

            if (GlobalVariables.SQLIOFileName == null && GlobalVariables.SQLIODirectoryName == null && !showHelp)
            {
                ShowHelp("Error: You must specify a file to import (-f) or a directory to import (-a).", p);
                return 1;
            }  

            if (showHelp)
            {
                ShowHelp(p);
                return 1;
            }
            return 0;
        }

        static void ShowHelp(string message, OptionSet p)
        {
            Console.WriteLine(message);
            Console.WriteLine("Usage: SQLIOParser [OPTIONS]");
            Console.WriteLine("Process output of the SQLIO.exe program piped to a text file.");
            Console.WriteLine();
            Console.WriteLine("Options:");
            p.WriteOptionDescriptions(Console.Out);
        }

        static void ShowHelp(OptionSet p)
        {
            Console.WriteLine("Usage: SQLIOParser [OPTIONS]");
            Console.WriteLine("Process output of the SQLIO.exe program piped to a text file.");
            Console.WriteLine();
            Console.WriteLine("Options:");
            p.WriteOptionDescriptions(Console.Out);
        }

        static bool FileInUse(string path)
        {
            string message;
            try
            {
                //Just opening the file as open/create
#pragma warning disable 168
                using (var fs = new FileStream(path, FileMode.OpenOrCreate))
#pragma warning restore 168
                {
                    //If required we can check for read/write by using fs.CanRead or fs.CanWrite
                }
                return false;
            }
            catch (IOException ex)
            {
                //check if message is for a File IO
                message = ex.Message;
                if (message.Contains("The process cannot access the file"))
                    return true;
                throw;
            }
        }
    }

    public static class GlobalVariables
    {
        public static string ComputerName { get; set; }                 //name of machine the test was executed on
        public static string TestDescription { get; set; }              //a short description of the test that was executed
        public static string SQLIOCommandLine { get; set; }             //a short description of the test that was executed
        public static string ParamFile { get; set; }                    //the parameter file that was used path only.
        public static DateTime TestDate { get; set; }                   //time from file create
        public static Int32 RunTime { get; set; }                       //how long each test runs
        public static Int32 CoolOff { get; set; }                       //cool off period between test to allow IO to settle down.
        public static Int32 NumberOfFiles { get; set; }                 //number of files in test run.
        public static string TestFiles { get; set; }                    //List of files used in test if passed in from command line
        public static Int32 FileSize { get; set; }                      //size of the files
        public static Int32 NumberOfThreads { get; set; }               //number of threads.
        public static string IOSize { get; set; }                       //size of the IO block
        public static Int32 IOOutstanding { get; set; }                 //queue depth
        public static string IOType { get; set; }                       //sequential or random
        public static string IOOperation { get; set; }                  //read or write
        public static decimal IOSec { get; set; }                       //io's a second
        public static decimal MBSec { get; set; }                       //megabytes a second
        public static Int32 MinLatency { get; set; }                    //latency in milliseconds
        public static Int32 AvgLatency { get; set; }                    //latency in milliseconds
        public static Int32 MaxLatency { get; set; }                    //latency in milliseconds
        public static string SQLServer { get; set; }                    //target server
        public static string SQLServerUser { get; set; }                //sql user
        public static string SQLServerPassword { get; set; }            //target server
        public static string Database { get; set; }                     //target database
        public static string TableName { get; set; }                    //table you want to insert into
        public static string SQLIOFileName { get; set; }                //File to import
        public static string SQLIODirectoryName { get; set; }           //directory to import
        public static string CSVOutFIle { get; set; }                   //File to export
    }
}
