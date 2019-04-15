unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TTreeView = class(Vcl.ComCtrls.TTreeView)
  public
    procedure CreateParams(var Params: TCreateParams); override;
  end;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  CommCtrl;

{ TTreeView }
procedure TTreeView.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style or TVS_CHECKBOXES;
end;

procedure TForm1.Button1Click(Sender: TObject);
const
  TVIS_CHECKED = $2000;
var
  i: integer;
  Item: TTVItem;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    with Item do
    begin
      mask := TVIF_STATE or TVIF_HANDLE;
      hItem := TreeView1.Items[i].ItemId;
      if TreeView_GetItem(TreeView1.Items[i].Handle, Item) then
        if (State and TVIS_CHECKED) <> 0 then
          ShowMessage(TreeView1.Items[i].Text + ' checked')
        else
          ShowMessage(TreeView1.Items[i].Text + ' unchecked');
    end;
end;

end.
