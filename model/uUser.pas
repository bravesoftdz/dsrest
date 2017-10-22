unit uUser;

interface

uses
  uModel, System.Generics.Collections,System.SysUtils;

type
  TUserMenuItem = class;

  TUser = class(TAppObject)
  private
    FPassword: Integer;
    FRealName: string;
    FUserMenuItems: TObjectList<TUserMenuItem>;
    FUserName: string;
    function GetUserMenuItems: TObjectList<TUserMenuItem>;
  public
    destructor Destroy; override;
  published
    property Password: Integer read FPassword write FPassword;
    property RealName: string read FRealName write FRealName;
    property UserMenuItems: TObjectList<TUserMenuItem> read GetUserMenuItems write
        FUserMenuItems;
    property UserName: string read FUserName write FUserName;
  end;

  TMenu = class(TAppObject)
  private
    FMenuCaption: string;
    FMenuName: string;
  published
    property MenuCaption: string read FMenuCaption write FMenuCaption;
    property MenuName: string read FMenuName write FMenuName;
  end;

  TUserMenuItem = class(TAppObjectItem)
  private
    FMenu: TMenu;
    FUser: TUser;
  published
    property Menu: TMenu read FMenu write FMenu;
    property User: TUser read FUser write FUser;
  end;

implementation

destructor TUser.Destroy;
begin
  inherited;
  FreeAndNil(FUserMenuItems);
end;

function TUser.GetUserMenuItems: TObjectList<TUserMenuItem>;
begin
  if FUserMenuItems = nil then
    FUserMenuItems := TObjectList<TUserMenuItem>.Create;

  Result := FUserMenuItems;
end;

end.
