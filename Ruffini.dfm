object Form1: TForm1
  Left = 189
  Top = 178
  Width = 772
  Height = 488
  Caption = 'C'#225'lculo de Ra'#237'ces'
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 264
    Top = 8
    Width = 272
    Height = 30
    Caption = 'C'#225'lculo de Ra'#237'ces'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Algerian'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Funcion: TImage
    Left = 424
    Top = 56
    Width = 321
    Height = 313
  end
  object Label6: TLabel
    Left = 16
    Top = 424
    Width = 42
    Height = 16
    Caption = 'Sumas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 112
    Top = 424
    Width = 86
    Height = 16
    Caption = 'Multiplicaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSumas: TLabel
    Left = 64
    Top = 424
    Width = 3
    Height = 13
  end
  object lblMultiplicaciones: TLabel
    Left = 208
    Top = 424
    Width = 3
    Height = 13
  end
  object Label8: TLabel
    Left = 424
    Top = 384
    Width = 53
    Height = 16
    Caption = 'Escala X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 536
    Top = 384
    Width = 53
    Height = 16
    Caption = 'Escala Y'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 248
    Top = 424
    Width = 32
    Height = 16
    Caption = 'Ra'#237'z:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblRaiz: TLabel
    Left = 288
    Top = 424
    Width = 3
    Height = 13
  end
  object Mensaje: TLabel
    Left = 568
    Top = 436
    Width = 3
    Height = 13
  end
  object Imprimir: TButton
    Left = 343
    Top = 76
    Width = 66
    Height = 33
    Cursor = crHandPoint
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ImprimirClick
  end
  object Salir: TButton
    Left = 343
    Top = 156
    Width = 66
    Height = 32
    Cursor = crHandPoint
    Caption = 'Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = SalirClick
  end
  object StringGrid1: TStringGrid
    Left = 17
    Top = 208
    Width = 392
    Height = 97
    Color = clMenu
    FixedColor = clCream
    FixedCols = 0
    RowCount = 32
    TabOrder = 2
    ColWidths = (
      43
      68
      60
      99
      97)
  end
  object GroupBox1: TGroupBox
    Left = 232
    Top = 48
    Width = 97
    Height = 145
    TabOrder = 3
    object Label5: TLabel
      Left = 18
      Top = 18
      Width = 60
      Height = 16
      Caption = 'FUNCI'#211'N  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbxFuncion: TListBox
      Left = 16
      Top = 42
      Width = 65
      Height = 87
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
    end
  end
  object btnGraficar: TButton
    Left = 664
    Top = 376
    Width = 81
    Height = 33
    Caption = 'Graficar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnGraficarClick
  end
  object txtEscalaX: TEdit
    Left = 480
    Top = 384
    Width = 49
    Height = 21
    TabOrder = 5
    OnKeyPress = txtEscalaXKeyPress
  end
  object txtEscalaY: TEdit
    Left = 592
    Top = 384
    Width = 49
    Height = 21
    TabOrder = 6
    OnKeyPress = txtEscalaYKeyPress
  end
  object StringGrid2: TStringGrid
    Left = 18
    Top = 320
    Width = 391
    Height = 97
    Color = clMenu
    FixedColor = clCream
    FixedCols = 0
    RowCount = 32
    TabOrder = 7
    ColWidths = (
      42
      70
      58
      98
      97)
  end
  object Borrar: TButton
    Left = 342
    Top = 115
    Width = 67
    Height = 33
    Caption = 'Borrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BorrarClick
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 48
    Width = 201
    Height = 81
    Caption = 'Ingreso de la Funci'#243'n'
    TabOrder = 9
    object Label2: TLabel
      Left = 11
      Top = 24
      Width = 65
      Height = 15
      Caption = 'N Potencias'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 61
      Height = 15
      Caption = ' N'#186' de Base'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtNPotencias: TEdit
      Left = 88
      Top = 20
      Width = 49
      Height = 21
      TabOrder = 0
      OnChange = txtNPotenciasChange
      OnKeyPress = txtNPotenciaKeyPress
    end
    object txtNBase: TEdit
      Left = 88
      Top = 52
      Width = 49
      Height = 21
      TabOrder = 1
      OnKeyPress = txtxtNBaseKeyPress
    end
    object btnAgregar: TButton
      Left = 152
      Top = 53
      Width = 33
      Height = 20
      Caption = '>>'
      TabOrder = 2
      OnClick = btnAgregarClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 136
    Width = 209
    Height = 57
    TabOrder = 10
    object rb_NewtonR: TRadioButton
      Left = 5
      Top = 16
      Width = 201
      Height = 17
      Caption = 'M'#233'todo de Newton Raphson'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
      OnClick = rb_NewtonRClick
    end
    object rb_Aproximaciones: TRadioButton
      Left = 5
      Top = 32
      Width = 193
      Height = 17
      Caption = 'M'#233'todo de Aproximaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
      OnClick = rb_AproximacionesClick
    end
  end
end
