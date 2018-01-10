using EnrollmentWebApp.Domain.Abstract;
using EnrollmentWebApp.Domain.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EnrollmentWebApp.WebUI.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        private IDataRepository repository;
        public AdminController(IDataRepository dataRepository)
        {
            repository = dataRepository;
        }

        public ViewResult Index()
        {
            return View(repository.Enrollees);
        }

        public ViewResult Edit(int enrolleeId)
        {
            Enrollee enrollee = repository.Enrollees.FirstOrDefault(p => p.EnrolleeId == enrolleeId);
            return View(enrollee);
        }

        [HttpPost]
        public JsonResult LoadNode(int id)
        {
            var parentsId = repository.TreeNodes.Select(x => x.ParentId);
            var result = repository.TreeNodes.Where(x => x.ParentId == id)
                .Select(x => new {
                    Id = x.Id,
                    Title = x.Title + 
                    (parentsId.Where(y => y == x.Id).Count() == 0 ? "" :
                    "(" + parentsId.Where(y => y == x.Id).Count() + ")"),
                    isFolder = parentsId.Contains(x.Id)}).ToList();
            System.Threading.Thread.Sleep(500);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult LoadFaculties()
        {
            var result = repository.Faculties.Select(x => new  {key = x.FacultyId, value = x.Name}).ToList();
            System.Threading.Thread.Sleep(500);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult LoadSpecialities(int value)
        {
            var result = repository.Specialities.Where(x => x.FacultyId == value).Select(x => new
            {
                key = x.SpecialityId,
                value = x.Name
            });
            System.Threading.Thread.Sleep(500);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Edit(Enrollee enrollee)
        {
            if (ModelState.IsValid)
            {
                repository.SaveEnrollee(enrollee);
                TempData["message"] = string.Format("{0} has been saved", enrollee.Name);
                return RedirectToAction("Index");
            }
            else
            {
                return View(enrollee);
            }
        }

        public ViewResult Create()
        {
            return View("Edit", new Enrollee());
        }

        [HttpPost]
        public ActionResult Delete(int enrolleeId)
        {
            Enrollee deletedProduct = repository.DeleteEnrollee(enrolleeId);
            if (deletedProduct != null)
            {
                TempData["message"] = string.Format("{0} was deleted",
                deletedProduct.Name);
            }
            return RedirectToAction("Index");
        }

    }
}