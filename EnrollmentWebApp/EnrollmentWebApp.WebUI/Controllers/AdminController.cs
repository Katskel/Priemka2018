using EnrollmentWebApp.Domain.Abstract;
using EnrollmentWebApp.Domain.Entities;
using EnrollmentWebApp.WebUI.Infrastructure.HtmlHelpers;
using EnrollmentWebApp.WebUI.Models;
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
            Speciality speciality = repository.Specialities.First(x => x.Id == enrollee.SpecialityId);
            EnrolleeEditViewModel model = new EnrolleeEditViewModel() { enrollee = enrollee, speciality = speciality };
            return View(model);
        }

        [HttpPost]
        public JsonResult LoadNode(int id)
        {

            var parentsId = repository.TreeNodes.Select(x => x.ParentId);
            var specialityInfo = repository.SpecialityInfo;
            var nodes = repository.TreeNodes.Where(node => node.ParentId == id).Select(node => new {
                DataId = node.DataId,
                NodeId = node.NodeId
            });
            var result = nodes.Select(node => new {
                Id = node.NodeId,
                isFolder = parentsId.Contains(node.NodeId),
                Title = specialityInfo.First(x => x.Id == node.DataId).Name +
                (!parentsId.Contains(node.NodeId) ? "" :
                    " (" + parentsId.Where(y => y == node.NodeId).Count() + ")")
            });
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult LoadSelectData(int id)
        {
            var nodes = repository.TreeNodes.Where(node => node.ParentId == id).Select(node => new {
                DataId = node.DataId,
                NodeId = node.NodeId
            });
            var result = nodes.Select(node => new {
                key = node.NodeId,
                value = repository.SpecialityInfo.First(x => x.Id == node.DataId).Name
            });
            return Json(result.ToList(), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Edit(EnrolleeEditViewModel model)
        {
            var modelSpeciality = model.speciality;
            if (modelSpeciality.SpecialityId == -1 || modelSpeciality.UniversityId == -1 || modelSpeciality.FacultyId == -1)
                ModelState.AddModelError("", "Не выбрана специальность");
            else
            {
                var speciality = repository.Specialities.FirstOrDefault(x => x.Equals(modelSpeciality));
                if (speciality != null)
                {
                    model.enrollee.SpecialityId = speciality.Id;
                }
                else
                {
                    repository.AddSpeciality(modelSpeciality);
                    model.enrollee.SpecialityId = repository.Specialities.
                        FirstOrDefault(x => x.Equals(modelSpeciality)).Id;
                }
            }
            if (ModelState.IsValid)
            {
                repository.SaveEnrollee(model.enrollee);
                TempData["message"] = string.Format("{0} has been saved", model.enrollee.Surname);
                return RedirectToAction("Index");
            }
            else
            {
                return View(model);
            }
        }

        [HttpPost]
        public HtmlString LoadTreeCheckboxData(AjaxTreeDataModel[] model)
        {
            if (model == null)
            {
                var x = CreateEnrolleeTableHelper.CreateEnrolleeTable(null);
                return x;
            }
            else if ( model[0].Level == 0)
                return CreateEnrolleeTableHelper.CreateEnrolleeTable(repository.Enrollees.ToList());
            else
            {
                var firstLevel = model.Where(m => m.Level == 1).ToList().Select(m => m.Id);
                var first = repository.Specialities.Where(s => firstLevel.Contains(s.UniversityId));
                var secondLevel = model.Where(m => m.Level == 2).ToList().Select(m => m.Id);
                var second = repository.Specialities.Where(s => secondLevel.Contains(s.FacultyId));
                var thirdLevel = model.Where(m => m.Level == 3).ToList().Select(m => m.Id);
                var third = repository.Specialities.Where(s => thirdLevel.Contains(s.SpecialityId));
                var all = first.Concat(second).Concat(third).Select(a => a.Id);
                var result = repository.Enrollees.Where(en => all.Contains(en.SpecialityId));
                return CreateEnrolleeTableHelper.CreateEnrolleeTable(result.ToList());
            }
            

        }

        public ViewResult Create()
        {
            return View("Edit", new EnrolleeEditViewModel() {
                enrollee = new Enrollee(),
                speciality = new Speciality()
            });
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