unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFrmPrincipal = class(TForm)
    LytToolBar: TLayout;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    LytPesquisa: TLayout;
    StyleBook: TStyleBook;
    RectPesquisa: TRectangle;
    Edit11: TEdit;
    Image3: TImage;
    Button1: TButton;
    lytSwitch: TLayout;
    RectSwitch: TRectangle;
    Rectangule1: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    LVMercado: TListView;
    ImgShop: TImage;
    ImgTaxa: TImage;
    ImgPedidoMin: TImage;
    procedure FormShow(Sender: TObject);
  private
    procedure AddMercadoLv(id_mercado: integer; nome, endereco: string;
      tx_entrega, vl_Min_ped: double);
    procedure ListarMercados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure  TFrmPrincipal.AddMercadoLv(id_mercado: integer;
                                      nome, endereco: string;
                                      tx_entrega,vl_Min_ped: double);
var
   img: TListItemImage;
   txt: TListItemText;
begin
  with LVMercado.Items.Add do
  begin
    Height := 115;
    Tag    := id_mercado;

    img := TListItemImage(Objects.FindDrawable('imgShop'));
    img.Bitmap := imgShop.Bitmap;

    img := TListItemImage(Objects.FindDrawable('imgTaxa'));
    img.Bitmap := imgTaxa.Bitmap;

    img := TListItemImage(Objects.FindDrawable('imgPedidoMin'));
    img.Bitmap := imgPedidoMin.Bitmap;

    txt := TListItemText(Objects.FindDrawable('txtNome'));
    txt.Text := nome;

    txt := TListItemText(Objects.FindDrawable('txtEndereco'));
    txt.Text := endereco;

    txt := TListItemText(Objects.FindDrawable('txtTaxa'));
    txt.Text := 'Taxa de entrega: ' + FormatFloat('R$ #,##0.00', tx_entrega);

    txt := TListItemText(Objects.FindDrawable('txtCompraMin'));
    txt.Text := 'Compra mínima: ' + FormatFloat('R$ #,##0.00', vl_min_ped);

  end;
end;

procedure TFrmPrincipal.ListarMercados;
begin
  AddMercadoLv(1, 'Pão de Açucar', 'Av. Paulista. 1500' , 10, 50);
  AddMercadoLv(1, 'Extra', 'Av. Cruz Cabugá. 100' , 10, 40);
  AddMercadoLv(1, 'Coop', 'Av. Dr. Rudge Ramos. 500' , 10, 70);
  AddMercadoLv(1, 'Mercadinho Mr.Paulo', 'Av. Recife. 300' , 10, 50);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  ListarMercados;
end;

end.
