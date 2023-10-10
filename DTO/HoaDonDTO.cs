using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public  class HoaDonDTO
    {
        public int MaHoaDon { get; set; }
        public int TenKhachHang { get; set;}
        public int GioiTinh { get; set; }
        public int DiaChi { get; set; }
        public int Email { get; set; }
        public int SoDienThoai { get;set;}
        public int TongGia { get;set;}

        public List<ChiTietHoaDonModel> list_json_chitiethoadon { get; set; }
    }

    public class ChiTietHoaDonModel
    {
        public int MaChiTietHoaDon { get; set; }
        public int MaHoaDon { get; set; }
        public int MaHang { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien { get; set; }
        public int status { get; set; }
    }

}
