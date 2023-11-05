using BLL;
using DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BTL_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBLL _sanphamBusiness;
        public SanPhamController(ISanPhamBLL sanphamBusiness)
        {
            _sanphamBusiness = sanphamBusiness;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public SanPhamDTO GetDatabyID(string id)
        {
            return _sanphamBusiness.GetDatabyID(id);
        }
        [Route("get-by-TenSanPham/{TenSanPham}")]
        [HttpGet]
        public List<SanPhamDTO> GetTenHang(string TenSanPham) 
        {
            return _sanphamBusiness.GetTenHang(TenSanPham);
        }


        [Route("create-sanpham")]
        [HttpPost]
        public SanPhamDTO CreateItem([FromBody] SanPhamDTO model)
        {
            _sanphamBusiness.Create(model);
            return model;
        }
        [Route("update-sanpham")]
        [HttpPost]
        public SanPhamDTO Update([FromBody] SanPhamDTO model)
        {
            _sanphamBusiness.Update(model);
            return model;
        }

        [Route("search-sanpham")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var pageIndex = int.Parse(formData["pageIndex"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string ten_sanpham = null;
                if (formData.Keys.Contains("ten_sanpham") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_sanpham"])))
                {
                    ten_sanpham = Convert.ToString(formData["ten_sanpham"]);
                }
                long total = 0;
                var data = _sanphamBusiness.Search(pageIndex, pageSize, out total, ten_sanpham);
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
        [Route("delete-sanpham")]
        [HttpDelete]
        public IActionResult DeleteItem(string MaSanPham)
        {
            _sanphamBusiness.Delete(MaSanPham);
            return Ok(MaSanPham);
        }

        [Route("get-all-sanpham")]
        [HttpGet]
        public IActionResult GetAllSanPham()
        {
            var allSanPham = _sanphamBusiness.GetData();
            return Ok(allSanPham);
        }

        

    }
}

