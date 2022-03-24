using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Microsoft.VisualBasic;
using static Microsoft.VisualBasic.Interaction;

namespace MarchFrpLauncher.UI
{
    public class Frp
    {
        Net Net = new Net();
        Config Config = new Config();

        string path = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "\\MarchFrpLauncher";

        public int DownloadFrpc()
        {
            try
            {
                Net.Download("https://client.ogfrp.cn/frpc/frpc_windows_amd64.exe", path + "\\frpc.exe");
            }
            catch (Exception)
            {
                return -1;
            }
            return 0;
        }

        public int reDownloadFrpc()
        {
            try
            {
                Net.Download("https://client.ogfrp.cn/frpc/frpc_windows_amd64.exe", path + "\\frpc.exe", true);
            }
            catch (Exception)
            {
                return -1;
            }
            return 0; ;
        }

        /// <summary>
        /// 将MarchFrpLauncher节点IP转换成ID
        /// </summary>
        /// <param name="server">节点IP</param>
        /// <param name="token">MarchFrpLauncher用户token</param>
        /// <returns></returns>
        public int serverToId(string server, string token, string Api, string Apitoken)
        {
            FrpServer frpServer = new FrpServer();
            FrpServerModel[] frpServers = frpServer.FrpsServerList(Net.Get("https://" + Api + "/?action=getnodesidip" + Apitoken + "&token=" + token)).ToArray();
            for (int i = 0; i < frpServers.Length; i++)
            {
                if (frpServers[i].ID == server)
                {
                    return int.Parse(frpServers[i].ID);
                }
            }
            return -1;
        }

        /// <summary>
        /// 启动frpc
        /// </summary>
        /// <param name="token">MarchFrpLauncher用户token</param>
        /// <param name="server">MarchFrpLauncher的节点ID</param>
        /// <returns></returns>
        public int launchFrpc(string token, int server, string Api)
        {
            try
            {
                File.WriteAllText(Config.FolderPath + "\\frpc.ini", Net.Get("https://" + Api + "/?action=getconf&token=" + token + "&node=" + server.ToString()));
                Interaction.Shell(Config.FolderPath + "\\frpc.exe -c \"" + Config.FolderPath + "\\frpc.ini\"", AppWinStyle.NormalFocus);
            }
            catch (Exception)
            {
                return -1;
            }
            return 0;
        }

        /// <summary>
        /// 启动frpc
        /// </summary>
        /// <param name="token">MarchFrpLauncher用户token</param>
        /// <param name="server">MarchFrpLauncher节点IP</param>
        /// <returns></returns>
        public int launchFrpc(string token, string server, string Api,string Apitoken)
        {
            try
            {
                string frpciniurl = "action=getconf&token=" + token + "&node=" + serverToId(server, token, Api,Apitoken);
                File.WriteAllText(Config.FolderPath + "\\frpc.ini", Net.Post("https://" + Api + "/", frpciniurl));
                Interaction.Shell(Environment.CurrentDirectory + "\\frpc.exe -c \"" + Config.FolderPath + "\\frpc.ini\"", AppWinStyle.NormalFocus);
            }
            catch (Exception ex)
            {
                MsgBox("Failure at\n" + ex.ToString(), MsgBoxStyle.Critical, "MarchFrpLauncher");
                return -1;
            }
            return 0;
        }
    }
}
