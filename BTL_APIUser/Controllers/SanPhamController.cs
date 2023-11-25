using Microsoft.AspNetCore.Mvc;
using BLL;
using DTO;


namespace BTL_APIUser.Controllers
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

        [Route("get-sanpham-banchay")]
        [HttpGet]
        public IActionResult GetSanPhamBanChay(int top)
        {
            var SanPhamBanChay = _sanphamBusiness.GetSanPhamBanChay(top);
            return Ok(SanPhamBanChay);
        }
        [Route("get-all-sanpham")]
        [HttpGet]
        public IActionResult GetAllSanPham()
        {
            var allSanPham = _sanphamBusiness.GetData();
            return Ok(allSanPham);
        }

        [Route("get-all-maytinh")]
        [HttpGet]
        public IActionResult GetMayTinhProc()
        {
            var allSanPham = _sanphamBusiness.GetMayTinhProc();
            return Ok(allSanPham);
        }

        [Route("get-all-laptop")]
        [HttpGet]
        public IActionResult GetLaptopProc()
        {
            var allSanPham = _sanphamBusiness.GetLaptopProc();
            return Ok(allSanPham);
        }

        [Route("get-by-TenSanPham/{TenSanPham}")]
        [HttpGet]
        public List<SanPhamDTO> GetTenHang(string TenSanPham)
        {
            return _sanphamBusiness.GetTenHang(TenSanPham);
        }

        [Route("get-by-id/{id}")]
        [HttpGet]
        public SanPhamDTO GetDatabyID(string id)
        {
            return _sanphamBusiness.GetDatabyID(id);
        }


        


    }
}