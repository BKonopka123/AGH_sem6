using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

class Program
{
    static void Main()
    {
        string connectionString = "DATA SOURCE=MSSQLServer; SERVER=WINSERV01;" + "INITIAL CATALOG=Lab6db; INTEGRATED SECURITY=SSPI;" + "USER ID=Lab6user; PASSWORD=Haslo123";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            Console.WriteLine("Connected to database.");

            InsertDataFromCSV(connection);

        }
    }

    static void InsertDataFromCSV(SqlConnection connection)
    {
        try
        {
            string studentCSVPath = "student.csv";
            using (StreamReader reader = new StreamReader(studentCSVPath))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string[] data = line.Split(',');
                    int id = int.Parse(data[0]);
                    string fname = data[1];
                    string lname = data[2];

                    SqlCommand command = new SqlCommand("INSERT INTO student (id, fname, lname) VALUES (@id, @fname, @lname)", connection);
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@fname", fname);
                    command.Parameters.AddWithValue("@lname", lname);
                    command.ExecuteNonQuery();
                }
            }

            Console.WriteLine("Data inserted into student table from CSV.");


        }
        catch (Exception ex)
        {
            Console.WriteLine("Error inserting data: " + ex.Message);
        }
    }

}