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


    }
}