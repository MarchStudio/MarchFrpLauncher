Imports MarchFrpLauncher.UI

Public Class ServerSelectionWindow

    Public Assets As New AssetModel
    Dim Frp As New Frp
    Dim FrpServer As New FrpServer
    Dim Net As New Net
    Dim Api As String
    Dim Apitoken As String

    Dim AccessToken As String

    Public Sub _init_(ByVal AccessToken As String, ByVal Api As String, ByVal Apitoken As String)
        Me.Apitoken = Apitoken
        Me.Api = Api
        Me.AccessToken = AccessToken
        Me.lb_Server.Text = Assets.PlzSelectServer
        Me.bt_launch.Text = Assets.LaunchFrpc
        Dim Content = Net.Get("https://" + Api + "/?action=getnodesidip" + Apitoken + "&token=" + AccessToken)
        Dim frpservers = FrpServer.FrpsServerList(Content)
        Me.cb_Server.DataSource = frpservers
        Me.cb_Server.DisplayMember = "Address"
    End Sub

    Private Sub bt_launch_Click(sender As Object, e As EventArgs) Handles bt_launch.Click
        Dim SelectedServer As FrpServerModel = Me.cb_Server.SelectedItem
        Frp.launchFrpc(Me.AccessToken, SelectedServer.ID, Me.Api, Me.Apitoken)
        Me.Dispose()
    End Sub

    Private Sub cb_Server_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cb_Server.SelectedIndexChanged

    End Sub
End Class