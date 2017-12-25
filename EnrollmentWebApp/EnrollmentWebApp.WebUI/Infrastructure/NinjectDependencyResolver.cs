using EnrollmentWebApp.Domain;
using EnrollmentWebApp.Domain.Abstract;
using EnrollmentWebApp.Domain.Concrete;
using EnrollmentWebApp.Domain.Entities;
using Moq;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EnrollmentWebApp.WebUI.Infrastructure
{
    public class NinjectDependencyResolver : IDependencyResolver
    {
        private IKernel kernel;
        public NinjectDependencyResolver(IKernel kernelParam)
        {
            kernel = kernelParam;
            AddBindings();
        }
        public object GetService(Type serviceType)
        {
            return kernel.TryGet(serviceType);
        }
        public IEnumerable<object> GetServices(Type serviceType)
        {
            return kernel.GetAll(serviceType);
        }
        private void AddBindings()
        {
            /*Mock<IDataRepository> mock = new Mock<IDataRepository>();
            mock.Setup(m => m.Enrollees).Returns(new List<Enrollee> {
                new Enrollee { Name = "Pavel", Surname = "Katskel"},
                new Enrollee {Name = "Victoria", Surname = "Kononchuk" }
            });*/
            //kernel.Bind<IDataRepository>().ToConstant(mock.Object);
            kernel.Bind<IDataRepository>().To<EFDataRepository>();
        }
    }
}