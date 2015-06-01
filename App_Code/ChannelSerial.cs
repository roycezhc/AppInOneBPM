using System;
using System.Collections.Generic;
using System.Text;
using System.IO.Ports;
using System.Threading;
using System.Windows.Forms;

public class ChannelSerial : AChannel
{
    #region Property
    //串行波特率
    private int _baudRate = 9600;
    /// <summary>
    /// 获取或设置串行波特率。
    /// </summary>
    public int BaudRate
    {
        get
        {
            return _baudRate;

        }
        set
        {
            _baudRate = value;
        }
    }
    //中断信号状态
    private bool _breakState = false;        /// <summary>
    /// 获取或设置中断信号状态
    /// </summary>
    bool BreakState
    {
        get
        {
            return _breakState;
        }
        set
        {
            _breakState = value; ;
        }
    }
    //每个字节的标准数据位长度
    private int _dataBits = 8;
    /// <summary>
    ///  获取或设置每个字节的标准数据位长度。
    /// </summary>
    public int DataBits
    {
        get
        {
            return _dataBits;
        }
        set
        {
            _dataBits = value;
        }
    }
    //通信端口
    private string _portName = "COM1";
    /// <summary>
    /// 获取或设置通信端口，包括但不限于所有可用的 COM 端口
    /// </summary>
    public string PortName
    {
        get
        {
            return _portName;
        }
        set
        {
            _portName = value;
        }
    }
    //奇偶校验检查协议
    private Parity _parity = Parity.None;
    /// <summary>
    /// 获取或设置奇偶校验检查协议
    /// </summary>
    public Parity Parity
    {
        get
        {
            return _parity;
        }
        set
        {
            _parity = value;
        }
    }
    //每个字节的标准停止位数
    private StopBits _stopBits = StopBits.One;
    /// <summary>
    /// 获取或设置每个字节的标准停止位数
    /// </summary>
    public StopBits StopBits
    {
        get
        {
            return _stopBits;
        }
        set
        {
            _stopBits = value;
        }
    }


    #endregion

    private SerialPort _serialPort;
    public ChannelSerial()
    {
        _serialPort = new SerialPort();
    }
    #region To achieve an abstract method
    public override bool Open()
    {

        bool result = false;
        _serialPort.WriteTimeout = 1000;
        _serialPort.ReadTimeout = 1000;
        _serialPort.BaudRate = _baudRate;
        _serialPort.DataBits = _dataBits;
        _serialPort.Parity = _parity;
        _serialPort.DtrEnable = true;
        _serialPort.RtsEnable = true;
        _serialPort.ReceivedBytesThreshold = 1;
        _serialPort.StopBits = _stopBits;
        if (base._isOPen)
        {
            _serialPort.Dispose();
            _isOPen = false;
        }
        try
        {
            _serialPort.PortName = _portName;
            _serialPort.Open();
            _isOPen = true;
            _serialPort.DataReceived += new SerialDataReceivedEventHandler(Receive_SerialData);
            result = true;

        }
        catch (Exception ex)
        {
            result = false;
            _isOPen = false;
            throw ex;
        }
        return result;
    }
    public override bool Close()
    {
        bool result = false;
        try
        {
            _serialPort.DataReceived -= new SerialDataReceivedEventHandler(Receive_SerialData);
            _serialPort.Close();
            result = true;
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            _serialPort.Dispose();
        }
        return result;

    }
    protected override void OnSend(byte[] data)
    {
        _serialPort.Write(data, 0, data.Length);
    }
    protected override void OnSend(string data)
    {
        _serialPort.Write(data);
    }
    #endregion
    #region //private method
    private void Receive_SerialData(Object sender, EventArgs e)
    {
        try
        {
            int lastBytesRead = 0;
            while (true)
            {
                lastBytesRead = _serialPort.BytesToRead;
                Thread.Sleep(60);
                //Application.DoEvents();
                if (_serialPort.BytesToRead > lastBytesRead)
                {
                    lastBytesRead = _serialPort.BytesToRead;
                }
                else
                {
                    //通信质量不好中间间隔比价大的情况下；
                    if (lastBytesRead < 0)
                    {
                        return;
                    }
                    //if (_byteReceive_Handler == null && _stringReceive_Handler == null)
                    //{
                    //    return;
                    //}
                    if (_isByteReceive)
                    {
                        byte[] frameByte = new byte[lastBytesRead];
                        _serialPort.Read(frameByte, 0, lastBytesRead);
                        //接收处理
                        _byteReceive_Handler(frameByte);

                    }
                    else
                    {
                        string frameStr = _serialPort.ReadExisting();
                        if (_stringReceive_Handler == null)
                        {
                            return;
                        }
                        //接收处理
                        _stringReceive_Handler(frameStr);
                    }
                    lastBytesRead = 0;
                    return;
                }
            }
        }
        catch
        {
            try
            {
                _serialPort.ReadExisting();
            }
            catch
            { }
        }
    }

    #endregion


}

