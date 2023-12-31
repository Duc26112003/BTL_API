﻿using DAL;
using DTO;
using System.Data;

namespace DAL
{
    public class SanPhamRepository: ISanPhamRepository
    {
        private IDatabaseHelper _dbHelper;
        public SanPhamRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public SanPhamDTO GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_getsanpham",
                     "@MaSanPham", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamDTO>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPhamDTO> GetTenHang(string TenHang)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_getname",
                     "@TenSanPham", TenHang);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamDTO>().ToList<SanPhamDTO>();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(SanPhamDTO model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "Proc_themsanpham",
                "@TenSanPham", model.TenSanPham,
                "@MaLoaiHang", model.MaLoaiHang,
                "@SoLuong", model.SoLuong,
                "@MoTa", model.MoTa);
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

        public bool Update(SanPhamDTO model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "Proc_Suasp",
                "@MaSanPham", model.MaSanPham,
                "@TenSanPham", model.TenSanPham,
                "@MaLoaiHang", model.MaLoaiHang,
                "@SoLuong", model.SoLuong,
                "@MoTa", model.MoTa);
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

        public List<SanPhamDTO> Search(int pageIndex, int pageSize, out long total, string ten_sanpham)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_SanPham",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@ten_sanpham", ten_sanpham);

                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<SanPhamDTO>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Delete(string MaSanPham)
        {
            string msgError = "";
            bool kq; // Khởi tạo mặc định là false
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedure(out msgError, "Proc_xoasp",
                     "@MaSanPham", MaSanPham);
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
        public List<SanPhamDTO> GetData()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_GetAllSanPham");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return (List<SanPhamDTO>)dt.ConvertTo<SanPhamDTO>();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPhamDTO> GetMayTinhProc()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetMayTinhProc");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return (List<SanPhamDTO>)dt.ConvertTo<SanPhamDTO>();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPhamDTO> GetLaptopProc()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetLaptopProc");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return (List<SanPhamDTO>)dt.ConvertTo<SanPhamDTO>();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<SanPhamDTO> GetSanPhamBanChay(int top)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "Proc_getsanphambanchay","@top",top);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return (List<SanPhamDTO>)dt.ConvertTo<SanPhamDTO>();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
