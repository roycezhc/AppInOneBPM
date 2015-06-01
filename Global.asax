<%@ Application Language="C#" %>

<script runat="server">
    
    void Application_Start(object sender, EventArgs e)
    {
        try
        {
            AgileFrame.Core.ConsoleService.IsNeedWebConsole = true;
            AgileFrame.Core.ConsoleService.Fatal("bs控制台启动");
            AgileFrame.Core.MemCacheSerivce.IsEnabled = false;
            AgileFrame.Core.ConsoleService.IsNeedWebConsole = true;
            AgileFrame.Orm.PersistenceLayer.BLL.Base.BLLTable<AgileFrame.Orm.PersistenceLayer.Model.WF_FORMBASE>.Select(1);

             string z1 = AgileFrame.Orm.PersistenceLayer.Model.Ec_tab.Attribute.Tablabel.ZhName;
             z1.ToString();  
             z1 = AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST.Attribute.STATUS.ZhName;
             z1.ToString();
             z1 = AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST.Attribute.STATUS.Desc.getDesc();
             z1.ToString();

             int count1 = (FormHelper.GetListItem(AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST.Attribute.STATUS)).Count();
                     
            //AgileFrame.Orm.PersistenceLayer.Model.AttributeItem.ClearLanguageService();
        //    ////<add key="LanguageServiceSaveXml" value="true"/>
        //    if (!System.IO.File.Exists(Server.MapPath(@"./AFConfig.xml")))
        //    {
        //        Application["AFConfig.xml"] = 1;
        //        AgileFrame.Orm.PersistenceLayer.DAL.Base.Runtime_PersistenceLayer.RefreshRuntime_PersistenceLayer();
        //    }

        //    //string p0 = AppDomain.CurrentDomain.BaseDirectory;

        //    //string p1 = AgileFrame.Core.LanguageService.LangKeyFile.ToString();
        //    //object p2 = AgileFrame.Core.LanguageService.FileList;

            string prePath = HttpContext.Current.Request.ApplicationPath;
            if (prePath.Length > 1)
            {
                prePath = prePath.Substring(1);
                try
                {
                    if (prePath.Contains("shengyt.zhaowen"))
                    {
                    }
                    else if (prePath.Contains("zwt.zhaowen"))
                    {
                    }
                    else if (prePath.Contains("oa.zhaowen"))
                    {
                    }
                    if (prePath.IndexOf("English") != -1)
                    {
                        //<add key="LanguageServiceSaveXml" value="true"/>
                        AgileFrame.Core.LanguageService.IsEnabled = false;
                        AgileFrame.Core.LanguageService.IsAutoWriteControlXmlEnabled = true;
                        AgileFrame.Core.LanguageService.LanguageServiceSaveXml = true;

                        AgileFrame.Core.LanguageServiceManger.DefaultLanguageKey = "English";
                        //AgileFrame.Core.LanguageServiceManger.DefaultLanguageKey = AgileFrame.Core.StringHelper.HeadUpper(prePath);
                        //AgileFrame.Core.LanguageServiceManger.RefreshLanguageService = true;

                    }
                    else //if (AgileFrame.Core.LanguageServiceManger.DefaultLanguageKey != "Chinese")
                    {
                        AgileFrame.Core.LanguageService.IsEnabled = false;
                        AgileFrame.Core.LanguageServiceManger.DefaultLanguageKey = "Chinese";
                        AgileFrame.Core.LanguageServiceManger.RefreshLanguageService = true;
                    }
                    //else
                    //    AgileFrame.Core.LanguageService.IsEnabled = true;

                    string t1 = null;
                    t1 = new AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST_DETAIL()._ZhName;
                    t1 = AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST_DETAIL.Attribute.STATUS._ZhName;
                    t1 = AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST_DETAIL.Attribute.TYPE_ID._ZhName;
                    //t1 = AgileFrame.Orm.PersistenceLayer.Model.PARA_CHANNEL.Attribute.CHANNEL_TYPE._ZhName;
                    t1 = new AgileFrame.Orm.PersistenceLayer.BLL.Base.BaseFormHelper().GetOptionText(AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST_DETAIL.Attribute.STATUS, 1);
                    t1 = new AgileFrame.Orm.PersistenceLayer.BLL.Base.BaseFormHelper().GetOptionText(AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST_DETAIL.Attribute.TYPE_ID, 1);
                    //AgileFrame.Core.LanguageServiceManger.RefreshLanguageService = true;
                    t1 = new AgileFrame.Orm.PersistenceLayer.BLL.Base.BaseFormHelper().GetOptionText(AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST_DETAIL.Attribute.STATUS, 1);
                    t1 = new AgileFrame.Orm.PersistenceLayer.BLL.Base.BaseFormHelper().GetOptionText(AgileFrame.Orm.PersistenceLayer.Model.WEC_REQUEST_DETAIL.Attribute.TYPE_ID, 1);
      
                    //t1 = new AgileFrame.Orm.PersistenceLayer.Model.C_METER()._ZhName;
                    //t1 = AgileFrame.Orm.PersistenceLayer.Model.C_METER.Attribute.COMM_NO._ZhName;
                }
                catch(Exception ex) {
                    Console.Write(ex.ToString());
                }
            }
            else
            {
                AgileFrame.Core.LanguageService.IsEnabled = false;
                AgileFrame.Core.LanguageServiceManger.DefaultLanguageKey = "Chinese";
                AgileFrame.Core.LanguageServiceManger.RefreshLanguageService = true;
            }
            //string lan = AgileFrame.Core.LanguageService.GetLanguageString("Manager", "管理");//, "中文"

            //在应用程序启动时运行的代码
            Application["UserNum"] = 0;
            //AgileFrame.Orm.PersistenceLayer.Model.InitRunTime.IsWebSystem = true;

            //System.Runtime.Remoting.RemotingConfiguration.Configure("Artech.DuplexRemoting.Client.exe.config", false);
            Application["AFConfig.xml"] = 0;
        }
        catch { }
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //在应用程序关闭时运行的代码
        
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        //在出现未处理的错误时运行的代码
        //它将捕获所有 Application 级别的 UnhandleException 和 HttpException（比如：访问的页面不存在等）
        //因为 Server.Transfer 将固定抛出 ThreadAbort Exception 异常，不用理会。
        //在指定的 Error.aspx 里你可以通过  Server.GetLastError() 来进行，错误分类，日志处理，显示信息等工作。
        return;
        try
        {
            #region 异常处理
            Exception objErr1 = Server.GetLastError();
            if (objErr1 != null)
            {
                Exception objErr = objErr1.GetBaseException();
                if (objErr != null)
                    AgileFrame.Core.ConsoleService.Fatal(Request.RawUrl + objErr.Message);
                else
                    AgileFrame.Core.ConsoleService.Fatal(Request.RawUrl + objErr1.Message);
                //Server.Transfer("~/Err.aspx");
            }
            else
            {
                AgileFrame.Core.ConsoleService.Fatal(Request.RawUrl + " Error is null");
            }
            #endregion 异常处理
        }
        catch(Exception ex)
        {
            AgileFrame.Core.ConsoleService.Fatal(Request.RawUrl + ex.Message);
            // ignore
        }
        Server.ClearError();
    }

    void Session_Start(object sender, EventArgs e)
    {
        try
        {
            AgileFrame.Core.ConsoleService.IsNeedWebConsole = true;
            //int num = Convert.ToInt32(Application["AFConfig.xml"]);
            ////发布的时候要去掉
            //if (num == 0 && !System.IO.File.Exists(Server.MapPath(@"./AFConfig.xml")))
            {
                //AgileFrame.Orm.PersistenceLayer.DAL.Base.Runtime_PersistenceLayer.RefreshRuntime_PersistenceLayer();
            }
        }
        catch { }
        //if(AgileFrame.Orm.PersistenceLayer.DAL.Base.Runtime_PersistenceLayer.TbColumnDescription.Count==0)
        //    AgileFrame.Orm.PersistenceLayer.DAL.Base.Runtime_PersistenceLayer.RefreshRuntime_PersistenceLayer();

        //AgileFrame.Core.LanguageService.UpdateXml();
        //在新会话启动时运行的代码
    }

    void Session_End(object sender, EventArgs e)
    {
        try
        {
            //在会话结束时运行的代码。 
            // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
            // InProc 时，才会引发 Session_End 事件。如果会话模式 
            //设置为 StateServer 或 SQLServer，则不会引发该事件。
            int num = Convert.ToInt32(Application["UserNum"]);
            num--;
            Application["UserNum"] = num;
        }
        catch { }
    }
       
</script>
