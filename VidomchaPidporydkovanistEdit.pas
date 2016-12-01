unit VidomchaPidporydkovanistEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmVidomchaPidporydkovanistEdit = class(TForm)
    Label1: TLabel;
    edtKodVidomstva: TEdit;
    Label2: TLabel;
    edtVidomstvo: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    btnKodVidomstva: TButton;
    alVidomchaPidporydkovanistEdit: TActionList;
    aKodUpdate: TAction;
    aCancel: TAction;
    aOK: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmVidomchaPidporydkovanistEdit: TfrmVidomchaPidporydkovanistEdit;

implementation

uses
  Main, VidomchaPidporydkovanist, FinansoviSankciiEdit,
  ViluchennyZRealizaciiEdit, AdminZapobizhZahodiEdit, ShtrafiEdit,
  ObjektiEdit;

{$R *.dfm}

procedure TfrmVidomchaPidporydkovanistEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    if frmVidomchaPidporydkovanistEdit.Caption<>'���� ��������' then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmVidomchaPidporydkovanist.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    if frmVidomchaPidporydkovanistEdit.Caption<>'���� ��������' then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmVidomchaPidporydkovanist.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmObjektiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    frmMain.Enabled:=false;
    if frmVidomchaPidporydkovanistEdit.Caption<>'���� ��������' then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmObjektiEdit.Enabled:=false;
    end
    else
      frmVidomchaPidporydkovanist.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    if frmVidomchaPidporydkovanistEdit.Caption<>'���� ��������' then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmVidomchaPidporydkovanist.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    if frmVidomchaPidporydkovanistEdit.Caption<>'���� ��������' then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end
    else
      frmVidomchaPidporydkovanist.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidomchaPidporydkovanistEdit.aKodUpdateExecute(
  Sender: TObject);
begin
  with frmVidomchaPidporydkovanist do
  begin
    edtFind.Text:='';
    qVidomchaPidporydkovanist.SQL.Clear;
    qVidomchaPidporydkovanist.SQL.Text:='insert into VIDOMCHAPIDPORYDKOVANIST (KODVIDOMSTVA) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qVidomchaPidporydkovanist.Open;
    qVidomchaPidporydkovanist.SQL.Clear;
    qVidomchaPidporydkovanist.SQL.Text:='select * from VIDOMCHAPIDPORYDKOVANIST order by KODVIDOMSTVA';
    qVidomchaPidporydkovanist.Open;
    qVidomchaPidporydkovanist.Last;
    frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text:=IntToStr(qVidomchaPidporydkovanist.FieldByName('KODVIDOMSTVA').Value);
  end;
end;

procedure TfrmVidomchaPidporydkovanistEdit.aCancelExecute(Sender: TObject);
begin
  frmVidomchaPidporydkovanistEdit.Close;
end;

procedure TfrmVidomchaPidporydkovanistEdit.aOKExecute(Sender: TObject);
begin
  if frmVidomchaPidporydkovanistEdit.Caption='���� ��������' then
  begin
    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmObjektiEdit') then
    begin
      frmObjektiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;
  end;

  if frmVidomchaPidporydkovanistEdit.Caption='��������� ��������' then
  begin
    if MessageDlg('�����!'+#13+'��������� ����� ������ ���� ������������ �� ����� ���������!!!'+#13+'³��������� ������ ���� ���������!!!'+#13+'�� ����� ������ �������� ��� �����?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.SQL.Clear;
      frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.SQL.Text:='delete from VIDOMCHAPIDPORYDKOVANIST where KODVIDOMSTVA=:Kod';
      frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params.Clear;
      frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params.Add;
      frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[0].Name:='Kod';
      frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[0].Value:=frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text;
      frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Open;
      frmMain.trAzz.CommitRetaining;
    end;
    frmVidomchaPidporydkovanist.aUpdateExecute(sender);
    frmVidomchaPidporydkovanistEdit.Close;
    exit;
  end;

  if frmVidomchaPidporydkovanistEdit.Caption='����������� ��������' then
  begin
    if frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text='' then
    begin
      frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text);
    except
      frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    if frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text='' then
    begin
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.SQL.Clear;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.SQL.Text:='update VIDOMCHAPIDPORYDKOVANIST set VIDOMSTVO=:Vidomstrvo where KODVIDOMSTVA=:Kod';
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params.Clear;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params.Add;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[0].Name:='Vidomstvo';
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[0].Value:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params.Add;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[1].Name:='Kod';
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[1].Value:=frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Open;
    frmMain.trAzz.CommitRetaining;
    frmVidomchaPidporydkovanist.aUpdateExecute(sender);
    frmVidomchaPidporydkovanistEdit.Close;
    exit;
  end;

  if frmVidomchaPidporydkovanistEdit.Caption='��������� ��������' then
  begin
    if frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text='' then
    begin
      frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text);
    except
      frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    if frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text='' then
    begin
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.SQL.Clear;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.SQL.Text:='update VIDOMCHAPIDPORYDKOVANIST set VIDOMSTVO=:Vidomstrvo where KODVIDOMSTVA=:Kod';
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params.Clear;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params.Add;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[0].Name:='Vidomstvo';
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[0].Value:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params.Add;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[1].Name:='Kod';
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Params[1].Value:=frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text;
    frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Open;
    frmMain.trAzz.CommitRetaining;
    frmVidomchaPidporydkovanist.aUpdateExecute(sender);
    frmVidomchaPidporydkovanistEdit.Close;
    exit;
  end;
end;

end.
