﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using Microsoft.Owin.Security.OAuth;
using Newtonsoft.Json.Serialization;
using System.Web.Http.Routing;

namespace WebAPI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //    // Web API configuration and services
            //    // Configure Web API to use only bearer token authentication.
            //    config.SuppressDefaultHostAuthentication();
            //    config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));

            //    // Web API routes
            //    config.MapHttpAttributeRoutes();

            //    config.Routes.MapHttpRoute(
            //        name: "DefaultApi",
            //        routeTemplate: "api/{controller}/{id}",
            //        defaults: new { id = RouteParameter.Optional }
            //    );
            //}

            config.MapHttpAttributeRoutes();


            // D.G: removed "api/{controller}/{id}"
            // define route
            IHttpRoute defaultRoute = config.Routes.CreateRoute("{controller}/{id}",
                                                new { id = RouteParameter.Optional }, null);

            // Add route
            config.Routes.Add("DefaultApi", defaultRoute);
        }

    }
}
