//*******************CáLCULO DE RAÍCES *********************
//Programa que evalúa una función y busca la raíz con los...
//métodos de Newton Raphson y de Aproximaciones.
//Autora: Srta. Romero Vera Diana Lissette
//Curso: TERCERO "A"
//**********************************************************

unit Ruffini;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  TForm1 = class(TForm)
    Label4: TLabel;
    Imprimir: TButton;
    Salir: TButton;
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    lbxFuncion: TListBox;
    Funcion: TImage;
    btnGraficar: TButton;
    Label6: TLabel;
    Label7: TLabel;
    lblSumas: TLabel;
    lblMultiplicaciones: TLabel;
    Label8: TLabel;
    txtEscalaX: TEdit;
    Label9: TLabel;
    txtEscalaY: TEdit;
    StringGrid2: TStringGrid;
    Borrar: TButton;
    Label11: TLabel;
    lblRaiz: TLabel;
    GroupBox2: TGroupBox;
    Mensaje: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    txtNPotencias: TEdit;
    txtNBase: TEdit;
    btnAgregar: TButton;
    GroupBox3: TGroupBox;
    rb_NewtonR: TRadioButton;
    rb_Aproximaciones: TRadioButton;
    procedure SalirClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure txtNPotenciaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure txtNPotenciasChange(Sender: TObject);
    procedure btnGraficarClick(Sender: TObject);
    procedure txtxtNBaseKeyPress(Sender: TObject; var Key: Char);
    procedure txtEvaluar_FKeyPress(Sender: TObject; var Key: Char);
    procedure txtEscalaXKeyPress(Sender: TObject; var Key: Char);
    procedure txtEscalaYKeyPress(Sender: TObject; var Key: Char);
    procedure txtEvaluar_F1KeyPress(Sender: TObject; var Key: Char);
    procedure BorrarClick(Sender: TObject);
    procedure rb_AproximacionesClick(Sender: TObject);
    procedure rb_NewtonRClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type
  Vector_Potencia= array [0..25] of Double;
  Vector_A= array[0..25] of Double;
  Vector_B= array [0..25] of Double;
  Vector_Suma= array [0..25] of Double;
  Vector_A1=array[0..25] of Double;

var  //Variables globales
  Form1: TForm1;
  N_Potencias: Integer;
  Potencia: Integer;
  VectorA: Vector_A;
  VectorB: Vector_B;
  VectorSuma: Vector_Suma;
  VectorA1: Vector_A1;
  Aux: Double;
  sumas:Integer;
  multiplicaciones: Integer;
  valor_inicial: Integer;
  valor_final: integer;
  Xn: Double;
  NPotencia: Integer;

implementation

{$R *.dfm}

// _________________________
//|Al cargarse el Formulario|
//'''''''''''''''''''''''''''
procedure TForm1.FormCreate(Sender: TObject);
var origenx, origeny: integer;
begin
    txtNBase.Enabled:=False;
    Potencia:=1;
    aux:=0;
    sumas:=0;
    multiplicaciones:=0;

     with Funcion.Canvas do //Hoja es una TImage en este caso
     begin
      origenx:= Trunc(Funcion.Width/2); //establezco el origen (0,0) en la mitad de la hoja
      origeny:= Trunc(Funcion.Height/2);
      MoveTo(origenx,0); //dibujo los ejes
      LineTo(origenx,Funcion.Height);
      MoveTo(0,origeny);
      LineTo(Funcion.Width,origeny);
    end;
end;

