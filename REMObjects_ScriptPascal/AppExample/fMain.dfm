object Form1: TForm1
  Left = 292
  Top = 240
  Caption = 'RemObjects Pascal Script - Test Application'
  ClientHeight = 314
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 222
    Width = 569
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 234
    ExplicitWidth = 577
  end
  object Memo2: TMemo
    Left = 0
    Top = 225
    Width = 569
    Height = 89
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
  end
  object Memo1: TSynEdit
    Left = 0
    Top = 0
    Width = 569
    Height = 222
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 1
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Highlighter = synpsyn1
    Lines.Strings = (
      'program Test;'
      ''
      'const'
      #9'ALTURA_BARRA_TITULO '#9'= 20;'
      #9'ESPACAMENTO '#9#9'= 10;'
      #9'TAMANHO_BORDA '#9#9'= 4;'
      
        #9'AMOSTRAGEM_ARQUIVO '#9'= '#39'D:\Projetos_D16\TestApp\Plantio_13_2_201' +
        '37_28_57.txt'#39';'
      '  '
      'var'
      #9't '#9#9#9': TForm;'
      #9'l '#9#9#9': TLabel;'
      #9'b '#9#9#9': TButton;'
      ' '#9'btnListarArquivos'#9': TButton;'
      #9'p '#9#9#9': TPanel;'
      #9'mmO '#9#9#9': TMemo;'
      #9'mmP '#9#9#9': TMemo;'
      #9'mmR '#9#9#9': TMemo;'
      ''
      '//'#9'rec'#9': Record'
      '//'#9#9'tt : string;'
      '//'#9'end;'
      ''
      'procedure ExibirListaArquivos(Sender: TObject);'
      'var'
      '   i : Integer;'
      '   str : string;'
      '   strArquivo : string;'
      '   stlLista   : TStringList;'
      'begin'
      '     str := ExtractFilePath(AMOSTRAGEM_ARQUIVO);'
      
        '     strArquivo := StringReplace(AMOSTRAGEM_ARQUIVO, str, '#39'---> ' +
        #39', [rfReplaceAll]);'
      '//     ShowMessage(str + #13+ strArquivo);'
      
        '     ShowMessage('#39'Diretorio selecionado: '#39'+ str+ #13+ '#39'Arquivo a' +
        ' carregar: '#39'+ strArquivo);'
      '     '
      '     stlLista := TStringList.Create;'
      '     stlLista.Assign(ListarArquivos(str, '#39'*.*'#39'));'
      '     mmP.Lines.BeginUpdate;'
      '     mmP.Lines.Clear;'
      '     for i := 0 to stlLista.Count - 1 do'
      '     begin'
      '          mmP.Lines.Add(stlLista[i]);'
      '     end;'
      '     mmP.Lines.EndUpdate;'
      
        '     ShowMessage('#39'Numero de arquivos: '#39' + IntToStr(stlLista.Coun' +
        't));'
      '     stlLista.Free;'
      'end;'
      ''
      'procedure SepararDados(Sender: TObject);'
      'var'
      #9'intLinha    '#9': Integer;'
      ' '#9'strHora     '#9': string;'
      '        strData '#9': string;'
      '        sl'#9'        : TStringList;'
      'begin'
      #9'// sl.Delimiter := '#39';'#39
      #9'// MyWriteln(TButton(Sender).Caption);'
      #9'// MyWriteLn('#39'Numero de itens: '#39'+ inttostr(sl.Count));'
      #9'// sl.delimiter := '#39':'#39';'
      #9'sl := TStringList.Create;'
      ''
      #9'mmO.Lines.BeginUpdate;'
      #9'mmP.Lines.BeginUpdate;'
      #9'mmR.Lines.BeginUpdate;'
      #9'mmP.Lines.Clear;'
      #9'mmR.Lines.Clear;'
      #9'sl.BeginUpdate;'
      ''
      #9'// Separar os dados'
      '//'#9'mmP.Lines.Add('#39'Questoes...'#39');'
      '//'#9'mmR.Lines.Add('#39'Respostas...'#39');'
      '//'#9'mmP.Lines.Add('#39'...'#39');'
      '//'#9'mmR.Lines.Add('#39'...'#39');'
      #9'for intLinha := 0 to mmO.Lines.Count - 1 do'
      #9'begin'
      #9#9'if Pos('#39':'#39', mmO.Lines[intLinha]) > 0 then'
      #9#9'begin'
      
        #9#9#9'// Com INSERT vc define em qual linha quer colocar o conteudo' +
        ' no MEMO'
      
        #9#9#9'mmP.Lines.Insert( intLinha, copy( mmO.Lines[intLinha], 0, Pos' +
        '('#39':'#39', mmO.Lines[intLinha])-1 ) );'
      '        '#9#9
      '        '#9#9'if UpperCase(mmP.Lines[intLinha]) = '#39'DATA'#39' then'
      '            '#9#9'begin'
      
        '            '#9#9#9'    strData := copy( mmO.Lines[intLinha], Pos('#39':'#39 +
        ', mmO.Lines[intLinha])+1, length(mmO.Lines[intLinha]));'
      
        '                                    mmR.Lines.Add( formatdatetim' +
        'e('#39'DD/MM/YYYY'#39', strtodate(strData) ));'
      '                                    Continue;'
      '                '#9'end;'
      ''
      
        '                        if UpperCase(mmP.Lines[intLinha]) = '#39'HOR' +
        'A'#39' then'
      '            '#9#9'begin'
      
        '            '#9#9#9'    strHora := copy( mmO.Lines[intLinha], Pos('#39':'#39 +
        ', mmO.Lines[intLinha])+1, length(mmO.Lines[intLinha]));'
      
        '                                    mmR.Lines.Add( formatdatetim' +
        'e('#39'HH:MM:SS'#39', strtotime(strHora) ));'
      '                                    Continue;'
      '                '#9'end;'
      ''
      
        '                       '#9'// Com ADD serah inserido na ultima linh' +
        'a do MEMO'
      
        #9#9#9'mmR.Lines.Add( copy( mmO.Lines[intLinha], Pos('#39':'#39', mmO.Lines[' +
        'intLinha])+1, length(mmO.Lines[intLinha]) ) );'
      #9#9'end;'
      #9'end;'
      #9'mmO.Lines.EndUpdate;'
      #9'mmP.Lines.EndUpdate;'
      #9'mmR.Lines.EndUpdate;'
      #9'sl.EndUpdate;'
      #9'sl.Free;'
      'end;'
      ''
      ''
      '//'
      '//  PROGRAMACAO PRINCIPAL'
      '//'
      'begin'
      
        #9'if messagedlg('#39'Continuar a aplica'#231#227'o?'#39', mtConfirmation, [mbYes,' +
        ' mbNo], 0) = mrNo then'
      '        begin'
      '           ShowMessage('#39'Aplica'#231#227'o encerrada.'#39');'
      '           Exit;'
      '        end;   '
      '        t := TForm.Create(Self);'
      
        #9't.Caption := '#39'Sistema Exemplo - Se houver melhorias, por favor,' +
        ' poste no grupo DELPHI-BR do Yahoo'#39';'
      #9't.left := (Application.MainForm.ClientWidth div 2);'
      #9't.Position := poScreenCenter;'
      #9't.Height := 550;'
      #9't.Width := 600;'
      ''
      #9'l := TLabel.Create(t);'
      #9'l.Parent := t;'
      
        #9'l.caption := '#39'Sistema de exemplo dos componentes REMObject - Sc' +
        'riptPascal'#39';'
      '//'#9'l.Font.Style := l.Font.Style.fsBold;  // Nao sei como fazer '
      '        l.Left := (l.Width div 2) - ESPACAMENTO;'
      #9'l.Top := ESPACAMENTO;'
      ''
      #9'// Criar um PANEL'
      #9'p := TPanel.Create(t);'
      #9'p.parent := t;'
      #9'p.Top := l.Top + l.Height + ESPACAMENTO; //Abaixo do label;'
      #9'p.Width := t.Width - ESPACAMENTO - TAMANHO_BORDA;'
      
        #9'p.Height := (t.Height - p.Top - ALTURA_BARRA_TITULO - ESPACAMEN' +
        'TO);'
      #9'p.Left := ((t.Width - p.Width) div 2) - TAMANHO_BORDA;'
      ''
      #9'// Um BOTAO no centro do panel'
      #9'b := TButton.Create(t);'
      #9'b.Parent := p;'
      #9'b.width := 150;'
      #9'b.height := 30;'
      #9'b.left := p.width - ESPACAMENTO - b.width;'
      #9'b.top := p.height - ALTURA_BARRA_TITULO - b.Height + 5;'
      #9'b.visible := True;'
      #9'b.caption := '#39'Separar os Dados'#39';'
      
        #9'b.enabled := not (UpperCase(l.Caption) = '#39'D'#39'); // Quero desabil' +
        'itar este botao caso o LABEL acima seja "D"'
      #9'b.OnClick := @SepararDados;'
      ''
      #9'// Um BOTAO no centro do panel'
      #9'btnListarArquivos '#9#9':= TButton.Create(t);'
      #9'btnListarArquivos.Parent '#9':= p;'
      #9'btnListarArquivos.width '#9':= 100;'
      #9'btnListarArquivos.height '#9':= 30;'
      #9'btnListarArquivos.left '#9#9':= ESPACAMENTO;'
      
        #9'btnListarArquivos.top '#9#9':= p.height - ALTURA_BARRA_TITULO - b.H' +
        'eight + 5;'
      #9'btnListarArquivos.visible '#9':= True;'
      #9'btnListarArquivos.caption '#9':= '#39'Listar Arquivos'#39';'
      
        #9'btnListarArquivos.enabled '#9':= True; // Quero desabilitar este b' +
        'otao caso o LABEL acima seja "D"'
      #9'btnListarArquivos.OnClick '#9':= @ExibirListaArquivos;'
      ''
      #9'mmO := TMemo.Create(p);'
      #9'mmO.Parent := p;'
      #9'mmO.ScrollBars := ssVertical;'
      #9'mmO.Lines.Add('#39'Arquivo: '#39'+ AMOSTRAGEM_ARQUIVO+ '#39' carregado'#39');'
      #9'mmO.Lines.LoadFromFile(AMOSTRAGEM_ARQUIVO);'
      #9'mmO.Left := ESPACAMENTO;'
      #9'mmO.Top := ESPACAMENTO;'
      
        #9'mmO.Height := (p.height div 2) - ALTURA_BARRA_TITULO - b.height' +
        ' - ESPACAMENTO;'
      #9'mmO.Width := p.width - ESPACAMENTO - 15;'
      ''
      #9'mmP := TMemo.Create(p);'
      #9'mmP.Parent := p;'
      #9'mmP.ScrollBars := ssVertical;'
      #9'mmP.Left := ESPACAMENTO;'
      #9'mmP.Top := ESPACAMENTO + mmo.height + 10;'
      
        #9'mmP.Height := (p.height div 2) - ALTURA_BARRA_TITULO - b.height' +
        ' - ESPACAMENTO;'
      #9'mmP.Width := (p.width div 2) - ESPACAMENTO - 15;'
      ''
      #9'mmR := TMemo.Create(p);'
      #9'mmR.Parent := p;'
      #9'mmR.ScrollBars := ssVertical;'
      #9'mmR.Left := mmP.width + ESPACAMENTO + 15;'
      #9'mmR.Top := ESPACAMENTO + mmo.height + 10;'
      
        #9'mmR.Height := (p.height div 2) - ALTURA_BARRA_TITULO - b.height' +
        ' - ESPACAMENTO;'
      
        #9'mmR.Width := mmO.width - ((p.width div 2) - ESPACAMENTO - 15) -' +
        ' 15;'
      ''
      #9't.ShowModal;'
      '        t.Free;'
      'end.')
    WantTabs = True
  end
  object MainMenu1: TMainMenu
    Left = 240
    Top = 8
    object Program1: TMenuItem
      Caption = '&Program'
      object Compile1: TMenuItem
        Caption = '&Compile'
        ShortCut = 120
        OnClick = Compile1Click
      end
      object mnpN1: TMenuItem
        Caption = '-'
      end
      object mnpSair1: TMenuItem
        Caption = 'Sair'
        OnClick = mnpSair1Click
      end
    end
  end
  object PSScript: TPSScript
    CompilerOptions = []
    OnCompile = PSScriptCompile
    OnExecute = PSScriptExecute
    OnCompImport = PSScriptCompImport
    OnExecImport = PSScriptExecImport
    Plugins = <
      item
        Plugin = psmprt_cls1
      end
      item
        Plugin = psmprt_dtls1
      end
      item
        Plugin = psmprt_cntrls1
      end
      item
        Plugin = psi_std_1
      end
      item
        Plugin = psdlplgn_DLL
      end>
    UsePreProcessor = False
    Left = 312
    Top = 8
  end
  object psi_std_1: TPSImport_StdCtrls
    EnableExtCtrls = True
    EnableButtons = True
    Left = 368
    Top = 168
  end
  object psmprt_cls1: TPSImport_Classes
    EnableStreams = True
    EnableClasses = True
    Left = 368
    Top = 8
  end
  object psmprt_dtls1: TPSImport_DateUtils
    Left = 368
    Top = 56
  end
  object psmprt_cntrls1: TPSImport_Controls
    EnableStreams = True
    EnableGraphics = True
    EnableControls = True
    Left = 368
    Top = 112
  end
  object psdlplgn_DLL: TPSDllPlugin
    Left = 368
    Top = 232
  end
  object synpsyn1: TSynPasSyn
    Left = 240
    Top = 56
  end
end
