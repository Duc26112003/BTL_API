using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class ImageRepository
    {
        private readonly string _connectionString;

        public ImageRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public void SaveImage(ImageDTO image)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (var command = new SqlCommand("INSERT INTO Images (FileName, FilePath) VALUES (@FileName, @FilePath)", connection))
                {
                    command.Parameters.AddWithValue("@FileName", image.FileName);
                    command.Parameters.AddWithValue("@FilePath", image.FilePath);
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
