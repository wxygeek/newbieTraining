using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;

namespace CSharp_Task3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String[] s = getNewsUrl(webCatch("http://today.hit.edu.cn/classList/2.html"));
            for (int i=1;i<=100;i++)
            {
                if (s[i-1] == null)
                    continue;
                try
                {
                    Random r = new Random();
                    String url = getCommendUrl( webCatch(s[i-1]));
                    if (url == null)
                        continue;
                    HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                    req.Method = "GET";
                    req.Headers["X-Forwarded-For"] = "202." + r.Next(256) + "." + r.Next(256) + "." + r.Next(256);
                    req.Timeout = 2000;
                    req.GetResponse().Close();
                    label2.Text = "第" + i + "条新闻刷票成功";
                    this.Refresh();
                }
                catch (Exception exc)
                {
                    label2.Text = "第" + i + "条新闻刷票失败";
                    this.Refresh();
                }
                //Thread.Sleep(1000);
            }
        }
        private int vote(String url,int times)
        {
            if (url == null||times == -1)
                return -1;
            if (times > 20)
                return 0;
            try
            {
                Random r = new Random();
                for (int i = 1; i <= 100-times; i++)
                {
                    HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                    req.Method = "GET";
                    req.Headers["X-Forwarded-For"] = "202." + r.Next(256) + "." + r.Next(256) + "." + r.Next(256);
                    req.Timeout = 2000;
                    req.GetResponse().Close();
                    label2.Text = "第" + i + "次刷票";
                    this.Refresh();
                    //Thread.Sleep(3000);
                }
            }catch(Exception e)
            {
                return -2;
            }
            return 1;
        }
        private String webCatch(String url)
        {
            if (url == null)
                return null;
            String result;
            Encoding myEncoding = Encoding.GetEncoding("gb2312");
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
            req.Method = "GET";
            try
            {
                HttpWebResponse myResponse = (HttpWebResponse)req.GetResponse();
                StreamReader reader = new StreamReader(myResponse.GetResponseStream(), myEncoding);
                result = reader.ReadToEnd();
                reader.Close();
            }
            catch (System.Net.WebException e)
            {Console.WriteLine(url);
                return null;
            }
            return result;
        }
        private String[] getNewsUrl(String result)
        {
            if (result == null)
                return null;
            String[] newsList = new String[100];
            result = result.Substring(result.IndexOf("/news/"));
            for (int i = 0; i < 100; i++ )
            {
                if (result.IndexOf("/news/") < 0)
                    break;
                newsList[i] = "http://today.hit.edu.cn" + result.Substring(result.IndexOf("/news/"), result.IndexOf("htm'") - result.IndexOf("/news/") + 3);
                result = result.Substring(result.IndexOf("htm'") + 4);
            }
            return newsList;
        }
        private String getCommendUrl(String result)
        {
            if (result != null && result.IndexOf("/commend/") >= 0)
                return "http://today.hit.edu.cn" + result.Substring(result.IndexOf("/commend/"), 16) + "1.htm";
            else
                return null;
        }
        private int getCommendNum(String result)
        {
            try
            {
                String[] lines = result.Split('\n');
                return int.Parse(lines[35]);
            }catch(Exception e)
            {
                return -1;
            }

        }
        private void button2_Click(object sender, EventArgs e)
        {
            String url = getCommendUrl(webCatch(textBox1.Text));
            int t = vote(url,getCommendNum(webCatch(url)));
            if (t == 1)
                label2.Text = "刷票成功";
            else if (t == 0)
                label2.Text = "无需刷票";
            else if (t == -1)
                label2.Text = "不正确的地址";
            else if (t == -2)
                label2.Text = "刷票过程中出现网络异常";
        }
    }
}
