using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface IKhachRepository
    {
        KhachHangDTO GetDatabyID(string id);
        bool Create(KhachHangDTO model);
        bool Update(KhachHangDTO model);
        public List<KhachHangDTO> Search(int pageIndex, int pageSize, out long total, string ten_khach, string dia_chi);
    }
}
