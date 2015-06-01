using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

   public class LogUtil
    {
       private static StreamWriter streamWriter;
       public static void setStreamWriter(StreamWriter sw) {
           streamWriter = sw;
       }
        public static void log(StreamWriter sw,string content) {
            sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+" "+content);
        }
        public static void log( string content)
        {
            streamWriter.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " " + content);
        }
    }
