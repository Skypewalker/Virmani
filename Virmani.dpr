program Virmani;

uses
  Forms,
  unVirman in 'unVirman.pas' {frmVirman},
  repVirman_unit in 'repVirman_unit.pas' {repVirman: TQuickRep},
  unDijalog in 'unDijalog.pas' {frmDijalog};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Virmani';
  Application.CreateForm(TfrmVirman, frmVirman);
  Application.Run;
end.
