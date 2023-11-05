using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace DAL
{
    public class NhanVienRespository
    {
        public class NhanVienRepository : INhanVienRepository
        {
            private IDatabaseHelper _dbHelper;
            public NhanVienRepository(IDatabaseHelper dbHelper)
            {
                _dbHelper = dbHelper;
            }

            public NhanVienDTO GetDatabyID(string id)
            {
                string msgError = "";
                try
                {
                    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_getkh",
                         "@MaKhachHang", id);
                    if (!string.IsNullOrEmpty(msgError))
                        throw new Exception(msgError);
                    return dt.ConvertTo<NhanVienDTO>().FirstOrDefault();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            public List<NhanVienDTO> GetAllKhachHang()
            {
                string msgError = "";
                try
                {
                    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_GetAllKhachHang");
                    if (!string.IsNullOrEmpty(msgError))
                        throw new Exception(msgError);
                    return (List<NhanVienDTO>)dt.ConvertTo<NhanVienDTO>();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            public bool Create(NhanVienDTO model)
            {
                string msgError = "";
                try
                {
                    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "Proc_themkh",
                    "@MaNhanVien", model.MaNhanVien,
                    "@TenNhanVien", model.TenNhanVien,
                    "@GioiTinh", model.GioiTinh,
                    "@DiaChi", model.DiaChi,
                    "@SoDienThoai", model.SoDienThoai);
                    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                    {
                        throw new Exception(Convert.ToString(result) + msgError);
                    }
                    return true;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            public bool Update(NhanVienDTO model)
            {
                string msgError = "";
                try
                {
                    var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "Proc_suakh",
                    "@MaNhanVien", model.MaNhanVien,
                    "@TenNhanVien", model.TenNhanVien,
                    "@GioiTinh", model.GioiTinh,
                    "@DiaChi", model.DiaChi,
                    "@SoDienThoai", model.SoDienThoai);
                    if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                    {
                        throw new Exception(Convert.ToString(result) + msgError);
                    }
                    return true;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            public List<NhanVienDTO> Search(int pageIndex, int pageSize, out long total, string ten_khach, string dia_chi)
            {
                string msgError = "";
                total = 0;
                try
                {
                    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_KhachHang",
                        "@page_index ", pageIndex,
                        "@page_size ", pageSize,
                        "@ten_khach", ten_khach,
                        "@dia_chi", dia_chi);
                    if (!string.IsNullOrEmpty(msgError))
                        throw new Exception(msgError);
                    if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                    return dt.ConvertTo<NhanVienDTO>().ToList();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            public bool Delete(string MaKhachHang)
            {
                string msgError = "";
                bool kq; // Khởi tạo mặc định là false
                try
                {
                    var result = _dbHelper.ExecuteScalarSProcedure(out msgError, "Proc_xoakh",
                         "@MaKhachHang", MaKhachHang);
                    // Kiểm tra kết quả trả về từ hàm ExecuteScalarSProcedureWithTransaction
                    if (Convert.ToInt32(result) > 0)
                    {
                        kq = true; // Xóa thành công, đặt kq thành true
                    }
                    else
                    {
                        kq = false;
                    }
                    return kq;
                }
                catch (Exception ex)
                {
                    throw ex;
                }

            }

            public List<NhanVienDTO> GetData()
            {
                string msgError = "";
                try
                {
                    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_GetAllKhachHang");
                    if (!string.IsNullOrEmpty(msgError))
                        throw new Exception(msgError);
                    return (List<NhanVienDTO>)dt.ConvertTo<NhanVienDTO>();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }



        }
    }
}
