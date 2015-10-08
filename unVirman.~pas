unit unVirman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Mask, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSqlUpdate, Buttons,
  ZAbstractTable, DBGrids, ComCtrls, ToolWin, ImgList,
  Menus, DBClient, DBTables;

const
  emNew = 0;  // U toku je unos novog
  emEdit= 1;  // U toku je promena postojeceg
  emDefault = 2;  // U toku je pregled postojeceg

type
  TVirman = record
    rb : Integer;
    duznik : String[255];
    svrha_placanja : String[255];
    poverilac : String[255];
    sifra_placanja : String[5];
    valuta : String[5];
    iznos : String[50];
    racun_duznika : String[100];
    broj_modela_1 : String[10];
    zaduzenje : String[100];
    racun_poverioca : String[100];
    broj_modela_2 : String[10];
    odobrenje : String[100];
    hitno : Boolean;
    mesto_prijema : String[100];
    datum_prijema : String[20];
    datum_valute : String[20];
  end;

  TVirmani = Array of TVirman;

  TfrmVirman = class(TForm)
    imgsToolbar: TImageList;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    mainMenu: TMainMenu;
    File1: TMenuItem;
    Novi1: TMenuItem;
    Snimi1: TMenuItem;
    Snimikao1: TMenuItem;
    Izai1: TMenuItem;
    N1: TMenuItem;
    Otvori1: TMenuItem;
    tampaj1: TMenuItem;
    N2: TMenuItem;
    panelVirman: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lblTotal: TLabel;
    memDuznik: TMemo;
    memSvrhaPlacanja: TMemo;
    memPoverilac: TMemo;
    txtSifraPlacanja: TEdit;
    txtValuta: TEdit;
    txtIznos: TEdit;
    txtRacunDuznika: TEdit;
    txtBrojModela1: TEdit;
    txtZaduzenje: TEdit;
    txtRacunPoverioca: TEdit;
    txtBrojModela2: TEdit;
    txtOdobrenje: TEdit;
    ToolBar1: TToolBar;
    btnNovi: TToolButton;
    btnOtvori: TToolButton;
    btnSnimi: TToolButton;
    ToolButton1: TToolButton;
    btnPrint: TToolButton;
    btnPrvi: TBitBtn;
    btnPrethodni: TBitBtn;
    txtTekuci: TEdit;
    btnNaredni: TBitBtn;
    btnPoslednji: TBitBtn;
    btnNew: TBitBtn;
    btnDelete: TBitBtn;
    btnOK: TBitBtn;
    statusBar: TStatusBar;
    ClientDataSet: TClientDataSet;
    ClientDataSetrb: TIntegerField;
    ClientDataSetSifraPlacanja: TStringField;
    ClientDataSetValuta: TStringField;
    ClientDataSetIznos: TStringField;
    ClientDataSetRacunDuznika: TStringField;
    ClientDataSetBrojModela1: TStringField;
    ClientDataSetZaduzenje: TStringField;
    ClientDataSetRacunPoverioca: TStringField;
    ClientDataSetBrojModela2: TStringField;
    ClientDataSetOdobrenje: TStringField;
    ClientDataSetDuznik: TMemoField;
    ClientDataSetSvrhaPlacanja: TMemoField;
    ClientDataSetPoverilac: TMemoField;    
    Label14: TLabel;
    txtMestoPrijema: TEdit;
    Label15: TLabel;
    txtDatumPrijema: TEdit;
    Label16: TLabel;
    txtDatumValute: TEdit;
    ClientDataSetMestoPrijema: TStringField;
    ClientDataSetDatumPrijema: TDateTimeField;
    ClientDataSetDatumValute: TDateTimeField;
    Shape2: TShape;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPotvrdiClick(Sender: TObject);
    procedure btnPonistiClick(Sender: TObject);
    procedure memDuznikChange(Sender: TObject);
    procedure lbVirmaniClick(Sender: TObject);
    procedure btnOtvoriClick(Sender: TObject);
    procedure btnSnimiClick(Sender: TObject);
    procedure btnNoviClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPrviClick(Sender: TObject);
    procedure btnPrethodniClick(Sender: TObject);
    procedure btnNaredniClick(Sender: TObject);
    procedure btnPoslednjiClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure Novi1Click(Sender: TObject);
    procedure Otvori1Click(Sender: TObject);
    procedure Snimi1Click(Sender: TObject);
    procedure Snimikao1Click(Sender: TObject);
    procedure Izai1Click(Sender: TObject);
    procedure tampaj1Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
    editMode : Integer;
    rb: Integer;     // Kada se refreshuje qryVirman, na kojoj poziciji je bio
    total : Integer; // Koliko stavki ima
    prljav: Boolean; // Imalo je promena u fajlu
    nazivFajla : String; // Naziv fajla
    punNazivFajla : String; // Pun naziv fajla
    temp: Boolean;   // Fajl je privremen, uklanja se nakon zatvaranja forme
    virmani : TVirmani;
    procedure isprazniKontrole;
    procedure popuniKontrole;
    procedure prikaziStatus;
    procedure zapamtiPromene;
    procedure idiNaPrvi;
    procedure idiNaPrethodni;
    procedure idiNaNaredni;
    procedure idiNaPoslednji;
    procedure osveziNavigaciju;
    procedure novi;
    procedure snimi;
    procedure snimiKao;
    procedure ucitaj(imeFajla:String='');
  public
    { Public declarations }
    idFile: Integer;             // Id fajla sa kojim se radi
    retIdFolder : Integer;       // Kada se poziva snimi, Form manager ovde upisuje idFoldera
    retNaziv : String;           // Kada se poziva snimi, Form manager ovde upisuje naziv fajla
    retIdFile : Integer;         // Kada se poziva ucitaj, Form manager ovde upisuje id fajla
    procedure NoviPodatak;
    procedure IzbaciPodatak;
    procedure Izvestaj;
  end;

