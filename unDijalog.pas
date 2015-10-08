unit unDijalog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmDijalog = class(TForm)
    btnDa: TButton;
    btnNe: TButton;
    btnOdustani: TButton;
    memPoruka: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TControl; Title, Msg : String); overload;
  end;

var
  frmDijalog: TfrmDijalog;

implementation

{$R *.dfm}

{ TfrmDijalog }

constructor TfrmDijalog.Create(Owner: TControl; Title, Msg: String);
begin
  Create(Owner);
  Self.Caption:=Title;
  memPoruka.Text:=Msg;
end;

end.
