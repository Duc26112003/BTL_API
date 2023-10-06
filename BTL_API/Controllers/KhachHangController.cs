using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BLL;
using DTO;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Runtime.InteropServices;
using System.Security.Cryptography;

namespace BTL_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhachHangController : ControllerBase
    {
        private IKhachHangBLL _khachHangBLL;
        public KhachHangController(IKhachHangBLL khachBLL)
        {
            _khachHangBLL = khachBLL;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public IActionResult GetDatabyID(string id)
        {
            var khachHang = _khachHangBLL.GetDatabyID(id);
            if (khachHang == null)
            {
                return NotFound("Khách hàng không tồn tại"); // Trả về 404 Not Found nếu không tìm thấy khách hàng
            }
            return Ok(khachHang);
        }
        [Route("create-khach")]
        [HttpPost]
        public IActionResult CreateItem([FromBody] KhachHangDTO model)
        {
            _khachHangBLL.Create(model);
            return Ok(model);
        }

        [Route("update-khach")]
        [HttpPut]
        public IActionResult UpdateItem([FromBody] KhachHangDTO model)
        {
            _khachHangBLL.Update(model);
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
                string ten_khach = null;
                if (formData.Keys.Contains("ten_khach") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_khach"]))) 
                { 
                    ten_khach = Convert.ToString(formData["ten_khach"]);
                }
                string dia_chi = null;
                if (formData.Keys.Contains("dia_chi") && !string.IsNullOrEmpty(Convert.ToString(formData["dia_chi"]))) 
                { 
                    dia_chi = Convert.ToString(formData["dia_chi"]); 
                }
                long total = 0;
                var data = _khachHangBLL.Search(pageIndex, pageSize, out total, ten_khach, dia_chi);
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
        [Route("delete-khach")]
        [HttpDelete]
        public IActionResult DeleteItem(string MaKhachHang)
        {
            _khachHangBLL.Delete(MaKhachHang);
            return Ok(MaKhachHang);
        }


    }
}