var
  frmVirman: TfrmVirman;

function PrikaziDijalog(Naslov, Poruka : String):Integer;

implementation

uses repVirman_unit, StrUtils, unDijalog;

function PrikaziDijalog(Naslov, Poruka : String):Integer;
var f:TfrmDijalog;
begin
  f:=TfrmDijalog.Create(nil,Naslov,Poruka);
  Result:= f.ShowModal;
end;
{$R *.dfm}

procedure TfrmVirman.FormShow(Sender: TObject);
var qryNovi:TZQuery;
    i:Integer;
    fn:String;
begin
    // Odmah poceti sa unosom novog
    nazivFajla:='';
    punNazivFajla:='';
    temp:=True;
    rb:=0;
    total:=0;
    editMode:=emNew;
    isprazniKontrole;
    prikaziStatus;
    osveziNavigaciju;
    memDuznik.SetFocus;
    prljav:=False;

    // Da li treba da se ucita neki fajl?
    if ParamCount>=3 then
    begin
      fn:=ParamStr(2);
      for i:=3 to ParamCount do
        fn:=fn+' '+ParamStr(i);
      ucitaj(fn);
    end;

end;

procedure TfrmVirman.prikaziStatus;
begin
   with statusBar.Panels[0] do
   case editMode of
     emNew : Text:='Dodavanje novog +';
     emEdit : Text:='Ispravka postojeæeg *';
     emDefault : Text:='';
   end;
   lblTotal.Caption:='od '+IntToStr(total)+' virmana';
   txtTekuci.Text:=IntToStr(rb);
end;

procedure TfrmVirman.isprazniKontrole;
begin
    memDuznik.Clear;
    memSvrhaPlacanja.Clear;
    memPoverilac.Clear;
    txtSifraPlacanja.Clear;
    txtValuta.Clear;
    txtIznos.Text:='0';
    txtRacunDuznika.Clear;
    txtBrojModela1.Clear;
    txtZaduzenje.Clear;
    txtRacunPoverioca.Clear;
    txtBrojModela2.Clear;
    txtOdobrenje.Clear;
    txtMestoPrijema.Clear;
    txtDatumPrijema.Clear;
    txtDatumValute.Clear;
end;

procedure TfrmVirman.FormClose(Sender: TObject; var Action: TCloseAction);
var qryObrisi : TZQuery;
begin
  // Ako je fajl menjan treba se pitati korisnik da li zeli da zapamti promene
  // i ako zeli, onda ako postoji nazivFajla, vrsi se snimanje (Save), a ako ne
  // poziva se komanda Save As
  Action:=caFree;
end;

procedure TfrmVirman.IzbaciPodatak;
var i : Integer;
begin
  rb:=rb-1;
  total:=total-1;

  for i := rb+1 to High(virmani) do
    virmani[i-1]:=virmani[i];

  SetLength(virmani,Length(virmani)-1);

  if total=0 then
  begin
    NoviPodatak;
    Exit;
  end
  else if rb=0 then
    rb:=1;

  popuniKontrole;
  osveziNavigaciju;
  prikaziStatus;
end;