// ____________________
//|Ingreso de Potencias|
//'''''''''''''''''''''
procedure TForm1.txtNPotenciaKeyPress(Sender: TObject; var Key: Char);
begin
      //Si se ingresan caracteres no permitidos muestra un mensaje de error
  if ((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
      txtNBase.Enabled:=True;
      txtEscalaX.Text:='10';
      txtEscalaY.Text:='10';
end;

// _______________________________
//|Cuando se ingresa una Potencias|
//''''''''''''''''''''''''''''''''
procedure TForm1.txtNPotenciasChange(Sender: TObject);
begin

end;

// ____________________
//|Ingreso de las Bases|
//'''''''''''''''''''''
procedure TForm1.txtxtNBaseKeyPress(Sender: TObject; var Key: Char);
begin
  //Si se ingresan caracteres no permitidos muestra un mensaje de error
  if ((key<chr(16))or (key>chr(16)))and((key<chr(44))or (key>chr(45)))and((key<chr(48))or(key>chr(57)))then
  begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
  end;
end;

// ________________
//|Botón Agregar >>|
//''''''''''''''''''
procedure TForm1.btnAgregarClick(Sender: TObject);
  begin
      //Se toman los valores de base
      N_Potencias:=StrtoInt(txtNPotencias.Text);
      //Estos valores serán receptasos dependiendo de la potencia
      if (N_Potencias>=Potencia) then
      begin
        NPotencia:=(N_Potencias)-Potencia;
        //Se los agrega al ListBox
        if (txtNBase.Text<>'') then
        begin
          VectorA[Potencia-1]:=StrtoFloat(txtNBase.Text);
          lbxFuncion.Items.Add((txtNBase.Text)+'X^'+InttoStr(NPotencia));
          Potencia:=Potencia+1;
        end;
        //Si no hay un valor en el textbox se pide ingresarlo
        if (txtNBase.Text='')  then
        begin
           showmessage('Error. Debe ingresar Numero de Base');
        end;
        //Se borra el contenido del del TextBox
        txtNBase.Text:='';
      end;
end;

// ________________________________________________
//|Ingreso de Valor Inicial para Evaluar la Función|
//'''''''''''''''''''''''''''''''''''''''''''''''''
procedure TForm1.txtEvaluar_FKeyPress(Sender: TObject; var Key: Char);
begin
    //Si se ingresan caracteres no permitidos muestra un mensaje de error
      if ((key<chr(16))or (key>chr(16)))and((key<chr(44))or (key>chr(45)))and((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
end;

// ______________________________________________
//|Ingreso de Valor Final para Evaluar la Función|
//'''''''''''''''''''''''''''''''''''''''''''''''
procedure TForm1.txtEvaluar_F1KeyPress(Sender: TObject; var Key: Char);
begin
//Si se ingresan caracteres no permitidos muestra un mensaje de error
      if ((key<chr(16))or (key>chr(16)))and((key<chr(44))or (key>chr(45)))and((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
end;

// ______________
//|Botón Imprimir|
// ''''''''''''''
procedure TForm1.ImprimirClick(Sender: TObject);

  var //Variables a utilizar dentro del Botón Imprimir
  //Método Newton Raphson
  n: Integer;
  i: Integer;
  j: Integer;
  Xa: Double;
  AX: Double;
  l: Integer;
  m: Integer;
  Vueltas: Integer;
  contador: integer;
  contador1: integer;
  F_X1: Double;
  DF_X1: Double;
  //Método Aproximaciones
  Xn: Double;
  X0: Double;
  X1: Double;
  ValX0: Double;
  ValX1: Double;
  DX: Double;
  P: Integer;
  Q: Integer;
  X_poten: Double;
  V0X1_por_V1X1: Double;
  Aumenta: Integer;
  Seguir: Integer;
  Contador_ite: Integer;
  N_iteraciones: Integer;
  value: String;

  const
  Eps = 0.001;

begin

 //--------------------------------------------------------------
 //**********************Método de Newton Raphson****************
 //--------------------------------------------------------------

 if (rb_NewtonR.Checked=True) then
 begin
  //Se realiza al proceso si hay un valor de Potencias ingresado
  if (txtNPotencias.Text<>'') then
  begin
    if (NPotencia=0)then
    begin
        Xn:=1;
        Xa:=0;
        Ax:=1;
        contador:=1;
        contador1:=1;
        sumas:=0;
        multiplicaciones:=0;
        n:=N_Potencias;
        StringGrid1.RowCount:=2;
        StringGrid2.RowCount:=2;
        //Cálculo de los valores
        vueltas:=0;
        while(Ax>Eps) do
        begin
        vueltas:=Vueltas+1;
          //Encera los vectores B y de Suma
          for i := 0 to (n-1) do
          begin
            VectorB[i] := 0;
            VectorSuma[i] := 0;
          end;
          aux:=0;
          //Proceso calcula los valores del rango de numeros de evaluaciòn
          for j := 0 to (n-1) do
          begin
            VectorB[j]:=(Xa*aux);
            aux := VectorA[j]+VectorB[j];
            VectorSuma[j] := aux + VectorSuma[j];
            sumas:=sumas+1;
            multiplicaciones:=multiplicaciones+1;
            //Mostrar los datos
            StringGrid1.Cells[0,j+contador]:=FloattoStr(VectorA[j]);
            StringGrid1.Cells[1,j+contador]:=FloattoStr(Xa);
            StringGrid1.Cells[2,j+contador]:=FloattoStr(n-j-1);
            StringGrid1.Cells[3,j+contador]:=FloattoStr(VectorB[j]);
            StringGrid1.Cells[4,j+contador]:=FloattoStr(VectorSuma[j]);
            //Aumentar una Fila
            StringGrid1.RowCount := StringGrid1.RowCount + 1;
          end;
          F_X1:=VectorSuma[n-1];
          //Primera derivada
          for l := 0 to (n-1) do
          begin
            VectorA1[l]:=VectorSuma[l];
            VectorB[l] := 0;
            VectorSuma[l] := 0;
          end;
          VectorA1[n-1]:=0;
          aux:=0;

          //Proceso calcula los valores del rango de numeros de evaluaciòn
          for m := 0 to (n-1) do
          begin
            VectorB[m]:=(Xa*aux);
            aux := VectorA1[m]+VectorB[m];
            VectorSuma[m] := aux + VectorSuma[m];
            //Mostrar los datos
            StringGrid2.Cells[0,m+contador1]:=FloattoStr(VectorA1[m]);
            StringGrid2.Cells[1,m+contador1]:=FloattoStr(Xa);
            StringGrid2.Cells[2,m+contador1]:=FloattoStr(n-m-1);
            StringGrid2.Cells[3,m+contador1]:=FloattoStr(VectorB[m]);
            StringGrid2.Cells[4,m+contador1]:=FloattoStr(VectorSuma[m]);
            //Aumentar una Fila
            StringGrid2.RowCount := StringGrid2.RowCount + 1;
          end;
          contador:=contador+n;
          contador1:=contador1+n-1;
          DF_X1:=VectorSuma[n-2];
          Xn:=Xa-(F_X1/DF_X1);
          if vueltas>2 then
          begin
          //Ax:=Xn-Xa;
          Ax:=Xa-Xn;
          end;
          Xa:=Xn;
        end;
        //Mostrar el Nº de Sumas y Multiplicaciones
        lblSumas.Caption:=IntToStr(sumas);
        lblMultiplicaciones.Caption:=IntToStr(multiplicaciones);
        lblRaiz.Caption:=FloatToStr(Xn);
    end;
  end;
  //si no hay un número de potencias ingresado se lo pide ingresar
  if (txtNPotencias.Text='') then
  begin
    showmessage('Error. Debe ingresar el Numero de Potencias >0');
  end;
 end;

 //--------------------------------------------------------------
 //*********************** Método de Aproximaciones**************
 //--------------------------------------------------------------

 if (rb_Aproximaciones.Checked=True) then
 begin
   if (txtNPotencias.Text<>'') then
   begin
    if (NPotencia=0)then
    begin
        Xn:=1;
        X0:=0;
        X1:=0;
        ValX0:=0;
        ValX1:=0;
        DX:=1;
        V0X1_por_V1X1:=0;
        Seguir:=1;
        N_iteraciones:=100000;
        Contador_Ite:=0;
        n:=N_Potencias;
        aumenta:=1;
        StringGrid1.RowCount:=2;
        //Cálculo de los valores
        vueltas:=0;
        while(Xn>=Eps) do
        begin
          for P := 0 to (n-1) do
          begin
            X_poten:=1;
            //Proceso calcula los valores del rango de numeros de evaluaciòn
            for Q := 0 to (n-P-2) do
            begin
              X_poten:=X_poten*X1;
            end;
            ValX1:=ValX1+(VectorA[P]*X_poten);
            V0X1_por_V1X1:=ValX0*ValX1;
            //Mostrar los datos
          end;
            if Contador_Ite>0 then
            begin
              StringGrid1.Cells[0,aumenta]:=FloattoStr(X0);
              StringGrid1.Cells[1,aumenta]:=FloattoStr(ValX0);
              StringGrid1.Cells[2,aumenta]:=FloattoStr(X1);
              StringGrid1.Cells[3,aumenta]:=FloattoStr(ValX1);
              StringGrid1.Cells[4,aumenta]:=FloattoStr(V0X1_por_V1X1);
              //Aumentar una Fila
              StringGrid1.RowCount := StringGrid1.RowCount + 1;
              aumenta:=aumenta+1;
              if (V0X1_por_V1X1)<=0 then
              begin
                DX:=DX/10;
                X1:=X0;
                ValX1:=ValX0;
              end;
            end;
          ValX0:=ValX1;
          ValX1:=0;
          X0:=X1;
          X1:=X1+DX;
          Xn:=DX;
          Contador_ite:=Contador_ite+1;
          if ((Dx=1)and(Contador_ite=N_iteraciones)) then
          begin
            showmessage('Se recorrió '+IntToStr(contador_ite)+' posiciones en el Eje X y no se ha encontrado la raíz.');
            Xn:=Eps-(0.001);
            X0:=0;
          end;
        end;
        lblSumas.Caption:='';
        lblMultiplicaciones.Caption:='';
        lblRaiz.Caption:=FloatToStr(X0);
     end;
  end;
  //si no hay un número de potencias ingresado se lo pide ingresar
  if (txtNPotencias.Text='') then
  begin
    showmessage('Error. Debe ingresar el Numero de Potencias >0');
  end;
 end;

 if (rb_NewtonR.Checked=true and rb_Aproximaciones.Checked=true) then
 begin
    showmessage('No ha seleccionado ninguna Función');
 end;
end;


// ____________
//|Botón Borrar|
// ''''''''''''
procedure TForm1.BorrarClick(Sender: TObject);
var //variables a utilizar en el botón borrar
  i: integer;
  origenx:integer;
  origeny:integer;

begin
    Potencia:=1;
    aux:=0;
    sumas:=0;
    multiplicaciones:=0;

    //Encerar vectores
    for i := 0 to (N_Potencias-1) do
    begin
      VectorA[i]:=0;
      VectorB[i] := 0;
      VectorSuma[i] := 0;
    end;
    //Encerar cuadros de ingresos de datos
    txtNPotencias.Text:='';
    txtNBase.Text:='';
    lbxFuncion.Clear;

    //Limpiar el StringGrid
    for I := 1 to StringGrid1.RowCount - 1 do
    begin
      StringGrid1.Rows[i].Clear;
      StringGrid2.Rows[i].Clear;
    end;
    StringGrid1.Cells[0,0]:='';
    StringGrid1.Cells[1,0]:='';
    StringGrid1.Cells[2,0]:='';
    StringGrid1.Cells[3,0]:='';
    StringGrid1.Cells[4,0]:='';

    StringGrid2.Cells[0,0]:='';
    StringGrid2.Cells[1,0]:='';
    StringGrid2.Cells[2,0]:='';
    StringGrid2.Cells[3,0]:='';
    StringGrid2.Cells[4,0]:='';

    //Numero de Filas del StringGrind
    StringGrid1.RowCount:=5;
    StringGrid2.RowCount:=5;

    //Limpiar la Gráfica
    Funcion.Picture := nil;
    with Funcion.Canvas do //Hoja es una TImage en este caso
    begin
      origenx:= Trunc(Funcion.Width/2); //establezco el origen (0,0) en la mitad de la hoja
      origeny:= Trunc(Funcion.Height/2);
      MoveTo(origenx,0); //dibujo los ejes
      LineTo(origenx,Funcion.Height);
      MoveTo(0,origeny);
      LineTo(Funcion.Width,origeny);
    end;
end;

// _________________________
//|Ingreso de valor Escala X|
//''''''''''''''''''''''''''
procedure TForm1.txtEscalaXKeyPress(Sender: TObject; var Key: Char);
begin
    //Si se ingresan caracteres no permitidos muestra un mensaje de error
      if ((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
end;

// _________________________
//|Ingreso de valor Escala Y|
//''''''''''''''''''''''''''
procedure TForm1.txtEscalaYKeyPress(Sender: TObject; var Key: Char);
begin
    //Si se ingresan caracteres no permitidos muestra un mensaje de error
      if ((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
end;

// _______________
//|Botón Graficar|
//''''''''''''''''
procedure TForm1.btnGraficarClick(Sender: TObject);
var escx,escy, cont: integer;
origenx,origeny,i,j,k,l,m,red1,aum1,red2,aum2: integer;
X_elevado,val,x,fx: Double;
const
Valor=50;
begin
    //escx:= StrtoInt(txtEvaluar_F.Text);
    escx:=StrtoInt(txtEscalaX.Text) ;
    //escy:= escx*(-1);
    escy:=StrtoInt(txtEscalaY.Text);
    //valores para cuadrícula
    red1:=valor;
    aum1:=valor;
    red2:=valor;
    aum2:=valor;
    //Limpiar la Gráfica
    Funcion.Picture := nil;
    with Funcion.Canvas do //Hoja es una TImage en este caso
    begin
      origenx:= Trunc(Funcion.Width/2); //establezco el origen (0,0) en la mitad de la hoja
      origeny:= Trunc(Funcion.Height/2);
      //cuadrícula
      Funcion.Canvas.Pen.Color:=clWhite;
      for j:=0  to Funcion.Width do //genero el grafico en todo el ancho de TImage
      begin
            MoveTo(0,origeny+aum2);
            LineTo(Funcion.Width,origeny+aum2);
            MoveTo(0,origeny-red2);
            LineTo(Funcion.Width,origeny-red2);
            aum2:=aum2+valor;
            red2:=red2+valor;
      end;
      for m:=0  to Funcion.Width do //genero el grafico en todo el ancho de TImage
      begin
            MoveTo(origenx+aum1,0);
            LineTo(origenx+aum1,Funcion.Height);
            MoveTo(origenx-red1,0);
            LineTo(origenx-red1,Funcion.Height);
            aum1:=aum1+valor;
            red1:=red1+valor;
      end;
      //Dibujar los Ejes
      Funcion.Canvas.Pen.Color:=clBlack;
      MoveTo(origenx,0); //dibujo los ejes
      LineTo(origenx,Funcion.Height);
      MoveTo(0,origeny);
      LineTo(Funcion.Width,origeny);
      //Función
      Funcion.Canvas.Pen.Color:=clBlue;
      for i:=0  to Funcion.Width do //genero el grafico en todo el ancho de TImage
      begin
          x:= -escx + 2*escx*i/Funcion.Width; // simplemente observar los valores extremos de i
          fx:=0;
          for k:=0 to (N_Potencias) do
          begin
            cont:=N_potencias-k-2;
            X_elevado:=1;
            for l:=0 to cont do
            begin
              X_elevado:=X_elevado*x;
            end;
            val:=VectorA[k]*X_elevado;
            fx:=fx+val;
          end;
            if i = 0 then //La primera vez solo muevo
            begin
            MoveTo(0,Trunc(origeny - fx*origeny/escy));
            end;
            if i <> 0 then
            begin
            LineTo(i,Trunc(origeny - fx*origeny/escy));
            end;
      end;
end;
end;

// ___________
//|Botón Salir|
//'''''''''''''
procedure TForm1.SalirClick(Sender: TObject);
begin
    close;
end;

// __________________________________________________
//|ACTIVAR OPCIÓN DE CÁLCULO MÉTODO DE APROXIMACIONES|
//''''''''''''''''''''''''''''''''''''''''''''''''''''
procedure TForm1.rb_AproximacionesClick(Sender: TObject);
var
  G: Integer;
begin

     //Limpiar el StringGrid
     for G := 1 to StringGrid1.RowCount - 1 do
     begin
      StringGrid1.Rows[G].Clear;
      StringGrid2.Rows[G].Clear;
     end;
     //Encabezado de los StringGrid
     StringGrid1.Cells[0,0]:='  X0';
     StringGrid1.Cells[1,0]:='    ValX0';
     StringGrid1.Cells[2,0]:='  X1';
     StringGrid1.Cells[3,0]:='    ValX1';
     StringGrid1.Cells[4,0]:='    ValX0*ValX1';

     StringGrid2.Cells[0,0]:='';
     StringGrid2.Cells[1,0]:='';
     StringGrid2.Cells[2,0]:='';
     StringGrid2.Cells[3,0]:='';
     StringGrid2.Cells[4,0]:='';

     StringGrid2.Enabled:=False;
end;

// __________________________________________________
//|ACTIVAR OPCIÓN DE CÁLCULO MÉTODO DE NEWTON RAPHSON|
//''''''''''''''''''''''''''''''''''''''''''''''''''''
procedure TForm1.rb_NewtonRClick(Sender: TObject);
  var
  F: Integer;
begin

     StringGrid2.Enabled:=True;
     //Limpiar el StringGrid
     for F := 1 to StringGrid1.RowCount - 1 do
     begin
      StringGrid1.Rows[F].Clear;
      StringGrid2.Rows[F].Clear;
     end;

     //Encabezado del StringGrid
     StringGrid1.Cells[0,0]:='Nº Base';
     StringGrid1.Cells[1,0]:='Nº Evaluador';
     StringGrid1.Cells[2,0]:='  Potencia';
     StringGrid1.Cells[3,0]:='     Multiplicación';
     StringGrid1.Cells[4,0]:='           Suma';

     StringGrid2.Cells[0,0]:='Nº Base';
     StringGrid2.Cells[1,0]:='Nº Evaluador';
     StringGrid2.Cells[2,0]:='  Potencia';
     StringGrid2.Cells[3,0]:='     Multiplicación';
     StringGrid2.Cells[4,0]:='           Suma';
end;

end.
