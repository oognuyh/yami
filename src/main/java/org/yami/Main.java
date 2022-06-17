package org.yami;

import java.io.File;

import org.apache.catalina.LifecycleException;
import org.apache.catalina.WebResourceRoot;
import org.apache.catalina.core.StandardContext;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;
import org.apache.tomcat.util.scan.StandardJarScanner;

public class Main {
    
    private static final String PORT = "8888";

    private static final String CONTEXT_PATH = "/yami";
  
    public static void main(String[] args) throws LifecycleException {
      Tomcat tomcat = new Tomcat();
      String webappDirLocation = "src/main/webapp/";
      String webPort = System.getenv("PORT");
      if (webPort == null || webPort.isEmpty()) {
        webPort = PORT;
      }

      StandardContext context =
          (StandardContext)
              tomcat.addWebapp(CONTEXT_PATH, new File(webappDirLocation).getAbsolutePath());
      File additionWebInfClasses = new File("target/classes");
      WebResourceRoot resources = new StandardRoot(context);
  
      ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
      
      context.setParentClassLoader(classLoader);

      resources.addPreResources(
          new DirResourceSet(
              resources, "/WEB-INF/classes", additionWebInfClasses.getAbsolutePath(), "/"));
      context.setResources(resources);
      //context.setReloadable(true);
      ((StandardJarScanner) context.getJarScanner()).setScanManifest(false);
  
      tomcat.setPort(Integer.valueOf(webPort));
      tomcat.start();
      tomcat.getServer().await();
    }
}