procedure TfrmVirman.Izvestaj;
var izv: TrepVirman;
    i: Integer;
    zapis : Array[0..12] of Variant;
begin
  ClientDataSet.CreateDataSet;
  ClientDataSet.Open;
  for i:=Low(virmani) To High(virmani) do
  begin
    ClientDataSet.Insert;
    ClientDataSetrb.AsInteger:=virmani[i].rb;
    ClientDataSetDuznik.AsString:=virmani[i].duznik;
    ClientDataSetSvrhaPlacanja.AsString:=virmani[i].svrha_placanja;
    ClientDataSetPoverilac.AsString:=virmani[i].poverilac;
    ClientDataSetSifraPlacanja.AsString:=virmani[i].sifra_placanja;
    ClientDataSetValuta.AsString:=virmani[i].valuta;
    ClientDataSetIznos.AsString:=virmani[i].iznos;
    ClientDataSetRacunDuznika.AsString:=virmani[i].racun_duznika;
    ClientDataSetBrojModela1.AsString:=virmani[i].broj_modela_1;
    ClientDataSetZaduzenje.AsString:=virmani[i].zaduzenje;
    ClientDataSetRacunPoverioca.AsString:=virmani[i].racun_poverioca;
    ClientDataSetBrojModela2.AsString:=virmani[i].broj_modela_2;
    ClientDataSetOdobrenje.AsString:=virmani[i].odobrenje;
    ClientDataSetMestoPrijema.AsString:=virmani[i].mesto_prijema;
    if virmani[i].datum_prijema<>'' then
      ClientDataSetMestoPrijema.AsString:=virmani[i].mesto_prijema+','+virmani[i].datum_prijema;
    ClientDataSetDatumValute.AsString:=virmani[i].datum_valute;
  end;
  ClientDataSet.First;
  izv:=TrepVirman.Create(Self);
  try
    izv.Preview;
  finally
    izv.Destroy;
  end;
  ClientDataSet.Close;
end;

procedure TfrmVirman.NoviPodatak;
begin
  // Dodavanje novog virmana. Dozvoljeno ako nije vec u stanju dodavanja
  if not (editMode=emNew) then
  begin
    editMode:=emNew;
    isprazniKontrole;
    prikaziStatus;
    osveziNavigaciju;
  end;
  memDuznik.SetFocus;
end;

procedure TfrmVirman.popuniKontrole;
var pom : Boolean;
begin
  // Popunjavanje kontrola ne sme da poremeti stanje za prljav!
  pom:=prljav;
  with virmani[rb-1] do
  begin
    memDuznik.Text:=duznik;
    memSvrhaPlacanja.Text:=svrha_placanja;
    memPoverilac.Text:=poverilac;
    txtSifraPlacanja.Text:=sifra_placanja;
    txtValuta.Text:=valuta;
    txtIznos.Text:=iznos;
    txtRacunDuznika.Text:=racun_duznika;
    txtBrojModela1.Text:=broj_modela_1;
    txtZaduzenje.Text:=zaduzenje;
    txtRacunPoverioca.Text:=racun_poverioca;
    txtBrojModela2.Text:=broj_modela_2;
    txtOdobrenje.Text:=odobrenje;
    txtMestoPrijema.Text:=mesto_prijema;
    txtDatumPrijema.Text:=datum_prijema;
    txtDatumValute.Text:=datum_valute;
  end;
  prljav:=pom;
end;

procedure TfrmVirman.zapamtiPromene;
begin
   case editMode of
      emEdit :
      begin
         // Ispravljen je rb-ti podatak
         with virmani[rb-1] do
         begin
           duznik :=memDuznik.Text;
           svrha_placanja:=memSvrhaPlacanja.Text;
           poverilac:=memPoverilac.Text;
           sifra_placanja:=txtSifraPlacanja.Text;
           valuta:=txtValuta.Text;
           iznos:=txtIznos.Text;
           racun_duznika:=txtRacunDuznika.Text;
           broj_modela_1:=txtBrojModela1.Text;
           zaduzenje:=txtZaduzenje.Text;
           racun_poverioca:=txtRacunPoverioca.Text;
           broj_modela_2:=txtBrojModela2.Text;
           odobrenje:=txtOdobrenje.Text;
           mesto_prijema:=txtMestoPrijema.Text;
           datum_prijema:=txtDatumPrijema.Text;
           datum_valute:=txtDatumValute.Text;
         end;
      end;
      emNew:
      begin
         // Dodat je novi podataka
         SetLength(virmani,Length(virmani)+1);
         total:=total+1;
         rb:=total;
         with virmani[rb-1] do
         begin
           duznik :=memDuznik.Text;
           svrha_placanja:=memSvrhaPlacanja.Text;
           poverilac:=memPoverilac.Text;
           sifra_placanja:=txtSifraPlacanja.Text;
           valuta:=txtValuta.Text;
           iznos:=txtIznos.Text;
           racun_duznika:=txtRacunDuznika.Text;
           broj_modela_1:=txtBrojModela1.Text;
           zaduzenje:=txtZaduzenje.Text;
           racun_poverioca:=txtRacunPoverioca.Text;
           broj_modela_2:=txtBrojModela2.Text;
           odobrenje:=txtOdobrenje.Text;
           mesto_prijema:=txtMestoPrijema.Text;
           datum_prijema:=txtDatumPrijema.Text;
           datum_valute:=txtDatumValute.Text;           
         end;
         editMode:=emEdit;
         prikaziStatus;
         osveziNavigaciju;
      end;
   end;
