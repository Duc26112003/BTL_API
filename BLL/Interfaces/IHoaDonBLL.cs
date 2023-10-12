using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public partial interface IHoaDonBLL
    {
        HoaDonDTO GetDatabyID(string id);
        bool Create(HoaDonDTO model);
        bool Update(HoaDonDTO model);
        public List<ThongKeKhachDTO> Search(int pageIndex, int pageSize, out long total, string ten_khach, DateTime? fr_NgayTao, DateTime? to_NgayTao);
    }
}
