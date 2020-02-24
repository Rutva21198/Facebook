using Microsoft.Extensions.DependencyInjection;
using FacebookProjectRxWeb.Infrastructure.Singleton;
using FacebookProjectRxWeb.BoundedContext.Singleton;
using RxWeb.Core.Data;

namespace FacebookProjectRxWeb.Api.Bootstrap
{
    public static class Singleton
    {
        public static void AddSingletonService(this IServiceCollection serviceCollection)
        {
            #region Singleton
            serviceCollection.AddSingleton<ITenantDbConnectionInfo, TenantDbConnectionInfo>();
            serviceCollection.AddSingleton(typeof(UserAccessConfigInfo));
            #endregion Singleton
        }

    }
}




