using DAL;
using DTO;


namespace BLL
{
    public class SlideBLL : ISlideBLL
    {
        private  ISlideRepository _res;

        public SlideBLL(ISlideRepository res)
        {
            _res = res;
        }

        public List<SlideDTO> GetSlides()
        {
            return _res.GetSlides();
        }
    }
}


