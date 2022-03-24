Public Class SettingsPage

    Public Assets As UI.AssetModel

    Public Config As UI.Config

    Public Sub _init_()
        Me.lb_title.Text = Assets.Settings
        Me.ctm_lang.Assets = Me.Assets
        Me.ctm_lang.Config = Me.Config
        Me.ctm_lang._init_()
        Me.ctm_flm.Assets = Me.Assets
        Me.ctm_flm.Config = Me.Config
        Me.ctm_flm._init_()
    End Sub

    Private Sub ctm_lang_Loaded(sender As Object, e As RoutedEventArgs)

    End Sub
End Class
