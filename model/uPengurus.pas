unit uPengurus;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModel;

type
  TPengurus = class(TAppObject)
  private
    FKode: string;
    FNama: string;
  public
    property Nama: string read FNama write FNama;
  published
    property Kode: string read FKode write FKode;
  end;


implementation



end.
