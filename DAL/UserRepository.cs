using DAL.Interfaces;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
        public class UserRepository : IUserRepository
        {
            private IDatabaseHelper _dbHelper;
            public UserRepository(IDatabaseHelper dbHelper)
            {
                _dbHelper = dbHelper;
            }
            public UserDTO Login(string taikhoan, string matkhau)
            {
                string msgError = "";
                try
                {
                    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_login",
                         "@taikhoan", taikhoan,
                         "@matkhau", matkhau
                         );
                    if (!string.IsNullOrEmpty(msgError))
                        throw new Exception(msgError);
                    return dt.ConvertTo<UserDTO>().FirstOrDefault();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    
}
