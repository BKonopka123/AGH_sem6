using System;

namespace lab7
{
    public partial class LabCLR
    {
        public DateTime GetSystemTime()
        {
            DateTime currentTime = DateTime.Now;
            return currentTime;
        }

        public static string GenerateGreeting(string login, string systemName)
        {
            string todayDate = DateTime.Now.ToString("yyyy-MM-dd");
            string serverName = Environment.MachineName;
            return $"Witaj: {login}, dzisiaj jest: {todayDate}, pracujesz na serwerze {serverName} w systemie {systemName}.";
        }

    };
}

