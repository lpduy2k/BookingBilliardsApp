using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Firebase.Storage;
using Firebase.Auth;

namespace Api.Controllers
{
    public class UploadController : BaseApiController
    {
        private static string ApiKey = "AIzaSyAkj1296LoqVythqrggObyc-jdzgfnkifo";
        private static string Bucket = "bookingbilliardsapp.appspot.com";
        private static string AuthEmail = "voquochuy@gmail.com";
        private static string AuthPassword = "huyvippro123";

        private readonly IWebHostEnvironment _webHostEnvironment;
        public UploadController(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        [HttpPost]
        public async Task<ActionResult> Post(IFormFile file)
        {
            var auth = new FirebaseAuthProvider(new FirebaseConfig(ApiKey));
            var a = await auth.SignInWithEmailAndPasswordAsync(AuthEmail, AuthPassword);

            string fileName = DateTime.Now.Subtract(new DateTime(1970, 1, 1)).TotalMilliseconds + ".jpg";
            var stream = file.OpenReadStream();

            var task = new FirebaseStorage(Bucket, new FirebaseStorageOptions
            {
                AuthTokenAsyncFactory = () => Task.FromResult(a.FirebaseToken),
            })
                .Child("images")
                .Child(fileName)
                .PutAsync(stream);

            try
            {
                string link = await task;
                return Ok(new { urlImage = link });
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

    }
}
