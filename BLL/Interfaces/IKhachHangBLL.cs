using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{

    public partial interface IKhachHangBLL
    {
        KhachHangDTO GetDatabyID(string id);
        bool Create(KhachHangDTO model);
        bool Update(KhachHangDTO model);
        public List<KhachHangDTO> Search(int pageIndex, int pageSize, out long total, string ten_khach, string dia_chi);
        void Remove(KhachHangDTO obj);
        void SaveChanges();
    }
}
