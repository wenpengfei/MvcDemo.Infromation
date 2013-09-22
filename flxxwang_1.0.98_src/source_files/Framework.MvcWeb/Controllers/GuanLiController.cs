using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infomation.Core;
using System.Linq.Expressions;
using Framework.Extensions;
using Infomation.Core.Manage;
using Infomation.Core.Mvc;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    public class GuanLiController : Controller
    {
        //
        // GET: /GuanLi/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UpdateKeyword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UpdateKeyword(FormCollection collection)
        {
            KeywordStatUpdate update = new KeywordStatUpdate();
            update.Update();

            ViewData["Success"] = true;
            return View();
        }


        //
        // GET: /GuanLi/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /GuanLi/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /GuanLi/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /GuanLi/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /GuanLi/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /GuanLi/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /GuanLi/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
