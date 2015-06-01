using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public abstract class AChannel
{
    /// <summary>
    /// 信道byte接收标志
    /// </summary>
    protected bool _isByteReceive;
    /// <summary>
    /// 信道开启状态
    /// </summary>
    protected bool _isOPen;
    /// <summary>
    /// 字符串发送数据
    /// </summary>
    /// <param name="data"></param>
    public void Send(string data)
    {
        if (!_isOPen)
        {
            return;
        }
        OnSend(data);
    }
    /// <summary>
    /// 字符串发送数据抽象函数
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>
    abstract protected void OnSend(string data);
    /// <summary>
    /// 比特格式发送数据
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>
    public void Send(byte[] data)
    {
        if (!_isOPen)
        {
            return;
        }
        OnSend(data);
    }
    /// <summary>
    /// 比特格式发送数据抽象函数
    /// </summary>
    /// <param name="data"></param>
    abstract protected void OnSend(byte[] data);
    /// <summary>
    /// 打开信道
    /// </summary>
    /// <returns></returns>
    abstract public bool Open();
    /// <summary>
    /// 关闭信道
    /// </summary>
    /// <returns></returns>
    abstract public bool Close();
    /// <summary>
    /// 信道接收处理
    /// </summary>
    protected StringReceive_Handler _stringReceive_Handler;
    /// <summary>
    /// 信道接收处理，
    /// </summary>
    protected ByteReceive_Handler _byteReceive_Handler;
    /// <summary>
    /// 信道接收处理，接收类型比特
    /// </summary>
    public ByteReceive_Handler ByteReceiveHandler
    {
        get
        {
            return _byteReceive_Handler;
        }
        set
        {
            _byteReceive_Handler = value;
            _isByteReceive = true;
            _stringReceive_Handler = null;
        }
    }
    /// <summary>
    /// 信道接收处理，接收类型字符串
    /// </summary>
    public StringReceive_Handler StringReceiveHandler
    {
        get
        {
            return _stringReceive_Handler;
        }
        set
        {
            _stringReceive_Handler = value;
            _isByteReceive = false;
            _byteReceive_Handler = null;

        }

    }
    /// <summary>
    /// 信道打开状态
    /// </summary>
    public bool IsOPen
    {
        get
        {
            return _isOPen;
        }
    }


}
    /// <summary>
    /// 接收委托事件
    /// </summary>
    /// <param name="dataRcv"></param>
    public delegate void StringReceive_Handler(string dataRcv);
    /// <summary>
    /// 接收委托事件
    /// </summary>
    /// <param name="dataRcv"></param>
    public delegate void ByteReceive_Handler(byte[] dataRcv);
