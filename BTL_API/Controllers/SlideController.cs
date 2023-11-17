using BLL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BTL_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SlideController : ControllerBase
    {
        private ISlideBLL _slideBusiness;
        public SlideController(ISlideBLL slideBusiness)
        {
            _slideBusiness = slideBusiness;
        }
        [Route("get-all-slide")]
        [HttpGet]
        public IActionResult GetSlides()
        {
            var allSlide = _slideBusiness.GetSlides();
            return Ok(allSlide);
        }
    }
}
