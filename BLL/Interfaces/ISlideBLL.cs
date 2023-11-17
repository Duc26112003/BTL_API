using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public partial interface ISlideBLL
    {
        List<SlideDTO> GetSlides();
    }
}
