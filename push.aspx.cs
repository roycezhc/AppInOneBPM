using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JdSoft.Apple.Apns.Notifications;

public partial class push : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    static void service_BadDeviceToken(object sender, BadDeviceTokenException ex)
    {
        Console.WriteLine("Bad Device Token: {0}", ex.Message);
    }

    static void service_Disconnected(object sender)
    {
        Console.WriteLine("Disconnected...");
    }

    static void service_Connected(object sender)
    {
        Console.WriteLine("Connected...");
    }

    static void service_Connecting(object sender)
    {
        Console.WriteLine("Connecting...");
    }

    static void service_NotificationTooLong(object sender, NotificationLengthException ex)
    {
        Console.WriteLine(string.Format("Notification Too Long: {0}", ex.Notification.ToString()));
    }

    static void service_NotificationSuccess(object sender, Notification notification)
    {
        Console.WriteLine(string.Format("Notification Success: {0}", notification.ToString()));
    }

    static void service_NotificationFailed(object sender, Notification notification)
    {
        Console.WriteLine(string.Format("Notification Failed: {0}", notification.ToString()));
    }

    static void service_Error(object sender, Exception ex)
    {
        Console.WriteLine(string.Format("Error: {0}", ex.Message));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Variables you may need to edit:
        //---------------------------------

        //True if you are using sandbox certificate, or false if using production
        bool sandbox = true;



        string testDeviceToken = "81ec52e62140a8c7281d4ddd5ccf13e80fee79e4bdcf8edcecaa73e79e1db0d1";//测试IPHONE4S正式




        //Put your PKCS12 .p12 or .pfx filename here.
        // Assumes it is in the same directory as your app
        string p12File = "test.p12";

        //This is the password that you protected your p12File 
        //  If you did not use a password, set it as null or an empty string
        string p12FilePassword = "123";

        //Number of notifications to send
        int count = 1;

        //Number of milliseconds to wait in between sending notifications in the loop
        // This is just to demonstrate that the APNS connection stays alive between messages
        int sleepBetweenNotifications = 15000;


        //Actual Code starts below:
        //--------------------------------


        string p12Filename = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, p12File);

        NotificationService service = new NotificationService(sandbox, p12Filename, p12FilePassword, 1);

        service.SendRetries = 5; //5 retries before generating notificationfailed event
        service.ReconnectDelay = 5000; //5 seconds

        service.Error += new NotificationService.OnError(service_Error);
        service.NotificationTooLong += new NotificationService.OnNotificationTooLong(service_NotificationTooLong);

        service.BadDeviceToken += new NotificationService.OnBadDeviceToken(service_BadDeviceToken);
        service.NotificationFailed += new NotificationService.OnNotificationFailed(service_NotificationFailed);
        service.NotificationSuccess += new NotificationService.OnNotificationSuccess(service_NotificationSuccess);
        service.Connecting += new NotificationService.OnConnecting(service_Connecting);
        service.Connected += new NotificationService.OnConnected(service_Connected);
        service.Disconnected += new NotificationService.OnDisconnected(service_Disconnected);

        //The notifications will be sent like this:
        //		Testing: 1...
        //		Testing: 2...
        //		Testing: 3...
        // etc...
        for (int i = 1; i <= count; i++)
        {
            //if (i == 2)
            //{
            //    testDeviceToken = "5d4442387f100bec54e78b416a127504efe76a36bfba0a24b71b0854fcf4a4d9";
            //}
            //if (i == 3)
            //{
            //    testDeviceToken = "5d4442387f100bec54e78b416a127504efe76a36bfba0a24b71b0854fcf4a4d9";
            //}
            //if (i == 10)
            //{
            //    testDeviceToken = "5d4442387f100bec54e78b416a127504efe76a36bfba0a24b71b0854fcf4a4d9";
            //}
            //Create a new notification to send
            Notification alertNotification = new Notification(testDeviceToken);

            // alertNotification.Payload.Alert.Body = string.Format("Testing {0}...", i);
            alertNotification.Payload.Alert.Body = txtAlert.Value;
            alertNotification.Payload.Sound = txtSound.Value;
            alertNotification.Payload.Badge = Convert.ToInt32(txtBadge.Value);
            alertNotification.Payload.AddCustom(txtName1.Value, txtVaule1.Value);
            alertNotification.Payload.AddCustom(txtName2.Value, txtVaule2.Value);
            alertNotification.Payload.AddCustom(txtName3.Value, txtVaule3.Value);

            //Queue the notification to be sent
            if (service.QueueNotification(alertNotification))
                Console.WriteLine("Notification Queued!");
            else
                Console.WriteLine("Notification Failed to be Queued!");

            ////Sleep in between each message
            //if (i < count)
            //{
            //    Console.WriteLine("Sleeping " + sleepBetweenNotifications + " milliseconds before next Notification...");
            //    System.Threading.Thread.Sleep(sleepBetweenNotifications);
            //}
        }

        Console.WriteLine("Cleaning Up...");

        //First, close the service.  
        //This ensures any queued notifications get sent befor the connections are closed
        service.Close();

        //Clean up
        service.Dispose();

        Console.WriteLine("Done!");
        Console.WriteLine("Press enter to exit...");
        Console.ReadLine();
    }
}