using BLL;
using DAL;
using DTO;
using System.Reflection;

namespace BusinessLogicLayer
{
    public class HoaDonBusiness:IHoaDonBLL
    {
        private IHoaDonRepository _res;
        public HoaDonBusiness(IHoaDonRepository res)
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
        public List<ThongKeKhach> Search(int pageIndex, int pageSize, out long total, string ten_khach, DateTime? fr_NgayTao, DateTime? to_NgayTao)
        {
            return _res.Search(pageIndex, pageSize, out total, ten_khach, fr_NgayTao, to_NgayTao);
        }
    }
}