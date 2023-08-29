using System.Web;
using System.Web.Optimization;

namespace QLBanVePhim
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));
            //jquery site
            bundles.Add(new ScriptBundle("~/bundles/jquerysite").Include(
                       "~/Scripts/external/jquery-migrate-1.2.1.js",
                       "~/Scripts/bootstrap.js",
                       "~/Scripts/jquery.themepunch.plugins.js",
                       "~/Scripts/jquery.themepunch.revolution.js",
                       "~/Scripts/jquery.mobile.menu.js",
                       "~/Scripts/external/jquery.selectbox-0.2.js",
                       "~/Scripts/external/jquery.raty.js",
                       "~/Scripts/external/form-element.js",
                       "~/Scripts/form.js",
                       "~/Scripts/custom.js"
            ));

            bundles.Add(new ScriptBundle("~/bundles/jqhtml5").Include("~/Scripts/html5shiv.js",
                       "~/Scripts/respond.js"
            ));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.unobtrusive*",
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new StyleBundle("~/Content/csssite").Include(
                    "~/Content/gozha-nav.css",
                    "~/Content/external/jquery.selectbox.css",
                    "~/Content/settings.css",
                    "~/Content/style3860.css"
                ));
            
            bundles.Add(new StyleBundle("~/Content/themes/base/css").Include(
                        "~/Content/themes/base/jquery.ui.core.css",
                        "~/Content/themes/base/jquery.ui.resizable.css",
                        "~/Content/themes/base/jquery.ui.selectable.css",
                        "~/Content/themes/base/jquery.ui.accordion.css",
                        "~/Content/themes/base/jquery.ui.autocomplete.css",
                        "~/Content/themes/base/jquery.ui.button.css",
                        "~/Content/themes/base/jquery.ui.dialog.css",
                        "~/Content/themes/base/jquery.ui.slider.css",
                        "~/Content/themes/base/jquery.ui.tabs.css",
                        "~/Content/themes/base/jquery.ui.datepicker.css",
                        "~/Content/themes/base/jquery.ui.progressbar.css",
                        "~/Content/themes/base/jquery.ui.theme.css"));
        }
    }
}