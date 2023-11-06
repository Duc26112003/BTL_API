using DAL;
using DAL.Interfaces;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class NhanVienBLL:INhanVienBLL
    {
        private INhanVienRepository _res;
        public NhanVienBLL(INhanVienRepository res)
        {
            _res = res;
        }
        public NhanVienDTO GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public List<NhanVienDTO> GetData()
        {
            return _res.GetData();
        }
        public bool Create(NhanVienDTO model)
        {
            return _res.Create(model);
        }
        public bool Delete(string MaNhanVien)
        {
            return _res.Delete(MaNhanVien);
        }
        public bool Update(NhanVienDTO model)
        {
            return _res.Update(model);
        }
        public List<NhanVienDTO> Search(int pageIndex, int pageSize, out long total, string ten_nhanvien, string dia_chi)
        {
            return _res.Search(pageIndex, pageSize, out total, ten_nhanvien, dia_chi);
        }
    }
}
