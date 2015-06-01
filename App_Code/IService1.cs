using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using AgileFrame.Orm.PersistenceLayer.Model;

namespace TestCase
{
    [ServiceContract(Namespace = "WCF.IWecService")]
    public interface IWecService
    {

        [OperationContract]
        string wecAddUser(string username, string password, string imgVerify, string serverFilePath);

        [OperationContract]
        string getStatus(string username, string password, ref WEC_PUBLICLIST wec1);

    }


}