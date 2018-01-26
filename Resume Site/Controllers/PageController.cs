using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Resume_Site.Models;

namespace Resume_Site.Controllers
{
    public class PagesController : Controller
    {
        public IActionResult Resume()
        {
            return View();
        }

        public IActionResult Contact()
        {
            ViewData["EMail"] = "joe.andrew.campbell@gmail.com";
            ViewData["Phone"] = "608-558-8711";
            return View();

        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
