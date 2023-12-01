
using DAL;
using DTO;

namespace BLL
{
    public class ImageBLL : IImageBLL
    {
        private readonly ImageRepository _imageDAL;

        public ImageBLL(string connectionString)
        {
            _imageDAL = new ImageRepository(connectionString);
        }

        public void SaveImage(ImageDTO image)
        {
            _imageDAL.SaveImage(image);
        }

        public string SaveImage(string FileName, string FilePath)
        {
            throw new NotImplementedException();
        }
    }
}
