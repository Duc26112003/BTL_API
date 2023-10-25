using BLL;
using DAL;
using DTO;
using System.Reflection;

namespace BLL
{
    public class HoaDonBLL: IHoaDonBLL
    {
        private IHoaDonRepository _res;
        public HoaDonBLL(IHoaDonRepository res)
        {
            _res = res;
        }
         
        public HoaDonDTO GetDatabyID(int id)
        {
            return _res.GetDatabyID(id);
        }
        public bool Create(HoaDonDTO model)
        {
            return _res.Create(model);
        }
        public bool Update(HoaDonDTO model)
        {
            return _res.Update(model); 
        }
        public bool Delete(string MaChiTietHoaDon)
        {
            return _res.Delete(MaChiTietHoaDon);
        }
        public List<ThongKeKhachDTO> Search(int pageIndex, int pageSize, out long total, string ten_khach, DateTime? fr_NgayTao, DateTime? to_NgayTao)
        {
            return _res.Search(pageIndex, pageSize, out total, ten_khach, fr_NgayTao, to_NgayTao);
        }
    }
}