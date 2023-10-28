using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public partial interface ISanPhamBLL
    {
        SanPhamDTO GetDatabyID(string id);
        List<SanPhamDTO> GetTenHang(string TenHang);

        bool Create(SanPhamDTO model);
        bool Update(SanPhamDTO model);

        bool Delete(string  MaSanPham);

        List<SanPhamDTO> GetData();

        List<SanPhamDTO> GetSanPhamBanChay(int top);
        public List<SanPhamDTO> Search(int pageIndex, int pageSize, out long total, string ten_hang );
        
    }
}
