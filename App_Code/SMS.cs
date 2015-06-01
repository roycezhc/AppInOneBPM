using System;
using System.Collections.Generic;
using System.Text;
using System.Timers;
using System.Threading;
using System.Windows.Forms;

public class SMS
{
    //超时计时器
    private System.Timers.Timer _timer = new System.Timers.Timer();
    //通讯超时标志
    private bool _commTimeout = false;

    //超时计数器100*50毫秒10分钟
    private int TIMEOUTCOUNT = 50;

    //超时时间计数器
    private int _timeCount = 0;

    //通讯接收返回标志
    private bool _commReceive = false;

    //短信中心号
    private string _centerNo = "8613800571500";
    //public string CenterNo
    //{
    //    get
    //    {
    //        return _centerNo;
    //    }
    //    set
    //    {
    //        _centerNo = value;
    //    }
    //}

    //编码类
    private EnCodingPDU _enCodingPDU = new EnCodingPDU();

    //CMGS指令发送结果
    private bool _atCmgsResult = false;

    public string strSendMessage = "";

    //当前短信发送、删除结果
    private bool _msgSendResult = false;

    //抽象信道
    private AChannel _channel;

    //记录当前状态的
    private bool _atResult = false;


    /// <summary>
    /// 设置发送信道,已经打开并且可以正常的通信。
    /// </summary>
    public AChannel Channel
    {
        set
        {
            _channel = value;
            //_channel.StringReceiveHandler += new StringReceive_Handler(OnStringReceive);
        }
    }

    public SMS()
    {
        _timer.Interval = 100;
        _timer.Elapsed += new ElapsedEventHandler(OnTimedEvent);
        _commTimeout = true;
        // IReceiveSMS iReceiveSMS = new Receive();
        //_receiveSMSHandler = iReceiveSMS;
    }

    public string CenterNo
    {
        get
        {
            return _centerNo;
        }
        set
        {
            _centerNo = value;
        }
    }

    public bool SendMessage(string mobileNo, string message)
    {
        //短信PDU编码
        string msgPDU = _enCodingPDU.EncodedSM(this._centerNo, mobileNo, message);
        //PDU编码格式下，短信长度
        string legthMsg = _enCodingPDU.NLength;
        //发送短信at指令,发送短信长度
        string atcmgs = "AT+CMGS=" + legthMsg + (char)13;

        strSendMessage = atcmgs;

        _channel.Send(atcmgs);
        //启动超时接收
        //_atCmgsResult = true;
        //WaitReceive(1500);
        ////At发送失败
        //if (!_atCmgsResult)
        //{
        //    //byte[] ctrZ = new byte[1];
        //    //ctrZ[0] = 0X1A;
        //    //_channel.Send(ctrZ);
        //    Refresh();
        //    return false;
        //}
        strSendMessage += "," + msgPDU;
        //发送短信息内容
        _channel.Send(msgPDU);
        //启动超时接收
        //_msgSendResult = false;
        //WaitReceive(15000);

        ////duanxin
        //if (!_msgSendResult)
        //{
        //    //ModemClear();
        //    //下面是2009-03-02
        //    Refresh();
        //    //上面是2009-03-02
        //    return false;
        //}
        return true;
    }

    private bool WaitReceive(int overtime)
    {
        TIMEOUTCOUNT = overtime / 100;
        bool receive = false;
        //计数归零启动定时器
        _timeCount = 0;
        _timer.Enabled = true;
        //设置通讯标志初始值
        _commReceive = false;
        _commTimeout = false;
        while (true)
        {
            //
            if (_commTimeout)
            {
                receive = false;

                break;
            }
            //
            if (_commReceive)
            {
                receive = true;
                break;
            }
            System.Threading.Thread.Sleep(1);
            //Application.DoEvents();
        }
        _timer.Enabled = false;
        return receive;
    }
    /// <summary>
    /// 定时器事件
    /// </summary>
    /// <param name="source"></param>
    /// <param name="e"></param>
    private void OnTimedEvent(object source, ElapsedEventArgs e)
    {
        _timeCount++;
        //超时
        if (_timeCount == TIMEOUTCOUNT)
        {
            _commTimeout = true;
            _timeCount = 0;
            _timer.Enabled = false;
        }
        //正常返回
        if (_commReceive)
        {
            _timer.Enabled = false;
        }
    }

    /// <summary>
    /// 短信猫，终止当前任务！
    /// </summary>
    /// <returns></returns>
    public bool Refresh()
    {
        byte[] ctrZ = new byte[1];
        ctrZ[0] = 0X1A;
        _atResult = false;
        _channel.Send(ctrZ);
        //超时等待
        WaitReceive(5000);
        //命令结果
        return _commReceive;
    }

}
