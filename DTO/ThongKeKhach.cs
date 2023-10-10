using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public  class ThongKeKhach
    {
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public int SoLuong { get; set; }
        public Decimal TongGia { get; set; }
        public string TenKhachHang { get; set; }
        public string Diachi { get; set; }
    }
}
