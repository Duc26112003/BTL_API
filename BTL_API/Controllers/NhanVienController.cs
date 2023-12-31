﻿using BLL;
using DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BTL_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhanVienController : ControllerBase
    {
        private INhanVienBLL _nhanvienBLL;
        public NhanVienController(INhanVienBLL nhanvienBLL)
        {
            _nhanvienBLL = nhanvienBLL;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public IActionResult GetDatabyID(string id)
        {
            var NhanVien = _nhanvienBLL.GetDatabyID(id);
            if (NhanVien == null)
            {
                return NotFound("Nhân viên không tồn tại"); // Trả về 404 Not Found nếu không tìm thấy khách hàng
            }
            return Ok(NhanVien);
        }
        [Route("create-nhan-vien")]
        [HttpPost]
        public IActionResult CreateItem([FromBody] NhanVienDTO model)
        {
            _nhanvienBLL.Create(model);
            return Ok(model);
        }

        [Route("update-nhan-vien")]
        [HttpPut]
        public IActionResult UpdateItem([FromBody] NhanVienDTO model)
        {
            _nhanvienBLL.Update(model);
            return Ok(model);
        }
        [Route("search")]
        [HttpPost]

        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var pageIndex = int.Parse(formData["pageIndex"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string ten_nhanvien = null;
                if (formData.Keys.Contains("ten_nhanvien") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_nhanvien"])))
                {
                    ten_nhanvien = Convert.ToString(formData["ten_nhanvien"]);
                }
                string dia_chi = null;
                if (formData.Keys.Contains("dia_chi") && !string.IsNullOrEmpty(Convert.ToString(formData["dia_chi"])))
                {
                    dia_chi = Convert.ToString(formData["dia_chi"]);
                }
                long total = 0;
                var data = _nhanvienBLL.Search(pageIndex, pageSize, out total, ten_nhanvien, dia_chi);
                return Ok(
                    new
                    {
                        TotalItems = total,
                        Data = data,
                        Page = pageIndex,
                        PageSize = pageSize
                    }
                    );
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [Route("delete-nhan-vien")]
        [HttpDelete]
        public IActionResult DeleteItem(string MaNhanVien)
        {
            _nhanvienBLL.Delete(MaNhanVien);
            return Ok(MaNhanVien);
        }
        [Route("get-all-nhanvien")]
        [HttpGet]
        public IActionResult GetAllNhanVien()
        {
            var allKhachHang = _nhanvienBLL.GetAllNhanVien();
            return Ok(allKhachHang);
        }



    }
}

