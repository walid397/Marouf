using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Marofh.Startup))]
namespace Marofh
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
