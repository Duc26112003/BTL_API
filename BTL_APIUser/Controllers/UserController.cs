using DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BLL;
using DAL;


namespace BTL_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private IUserBLL _userBLL;

        public UserController(IUserBLL userBLL)
        {
            this._userBLL = userBLL;
        }

        private IUserRepository userBLL;          
            [AllowAnonymous]
            [HttpPost("login")]
            public IActionResult Login([FromBody] AuthenticateDTO model)
            {
                var user = _userBLL.Login(model.Username, model.Password);
                if (user == null)
                    return BadRequest(new { message = "Tài khoản hoặc mật khẩu không đúng!" });
                return Ok(new { taikhoan = user.TenTaiKhoan, email = user.Email, Token = user.token });
            }
        
    }
}
    