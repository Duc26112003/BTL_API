using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data.SqlClient;


namespace DAL
{
    public class SlideRepository : ISlideRepository
    {
        private IDatabaseHelper _dbHelper;
        public SlideRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public List<SlideDTO> GetSlides()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetSlides");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return (List<SlideDTO>)dt.ConvertTo<SlideDTO>();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
