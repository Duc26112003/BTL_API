using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace BLL
{
    public partial interface IImageBLL
    {
        string SaveImage(string FileName, string FilePath);
    }
}
