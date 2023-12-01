using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    internal class IImageRepository
    {
        public string ImageID { get; set; }
        public string FileName { get; set; }
        public int FilePath { get; set; }
    }
}