end;

procedure TfrmVirman.btnPotvrdiClick(Sender: TObject);
begin
  zapamtiPromene;
end;

procedure TfrmVirman.btnPonistiClick(Sender: TObject);
begin
  popuniKontrole;
  prljav:=False;
end;

procedure TfrmVirman.memDuznikChange(Sender: TObject);
begin
    prljav:=True;
end;

procedure TfrmVirman.lbVirmaniClick(Sender: TObject);
begin
    popuniKontrole;
end;

procedure TfrmVirman.btnOtvoriClick(Sender: TObject);
begin
  ucitaj;
end;

procedure TfrmVirman.btnSnimiClick(Sender: TObject);
begin
  snimi;
end;

procedure TfrmVirman.btnNoviClick(Sender: TObject);
var odg : Integer;
begin
  if Prljav then
  begin
    odg := PrikaziDijalog('Virmani','Želite li da zapamtite promene?');
    if odg = mrYes then
      snimi
    else if odg = mrCancel then
      Exit;
  end;
  isprazniKontrole;
  novi;
end;

procedure TfrmVirman.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var odg : Integer;
    por : String;
begin
  if prljav then
  begin
    por := 'Ukoliko zatvorite program sve promene æe biti izgubljene.'#13#10'Želite li da zatvorite prozor?';
    odg:=PrikaziDijalog('Virmani',por);
    if (odg=mrNo) or (odg=mrCancel) then
      CanClose := False
    else
      CanClose := True;
  end;
end;

procedure TfrmVirman.idiNaNaredni;
begin
  zapamtiPromene;
  rb:=rb+1;
  popuniKontrole;
  osveziNavigaciju;
  prikaziStatus;
end;

procedure TfrmVirman.idiNaPoslednji;
begin
  zapamtiPromene;
  rb:=total;
  popuniKontrole;
  osveziNavigaciju;
  prikaziStatus;
end;

procedure TfrmVirman.idiNaPrethodni;
begin
  zapamtiPromene;
  rb:=rb-1;
  popuniKontrole;
  osveziNavigaciju;
  prikaziStatus;
end;

procedure TfrmVirman.idiNaPrvi;
begin
  zapamtiPromene;
  rb:=1;
  popuniKontrole;
  osveziNavigaciju;
  prikaziStatus;
end;

procedure TfrmVirman.osveziNavigaciju;
begin
  if (rb=1) or (rb=0) then
  begin
    btnPrvi.Enabled:=False;
    btnPrethodni.Enabled:=False;
  end
  else
  begin
    btnPrvi.Enabled:=True;
    btnPrethodni.Enabled:=True;
  end;

  if rb>=total then
  begin
    btnPoslednji.Enabled:=False;
    btnNaredni.Enabled:=False;
  end
  else
  begin
    btnPoslednji.Enabled:=True;
    btnNaredni.Enabled:=True;
  end;

  if editMode=emNew then
  begin
    btnNew.Enabled:=False;
    btnDelete.Enabled:=False;
  end
  else
  begin
    btnNew.Enabled:=True;
    btnDelete.Enabled:=True;
  end;

end;

procedure TfrmVirman.btnPrviClick(Sender: TObject);
begin
  idiNaPrvi;
end;

procedure TfrmVirman.btnPrethodniClick(Sender: TObject);
begin
  idiNaPrethodni;
end;

procedure TfrmVirman.btnNaredniClick(Sender: TObject);
begin
  idiNaNaredni;
end;

procedure TfrmVirman.btnPoslednjiClick(Sender: TObject);
begin
  idiNaPoslednji;
end;

