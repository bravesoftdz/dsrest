unit uUser;

interface

uses
  uModel, System.Generics.Collections,System.SysUtils;

type
  TUserMenuItem = class;

  TUser = class(TAppObject)
  private
    FIsAdmin: Integer;
    FPassword: string;
    FUserMenuItems: TObjectList<TUserMenuItem>;
    FUserName: string;
    function GetUserMenuItems: TObjectList<TUserMenuItem>;
  public
    destructor Destroy; override;
  published
    property IsAdmin: Integer read FIsAdmin write FIsAdmin;
    property Password: string read FPassword write FPassword;
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
    FUseraPP: TUser;
  public
    function GetHeaderField: string; override;
    procedure SetHeaderProperty(AHeaderProperty : TAppObject); override;
  published
    property Menu: TMenu read FMenu write FMenu;
    property UseraPP: TUser read FUseraPP write FUseraPP;
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

function TUserMenuItem.GetHeaderField: string;
begin
  Result := 'UseraPP';
end;

procedure TUserMenuItem.SetHeaderProperty(AHeaderProperty : TAppObject);
begin
  UseraPP := TUser(AHeaderProperty);
end;

end.
