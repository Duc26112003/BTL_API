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
        bool Create(SanPhamDTO model);
        bool Update(SanPhamDTO model);
        public List<SanPhamDTO> Search(int pageIndex, int pageSize, out long total, string ten_hang );
        
    }
}
