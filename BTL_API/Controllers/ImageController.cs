using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DTO;
using BLL;

namespace BTL_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImageController : ControllerBase
    {
        private readonly ImageBLL _imageBLL;

        public ImageController(string connectionString)
        {
            _imageBLL = new ImageBLL(connectionString);
        }

        [HttpPost("upload")]
        public IActionResult Upload([FromForm] IFormFile file)
        {
            if (file == null || file.Length == 0)
            {
                return BadRequest("Không có file nào được chọn.");
            }

            var imageDTO = new ImageDTO
            {
                FileName = file.FileName,
                FilePath = Path.Combine("uploads", file.FileName)
            };

            using (var stream = new FileStream(imageDTO.FilePath, FileMode.Create))
            {
                file.CopyTo(stream);
            }

            _imageBLL.SaveImage(imageDTO);

            return Ok("File đã được upload và lưu vào cơ sở dữ liệu thành công.");
        }
    }
}

