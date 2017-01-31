object ClientDataModule: TClientDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 415
  object DSRestConnection: TDSRestConnection
    Host = '127.0.0.1'
    Port = 8080
    LoginPrompt = False
    Left = 48
    Top = 40
    UniqueId = '{6D25B838-E6CA-4EB1-9BE6-44F1AC2252B4}'
  end
end
