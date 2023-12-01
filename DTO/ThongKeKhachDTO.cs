using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ThongKeKhachDTO
    {
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public int SoLuong { get; set; }
        public int TongGia { get; set; }
        public DateTime NgayTao { get; set; }
        public string TenKhachHang { get; set; }
        public string Diachi { get; set; }
    }
}
