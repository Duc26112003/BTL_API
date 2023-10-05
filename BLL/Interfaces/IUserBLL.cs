using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace BLL.Interfaces
{
    public partial interface IUserBLL
    {
        UserDTO Login(string taikhoan, string matkhau);
    }
}
