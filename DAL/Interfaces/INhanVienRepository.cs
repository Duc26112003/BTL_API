﻿using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface INhanVienRepository
    {
        NhanVienDTO GetDatabyID(string id);
        bool Create(NhanVienDTO model);
        bool Update(NhanVienDTO model);
        bool Delete(string MaNhanVien);

        
        List<NhanVienDTO> GetAllNhanVien();
        public List<NhanVienDTO> Search(int pageIndex, int pageSize, out long total, string ten_khach, string dia_chi);

    }
}
