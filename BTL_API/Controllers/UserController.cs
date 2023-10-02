﻿using DAL.Interfaces;
using DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BLL;


namespace BTL_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
            private IUserRepository _userBusiness;
            public UserController(IUserBusiness userBusiness)
            {
                _userBusiness = userBusiness;
            }
            [AllowAnonymous]
            [HttpPost("login")]
            public IActionResult Login([FromBody] AuthenticateDTO model)
            {
                var user = _userBusiness.Login(model.Username, model.Password);
                if (user == null)
                    return BadRequest(new { message = "Tài khoản hoặc mật khẩu không đúng!" });
                return Ok(new { taikhoan = user.TenTaiKhoan, email = user.Email, token = user.token });
            }
        
    }
}