procedure TfrmVirman.btnNewClick(Sender: TObject);
begin
  NoviPodatak;
end;

procedure TfrmVirman.btnDeleteClick(Sender: TObject);
begin
  IzbaciPodatak;
end;

procedure TfrmVirman.btnOKClick(Sender: TObject);
begin
  zapamtiPromene;
end;

procedure TfrmVirman.btnPrintClick(Sender: TObject);
begin
  Izvestaj;
end;

procedure TfrmVirman.snimi;
var i : Integer;
   dat : file of TVirman;
begin
  If nazivFajla='' then
  begin
    snimiKao;
    Exit;
  end;

  zapamtiPromene;

  AssignFile(dat, punNazivFajla);
  Rewrite(dat);
  for i:=0 to High(virmani) do
    with virmani[i] do
      Write(dat, virmani[i]);

  CloseFile(dat);

  prljav:=False;
end;

procedure TfrmVirman.snimiKao;
var i : Integer;
   dat : file of TVirman;
begin
  if SaveDialog.Execute then
  begin
    nazivFajla:=SaveDialog.FileName;
    punNazivFajla:=nazivFajla;
    while AnsiPos('\', nazivFajla)>0 do
    begin
      nazivFajla:=AnsiRightStr(nazivFajla, Length(nazivFajla)-AnsiPos('\', nazivFajla));
    end;
  end
  else
    Exit;

  zapamtiPromene;

  AssignFile(dat, punNazivFajla);
  Rewrite(dat);
  for i:=0 to High(virmani) do
    with virmani[i] do
      Write(dat, virmani[i]);

  CloseFile(dat);

  Caption:=nazivFajla;
  prljav:=False;
end;

procedure TfrmVirman.ucitaj(imeFajla:String='');
var dat : file;
begin
  if imeFajla='' then
  begin
    if OpenDialog.Execute then
    begin
      nazivFajla:=OpenDialog.FileName;
      punNazivFajla:=nazivFajla;
      while AnsiPos('\', nazivFajla)>0 do
      begin
        nazivFajla:=AnsiRightStr(nazivFajla, Length(nazivFajla)-AnsiPos('\', nazivFajla));
      end;
    end
    else
      Exit;
  end
  else
  begin
    punNazivFajla:=imeFajla;
    nazivFajla:=imeFajla;
    while AnsiPos('\', nazivFajla)>0 do
      begin
        nazivFajla:=AnsiRightStr(nazivFajla, Length(nazivFajla)-AnsiPos('\', nazivFajla));
      end;
  end;

  SetLength(virmani,0);
  rb:=0;
  total:=0;
  AssignFile(dat, punNazivFajla);
  Reset(dat,sizeof(TVirman));
  while not Eof(dat) do
  begin
    setLength(virmani, Length(virmani)+1);
    BlockRead(dat,virmani[rb],1);
    rb:=rb+1;
    total:=total+1;
  end;

  CloseFile(dat);

  Caption:=nazivFajla;
  prljav:=False;
  editMode:=emEdit;
  // Pozicioniraj se na prvi
  rb:=1;
  popuniKontrole;
  osveziNavigaciju;
  prikaziStatus;

end;

procedure TfrmVirman.novi;
begin
  SetLength(virmani,0);
  rb:=0;
  total:=0;
  NoviPodatak;
  osveziNavigaciju;
  prikaziStatus;
  nazivFajla:='';
  punNazivFajla:='';
  temp:=true;
  Caption:='Neimenovan *';
  prljav:=False;
end;

procedure TfrmVirman.Novi1Click(Sender: TObject);
begin
  novi;
end;

procedure TfrmVirman.Otvori1Click(Sender: TObject);
begin
  ucitaj;
end;

procedure TfrmVirman.Snimi1Click(Sender: TObject);
begin
  snimi;
end;

procedure TfrmVirman.Snimikao1Click(Sender: TObject);
begin
  snimiKao;
end;

procedure TfrmVirman.Izai1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmVirman.tampaj1Click(Sender: TObject);
begin
  Izvestaj;
end;

procedure TfrmVirman.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  case Msg.CharCode of
  VK_F5 :
    begin
      if btnNew.Enabled then
        btnNewClick(nil);
      Handled:=True;
    end;
  VK_F6 :
    begin
      if btnOK.Enabled then
        btnOKClick(nil);
      Handled:=True;
    end;
  VK_F7 :
    begin
      snimi;
      Handled:=True;
    end;
  VK_F8 :
    begin
      Izvestaj;
      Handled:=True;
    end;
  end;
end;

end.
