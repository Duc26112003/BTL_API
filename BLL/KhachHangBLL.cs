using DTO;
using DAL;
using BLL;
using DataAccessLayer;

namespace BLL
{
    public class KhachHangBLL:IKhachHangBLL
    {
        private IKhachRepository _res;
        public KhachHangBLL(IKhachRepository res)
        {
            _res = res;
        }
        public KhachHangDTO GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public bool Create(KhachHangDTO model)
        {
            return _res.Create(model);
        }
        public bool Update(KhachHangDTO model)
        {
            return _res.Update(model);
        }
        public List<KhachHangDTO> Search(int pageIndex, int pageSize, out long total, string ten_khach, string dia_chi)
        {
            return _res.Search(pageIndex, pageSize, out total, ten_khach, dia_chi);
        }
    }
}