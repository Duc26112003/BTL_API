using BLL;
using DAL;
using DTO;
using System.Reflection;

namespace BLL
{
    public class SanPhamBLL:ISanPhamBLL
    {
        private ISanPhamRepository _res;
        public SanPhamBLL(ISanPhamRepository res)
        {
            _res = res;
        }
         
        public SanPhamDTO GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public List<SanPhamDTO> GetTenHang(string TenHang)
        {
            return _res.GetTenHang(TenHang);
        }

        public List<SanPhamDTO> GetData()
        {
            return _res.GetData();
        }
        public List<SanPhamDTO> GetSanPhamBanChay(int top)
        {
            return _res.GetSanPhamBanChay(top);
        }
        public bool Create(SanPhamDTO model)
        {
            return _res.Create(model);
        }
        public bool Update(SanPhamDTO model)
        {
            return _res.Update(model);
        }
        public bool Delete(string  MaSanPham)
        {
            return _res.Delete( MaSanPham);
        }
        
        public List<SanPhamDTO> Search(int pageIndex, int pageSize, out long total, string ten_sanpham)
        {
            return _res.Search(pageIndex, pageSize, out total, ten_sanpham);
        }

        
    }
}