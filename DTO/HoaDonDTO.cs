using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class HoaDonDTO
    {
        public int MaHoaDon { get; set; }
        public int TongGia { get; set; }
        public DateTime NgayTao { get; set; }
        public DateTime NgayDuyet { get; set; }
        public string TenKhachHang { get; set; }
        public bool GioiTinh { get; set; }
        public string Diachi { get; set; }
        public string SoDienThoai { get; set; }
        public bool TrangThai { get; set; }
        public List<ChiTietHoaDonDTO> list_json_chitiethoadon { get; set; }
    }
    public class ChiTietHoaDonDTO
    {
        public int MaChiTietHoaDon { get; set; }
        public int MaHoaDon { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public int TongGia { get; set; }
        public int status { get; set; }
    }
}
