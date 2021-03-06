unit EventSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit, CheckLst, Buttons, ADODB,
  Grids, ProfGrid, ImgList, MyPrGrid, ActnList, ComCtrls, VirtualTrees,
  Menus, StrUtils, RzBorder;

const
  LogGTmpAdd = '���������� ������� %s ��� ����� ������';
  LogGTmpEdit = '�������������� ������� %s ��� ����� ������';
  LogGTmpDop = '������: %s, �����������: %s, ���: %s, ������������: %s, ���������: %s, ���� ��: %s, �����������: %s';
  LogGTmpDel = '�������� ������� %s ��� ����� ������';

  LogMsgAdd = '���������� ����������� ��������� %s ��� ������� ����� ������ %s';
  LogMsgEdit = '�������������� ����������� ��������� %s ��� ������� ����� ������ %s';
  LogMsgDop = '�������: %s, ��������: %s, ��������: %s, ����: %s, �����: %s, ���������: %s';
  LogMsgDel = '�������� ����������� ��������� %s ��� ������� ����� ������ %s';


type
  TAirPort = record
    AP : string[6];
    AP_Name : string[30];
  end;

  TTempleteSettings = record
    COMPs, APs, TYPs : string;
    SHED, DIRECT : integer;
    BDATE, EDATE : TDateTime;
  end;

  TMsgLang = record
    lang : string[5];
    msg : string;
  end;

  TfmEventSettings = class(TForm)
    LeftPanel: TPanel;
    gbReisFilter: TGroupBox;
    RightPanel: TPanel;
    gbEventList: TGroupBox;
    gbReisList: TGroupBox;
    gbEventContent: TGroupBox;
    rgShed: TRadioGroup;
    pgEventList: TProfGrid;
    Panel1: TPanel;
    deBegin: TDateEdit;
    deEnd: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    pgTemplList: TProfGrid;
    btSave: TBitBtn;
    ilist: TImageList;
    btDelete: TBitBtn;
    ActionList1: TActionList;
    ActDelete: TAction;
    ActCompanyDel: TAction;
    ActAPDel: TAction;
    ActTypeDel: TAction;
    btAddMsg: TBitBtn;
    btDeleteMsg: TBitBtn;
    btChangeMsg: TBitBtn;
    gbBaseDelta: TGroupBox;
    BaseDelta: TDateTimePicker;
    rbBefore: TRadioButton;
    rbAfter: TRadioButton;
    Label7: TLabel;
    VTEventList: TVirtualStringTree;
    btClearMsg: TBitBtn;
    ActTemporaryTempl: TAction;
    ActMsgAdd: TAction;
    ActMsgChange: TAction;
    ActMsgDelete: TAction;
    ActMsgClear: TAction;
    ActUsedButton: TAction;
    GroupBox1: TGroupBox;
    lbLangList: TListBox;
    sbLangAddEdit: TSpeedButton;
    cbLanguage: TComboBox;
    sbLangDel: TSpeedButton;
    Label9: TLabel;
    Label11: TLabel;
    rgDirect: TRadioGroup;
    ActLangAdd: TAction;
    ActLangDel: TAction;
    pmMsgText: TPopupMenu;
    dfdfgd1: TMenuItem;
    dfgfgdfgdfdbdfd1: TMenuItem;
    dsfsgsdfgfsd1: TMenuItem;
    ActPopUpMenuAddItem: TAction;
    ActPopUpMenuDeleteItem: TAction;
    MsgText: TRichEdit;
    gbSoundInterval: TGroupBox;
    IntervalDTP: TDateTimePicker;
    cbNotUsed: TCheckBox;
    btClear: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    lbCompanyList: TListBox;
    sbAirCompanyAdd: TSpeedButton;
    sbAirCompanyDel: TSpeedButton;
    Label8: TLabel;
    lbAirList: TListBox;
    sbAirportAdd: TSpeedButton;
    sbAirportDel: TSpeedButton;
    Label6: TLabel;
    lbTypeVSList: TListBox;
    sbTypeVSAdd: TSpeedButton;
    sbTypeVSDel: TSpeedButton;
    Label4: TLabel;
    eComments: TEdit;
    Timer1: TTimer;
    RzColorPicker1: TRzColorPicker;
    Comment: TEdit;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    procedure sbAirportAddClick(Sender: TObject);
    procedure lbAirListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure clbTypeVSDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure InitAirportList(Grid : TProfGrid);
    procedure sbTypeVSAddClick(Sender: TObject);
    procedure lbTypeVSListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure sbAirCompanyAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure deBeginChange(Sender: TObject);
    procedure deEndChange(Sender: TObject);
    procedure rgShedClick(Sender: TObject);
    procedure btAddTemplateFilterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure pgTemplListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btDeleteClick(Sender: TObject);
    procedure ActDeleteUpdate(Sender: TObject);
    procedure deBeginExit(Sender: TObject);
    procedure deEndExit(Sender: TObject);
    procedure ActCompanyDelUpdate(Sender: TObject);
    procedure ActAPDelUpdate(Sender: TObject);
    procedure ActTypeDelUpdate(Sender: TObject);
    procedure ActCompanyDelExecute(Sender: TObject);
    procedure ActAPDelExecute(Sender: TObject);
    procedure ActTypeDelExecute(Sender: TObject);
    procedure pgEventListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure VTEventListGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VTEventListGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure btAddMsgClick(Sender: TObject);
    procedure rbBeforeClick(Sender: TObject);
    procedure rbAfterClick(Sender: TObject);
    procedure btChangeMsgClick(Sender: TObject);
    procedure btDeleteMsgClick(Sender: TObject);
    procedure btClearMsgClick(Sender: TObject);
    procedure ActTemporaryTemplUpdate(Sender: TObject);
    procedure cbNotUsedClick(Sender: TObject);
    procedure rgDirectClick(Sender: TObject);
    procedure VTEventListFreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure cbLanguageDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure sbLangAddEditClick(Sender: TObject);
    procedure sbLangDelClick(Sender: TObject);
    procedure lbLangListClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActMsgDeleteUpdate(Sender: TObject);
    procedure PopUpMenuAddItemClick(Sender: TObject);
    procedure PopUpMenuDeleteItemClick(Sender: TObject);
    procedure MsgTextKeyPress(Sender: TObject; var Key: Char);
    procedure MsgTextChange(Sender: TObject);
    procedure MsgTextProtectChange(Sender: TObject; StartPos,
      EndPos: Integer; var AllowChange: Boolean);
    procedure pmMsgTextPopup(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure eCommentsChange(Sender: TObject);
  private
    { Private declarations }
    fNotSaved:boolean;
    TempleteSettings : TTempleteSettings;
    COP : integer; // ��� ���������
    COP_NAME : string;
    ItemsArray : array of string;
    EditMsgMode : integer;
    procedure SetNotSaved(AValue:boolean);
    procedure GetFormParams;
    procedure SelectTemplates;
    procedure SelectTemplateParams;
    procedure InitTemplateListGrid;
    procedure InitEventsListGrid;
    procedure FillTemplateList;
    procedure FillMessageList(ARow : integer);
    procedure ClearMsgFields;
    procedure SetEventTree(direct : integer);
    procedure SetLanguageList;
    procedure ClearLanguageList;
    procedure AddLangToLangList(ALang, ALangName, AMsg : string);
    procedure GetLangListParams(var Langs, Msgs : string);
    procedure SetMsgTextPopupItems;
    function CursorOnKeyWord : boolean;
    procedure SetMainFunctionsDisabled;
  public
    { Public declarations }
    lStrings : TStrings;
    FuncEnabled:boolean;
    property NotSaved:boolean read fNotSaved write SetNotSaved;
  end;

var
  fmEventSettings: TfmEventSettings;

implementation

{$R *.dfm}

uses AirportList, Math, uDM, Utils, DB, HSDialogs,intf_access;

procedure TfmEventSettings.SetMainFunctionsDisabled;
begin
  FuncEnabled:=isAccess('ANN_EditGroupTempl','kobra_ann');
  gbReisFilter.Enabled:=FuncEnabled;
  btSave.Enabled:=FuncEnabled;
  btDelete.Enabled:=FuncEnabled;
  btClear.Enabled:=FuncEnabled;
  btAddMsg.Enabled:=FuncEnabled;
  btChangeMsg.Enabled:=FuncEnabled;
  btClearMsg.Enabled:=FuncEnabled;
  btDeleteMsg.Enabled:=FuncEnabled;
  gbEventContent.Enabled:=FuncEnabled;
  sbAirCompanyAdd.Enabled:=FuncEnabled;
  sbTypeVSAdd.Enabled:=FuncEnabled; 
  sbAirportAdd.Enabled:=FuncEnabled;
end;


procedure TfmEventSettings.SetNotSaved(AValue:boolean);
begin
  fNotSaved:=AValue;
  if fNotSaved then
  begin
    Caption:='��������� �������� ��������� ��� ����� ������ ***';
  end
  else
  begin
    Caption:='��������� �������� ��������� ��� ����� ������';
    btSave.Font.Color:=clMenuHighlight;
    btSave.Font.Style:=[];
  end;
end;

// ������� ������ � ����
function FindNodeEx(VT : TVirtualStringTree; ANode: PVirtualNode;
                    const APattern: integer): PVirtualNode;
var NextNode: PVirtualNode;
    NodeData: PDataInfo;
begin
    Result := nil;
    NextNode := ANode.FirstChild;
    if Assigned(NextNode) then
    repeat
        NodeData := VT.GetNodeData(NextNode);
        if Assigned(NodeData) then
        begin
            if Assigned(NodeData^.ExData) and (High(NodeData^.ExData) >= 1) then
            if (Integer(NodeData^.ExData[1]) = APattern) then // �������
            begin
                Result := NextNode;
                Exit;
            end;
        end;

        Result := FindNodeEx(VT, NextNode, APattern);
        if Assigned(Result) then exit;

        // ��������� �� �������� �����
        NextNode := NextNode.NextSibling;
    until
        NextNode = nil;
end;

procedure TfmEventSettings.InitAirportList(Grid : TProfGrid);
begin
//
end;

procedure TfmEventSettings.sbAirportAddClick(Sender: TObject);
var pnt : TPoint;
   // str : string;
    SP : TADOStoredProc;
begin
    Cursor:=crHourGlass;
    Application.ProcessMessages;
    pnt.X := 0;
    pnt.Y := 0;
    pnt := (Sender as TSpeedButton).ClientToScreen(pnt);

    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_GetApListGR';
        Parameters.Refresh;
        // Parameters.ParamByName('@id_lang').Value := 1;

        if TfmAirportList.MyShowModal(lbAirList.Items, Rect(pnt.X,
                                                            pnt.Y,
                                                            pnt.X + (Sender as TSpeedButton).Width,
                                                            pnt.Y + (Sender as TSpeedButton).Height),
                                                            SP,
                                                            nil,
                                                            '������ ����������') > 0 then SelectTemplateParams;
    finally
        Free;
    end;
    Cursor:=crDefault;
    Application.ProcessMessages; 
    lbAirList.SetFocus;
    NotSaved:=true;
end;

procedure TfmEventSettings.lbAirListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
    (Control as TListBox).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, (Control as TListBox).Items.ValueFromIndex[Index]);
end;

procedure TfmEventSettings.clbTypeVSDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
    (Control as TCheckListBox).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top,
                                                (Control as TCheckListBox).Items.ValueFromIndex[Index]);
end;

procedure TfmEventSettings.sbTypeVSAddClick(Sender: TObject);
var //i : integer;
    pnt : TPoint;
    //str : string;
    SP : TADOStoredProc;
begin
    Cursor:=crHourGlass;
    Application.ProcessMessages;
    pnt.X := 0;
    pnt.Y := 0;
    pnt := (Sender as TSpeedButton).ClientToScreen(pnt);

    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_GetTypeVSList';
        Parameters.Refresh;

        if TfmAirportList.MyShowModal(lbTypeVSList.Items, Rect(pnt.X,
                                                                pnt.Y,
                                                                pnt.X + (Sender as TSpeedButton).Width,
                                                                pnt.Y + (Sender as TSpeedButton).Height),
                                                                SP,
                                                                nil,
                                                                '������ ����� ��') > 0 then SelectTemplateParams;
    finally
        Free;

    end;
    Cursor:=crDefault;
    Application.ProcessMessages; 
    lbTypeVSList.SetFocus;
    NotSaved:=true;
end;

procedure TfmEventSettings.lbTypeVSListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
    (Control as TListBox).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, (Control as TListBox).Items.ValueFromIndex[Index]);
end;

procedure TfmEventSettings.sbAirCompanyAddClick(Sender: TObject);
var //i : integer;
    pnt : TPoint;
   // str : string;
    SP : TADOStoredProc;
begin
    Cursor:=crHourGlass;
    Application.ProcessMessages;
    pnt.X := 0;
    pnt.Y := 0;
    pnt := (Sender as TSpeedButton).ClientToScreen(pnt);

    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_GetAirCompanyList';
        Parameters.Refresh;

        if TfmAirportList.MyShowModal(lbCompanyList.Items, Rect(pnt.X,
                                                            pnt.Y,
                                                            pnt.X + (Sender as TSpeedButton).Width,
                                                            pnt.Y + (Sender as TSpeedButton).Height),
                                                            SP,
                                                            nil,
                                                            '������ ������������') > 0 then SelectTemplateParams;
    finally
        Free;

    end;
    Cursor:=crDefault;
    Application.ProcessMessages;
    lbCompanyList.SetFocus;
    NotSaved:=true;
end;

procedure TfmEventSettings.FillTemplateList;
var i, itmp : integer;
    SP : TADOStoredProc;
    bmTemp : TBitmap;
begin
    for i := 0 to pgTemplList.RowCount - 1 do
        pgTemplList.Cells[0, i].Graphic := nil;

    pgTemplList.RowCount := 1;

    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_2_GetTemplateListFromTemp';
        Parameters.Refresh;
        Parameters.ParamByName('@COP').Value := DM.COP;
        Open;

        while not Eof do
        begin
            pgTemplList.RowCount := pgTemplList.RowCount + 1;

            itmp := pgTemplList.RowCount - 1;

            pgTemplList.HiddenCols[0].Cells[itmp].Value := SP.Fields.FieldByName('Temp').AsInteger; //
            //�����
            pgTemplList.Cells[1, pgTemplList.RowCount - 1].Text := Fields.FieldByName('ID_TEMPL').AsString;
            //������
            pgTemplList.Cells[1, pgTemplList.RowCount - 1].WordWrap := false;
            pgTemplList.Cells[2, pgTemplList.RowCount - 1].Text := Fields.FieldByName('TemplPeriod').AsString;
            pgTemplList.Cells[2, pgTemplList.RowCount - 1].WordWrap := false;
             //�����������
            pgTemplList.Cells[3, pgTemplList.RowCount - 1].Text := Fields.FieldByName('Comments').AsString;
            pgTemplList.Cells[3, pgTemplList.RowCount - 1].WordWrap := false;
            //�������
            pgTemplList.Cells[4, pgTemplList.RowCount - 1].Text := Fields.FieldByName('COP_NAME').AsString;
            pgTemplList.Cells[4, pgTemplList.RowCount - 1].WordWrap := false;
            //����
            pgTemplList.Cells[5, pgTemplList.RowCount - 1].Text := Fields.FieldByName('CreateDate').AsString;
            pgTemplList.Cells[5, pgTemplList.RowCount - 1].WordWrap := false;

            // ������ ������� ��������
            bmTemp := TBitmap.Create;
            if pgTemplList.HiddenCols[0].Cells[itmp].Value > 0 then
            begin
                ilist.GetBitmap(1, bmTemp);

                for i := 0 to pgTemplList.ColCount - 1 do
                begin
                    pgTemplList.Cells[i, itmp].Color := clTeal;
                    pgTemplList.Cells[i, itmp].Font.Color := clYellow;
                end;
            end
            else
            begin
                ilist.GetBitmap(0, bmTemp);
            end;
            pgTemplList.Cells[0, pgTemplList.RowCount - 1].Graphic := bmTemp;

            Next;
        end;
    finally
        Free;
    end;
end;

procedure TfmEventSettings.FillMessageList(ARow : integer);
var i, itmp, id_templ : integer;
    SP : TADOStoredProc;
    bmUsed : TBitmap;
begin
    // ����������� ������, ���������� ��� ������
    for i := 0 to pgEventList.RowCount - 1 do
    begin
        if Assigned(pgEventList.Cells[0, i].Graphic) then
        begin
            pgEventList.Cells[0, i].Graphic := nil;
        end;
    end;

    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_10_AdvMessagesList';
        Parameters.Refresh;
        id_templ := StrToIntDef(pgTemplList.Cells[1, ARow].Text, 0);
        if id_templ > 0 then
            Parameters.ParamByName('@ID_TEMPL').Value := id_templ
        else
        begin
            HSMessageDlg('�������� �������� ������ ������� !!!', mtError, [mbOk], 0);
            exit;
        end;
        Open;

        pgEventList.RowCount := 1;
        while not Eof do
        begin
            pgEventList.RowCount := pgEventList.RowCount + 1;

            itmp := pgEventList.RowCount - 1;
            pgEventList.HiddenCols[0].Cells[itmp].Value := SP.Fields.FieldByName('ID').AsInteger;
            // pgEventList.Cells[0, itmp].CheckBox := True;
            // pgEventList.Cells[0, itmp].CheckBoxChecked := (Fields.FieldByName('USED').AsInteger > 0);

            // ������ ������� ��������
            bmUsed := TBitmap.Create;
            if (Fields.FieldByName('USED').AsInteger > 0) then
                ilist.GetBitmap(5, bmUsed)
            else
                ilist.GetBitmap(6, bmUsed);

            pgEventList.Cells[0, pgEventList.RowCount - 1].Graphic := bmUsed;

            pgEventList.Cells[1, itmp].Text := Fields.FieldByName('BaseEvent').AsString;
            pgEventList.Cells[1, itmp].WordWrap := false;
            pgEventList.Cells[2, itmp].Text := Fields.FieldByName('COMMENTS').AsString;
            pgEventList.Cells[2, itmp].WordWrap := false;

            Next;
        end;
    finally
        Free;
    end;
end;

//��������� ������ � ���������� ����������...
procedure TfmEventSettings.GetFormParams;
  var i : integer;
begin
    with TempleteSettings do
    begin
        BDATE := deBegin.Date;
        EDATE := deEnd.Date;

        COMPs := '';
        for i := 0 to lbCompanyList.Count - 1 do
            COMPs := COMPs + lbCompanyList.Items.Names[i] + ';';

        APs := '';
        for i := 0 to lbAirList.Count - 1 do
            APs := APs + lbAirList.Items.Names[i] + ';';

        TYPs := '';
        for i := 0 to lbTypeVSList.Count - 1 do
            TYPs := TYPs + lbTypeVSList.Items.Names[i] + ';';

        SHED := rgShed.ItemIndex;
        DIRECT := rgDirect.ItemIndex;

    end;
end;

// ��������� ���������� �� �����
procedure TfmEventSettings.SelectTemplateParams;
var //i : integer;
   // bmStart : TBitmap;
    SP : TADOStoredProc;
    itmp : integer;
begin
    GetFormParams;

    // ��� ������ ��� ���������� �������
    itmp := pgTemplList.Row;

    if (pgTemplList.HiddenCols[0].Cells[itmp].Value > 0) then // ���� ���������� �������
    begin
        // ���������� ���������� ������� �� ��������� ���������� �� �����
        SP := TADOStoredProc.Create(nil);
        with SP do
        try
            Connection := DM.con;
            ProcedureName := 'dbo.spANN_TemplSettings_1_UpdateTemporaryTemplate';
            Parameters.Refresh;
            Parameters.ParamByName('@BeginDate').Value := TempleteSettings.BDATE;
            Parameters.ParamByName('@EndDate').Value := TempleteSettings.EDATE;
            Parameters.ParamByName('@SHED').Value := TempleteSettings.SHED;
            Parameters.ParamByName('@DIRECT').Value := TempleteSettings.DIRECT;
            Parameters.ParamByName('@Companies').Value := TempleteSettings.COMPs;
            Parameters.ParamByName('@Airports').Value := TempleteSettings.APs;
            Parameters.ParamByName('@VSTypes').Value := TempleteSettings.TYPs;
            Parameters.ParamByName('@COP').Value := DM.COP;
            ExecProc;

            if Parameters.ParamByName('@RETURN_VALUE').Value > 0 then
            begin
                HSMessageDlg('������ ���������� ��������!!!', mtError, [mbOk], 0);
                exit;
            end;
        finally
            Free;
        end;

        // ��������� ������ �������� �� �����
        FillTemplateList;

        // ������ �� ��������� �������
        if pgTemplList.RowCount >= 2 then pgTemplList.Row := 1;
    end;
end;

procedure TfmEventSettings.SelectTemplates;
var i : integer;
    bmStart : TBitmap;
    SP : TADOStoredProc;
    itmp : integer;
begin
    GetFormParams;

    // ���� ������ ������, �� ������ �� ������,
    // � ���� ������� ���������, �� �������� ������
    itmp := pgTemplList.Row;

    if (pgTemplList.RowCount = 1) or (pgTemplList.HiddenCols[0].Cells[itmp].Value > 0) then
    begin
        for i := 0 to pgTemplList.RowCount - 1 do
            pgTemplList.Cells[0, i].Graphic := nil;

        // ����� ������ ��������
        pgTemplList.RowCount := 1;

        SP := TADOStoredProc.Create(nil);
        //with TADOStoredProc.Create(nil) do
        with SP do
        try
            Connection := DM.con;
            ProcedureName := 'dbo.spANN_GetReisTemplateList';
            Parameters.Refresh;
            Parameters.ParamByName('@BeginDate').Value := TempleteSettings.BDATE;
            Parameters.ParamByName('@EndDate').Value := TempleteSettings.EDATE;
            Parameters.ParamByName('@SHED').Value := TempleteSettings.SHED;
            Parameters.ParamByName('@Companies').Value := TempleteSettings.COMPs;
            Parameters.ParamByName('@Airports').Value := TempleteSettings.APs;
            Parameters.ParamByName('@VSTypes').Value := TempleteSettings.TYPs;
            Parameters.ParamByName('@COP').Value := DM.COP;
            Open;

//            pgTemplList.ColCount := Fields.Count + 1;

            while not Eof do
            begin
                pgTemplList.RowCount := pgTemplList.RowCount + 1;

                itmp := pgTemplList.RowCount - 1;
                pgTemplList.Cells[1, pgTemplList.RowCount - 1].Text := Fields.FieldByName('ID_TEMPL').AsString;
                pgTemplList.Cells[1, pgTemplList.RowCount - 1].WordWrap := false;
                pgTemplList.Cells[2, pgTemplList.RowCount - 1].Text := Fields.FieldByName('TemplPeriod').AsString;
                pgTemplList.Cells[2, pgTemplList.RowCount - 1].WordWrap := false;
                pgTemplList.Cells[3, pgTemplList.RowCount - 1].Text := Fields.FieldByName('Comments').AsString;
                pgTemplList.Cells[3, pgTemplList.RowCount - 1].WordWrap := false;
                pgTemplList.Cells[4, pgTemplList.RowCount - 1].Text := Fields.FieldByName('COP_NAME').AsString;
                pgTemplList.Cells[4, pgTemplList.RowCount - 1].WordWrap := false;
                pgTemplList.Cells[5, pgTemplList.RowCount - 1].Text := Fields.FieldByName('CreateDate').AsString;
                pgTemplList.Cells[5, pgTemplList.RowCount - 1].WordWrap := false;
                pgTemplList.HiddenCols[0].Cells[itmp].Value := SP.Fields.FieldByName('Temp').AsInteger;

                // ������ ������� ��������
                bmStart := TBitmap.Create;
                if pgTemplList.HiddenCols[0].Cells[itmp].Value > 0 then
                begin
                    ilist.GetBitmap(1, bmStart);
                    pgTemplList.HiddenCols[0].Cells[itmp].Color := clTeal;
                    pgTemplList.HiddenCols[0].Cells[itmp].Font.Color := clYellow;
                end
                else
                begin
                    ilist.GetBitmap(0, bmStart);
                end;
                pgTemplList.Cells[0, pgTemplList.RowCount - 1].Graphic := bmStart;

                Next;
            end;
        finally
            Free;
            pgTemplList.SetFocus;
            pgTemplList.Cells[0, 0].Selected := True;
        end;
    end;
end;

procedure TfmEventSettings.SetEventTree(direct : integer);
var SP : TADOStoredProc;
begin
    // ��������� ������ ��� ������� ��������
    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_9_BaseEventsTree';
        Parameters.Refresh;
        Parameters.ParamByName('@direct').Value := rgDirect.ItemIndex;
        VirtualTreeFill_Ex(SP, VTEventList);
    finally
        Free;
    end;
end;

procedure TfmEventSettings.SetLanguageList;
var SP : TADOStoredProc;
    APs : string;
    i : integer;
begin
    // ��������� ������ ��������� ������ ���������
    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_16_GetLangList';
        Parameters.Refresh;
        Parameters.ParamByName('@vr').Value := rgShed.ItemIndex+1; //05082010 ������� �.�.

        APs := '';
        for i := 0 to lbAirList.Count - 1 do
            APs := APs + lbAirList.Items.Names[i] + ';';

        Parameters.ParamByName('@Airports').Value := APs;

        Parameters.ParamByName('@pv').Value := rgDirect.ItemIndex;
        Open;

        cbLanguage.Clear;
        while not Eof do
        begin
            cbLanguage.Items.Values[Fields.FieldByName('caption').AsString] :=
                Fields.FieldByName('lang').AsString;
            Next;
        end;
        if cbLanguage.Items.Count > 0 then
            cbLanguage.ItemIndex := 0;
    finally
        Free;
    end;
end;

procedure TfmEventSettings.SetMsgTextPopupItems;
var SP : TADOStoredProc;
    NewItem: TMenuItem;
    i : integer;
begin
    pmMsgText.Items.Clear;

    i := 0;
    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_ConstList';
        Parameters.Refresh;
        Open;

        SetLength(ItemsArray, 0);
        while not Eof do
        begin
            if pos('��������', SP.Fields.FieldByName('caption').AsString)>0 then
            begin
              next;
              continue;
            end;
            SetLength(ItemsArray, i + 1);
            NewItem := TMenuItem.Create(pmMsgText);
            pmMsgText.Items.Add(NewItem);
            // NewItem.Action :=  ActPopUpMenuAddItem;
            NewItem.OnClick := PopUpMenuAddItemClick;
            NewItem.Caption := SP.Fields.FieldByName('caption').AsString;
            NewItem.Tag := i;
            ItemsArray[i] := SP.Fields.FieldByName('caption').AsString;

            i := i + 1;
            Next;
        end;

        NewItem := TMenuItem.Create(pmMsgText);
        pmMsgText.Items.Add(NewItem);
        // NewItem.Action := ActPopUpMenuDeleteItem;
        NewItem.OnClick := PopUpMenuDeleteItemClick;
        NewItem.Tag := i;
        NewItem.Caption := '�������';
    finally
        Free;
    end;
end;

procedure TfmEventSettings.FormShow(Sender: TObject);
var CanSelect : Boolean;
begin
    SetMainFunctionsDisabled;
    // ����� ������ � �����
    FillTemplateList;

    // ���������� ������ �� ��������� �������
    if pgTemplList.RowCount >= 2 then
    begin
        pgTemplList.Row := 1;
        pgTemplList.OnSelectCell(self, 0, pgTemplList.Row, CanSelect);
    end;

    // ��������� ������ ��� ������� ��������
    SetEventTree(rgDirect.ItemIndex);

    // �������� ����� �������
    rbAfter.Checked := False;
    rbAfter.Checked := True;

    if deBegin.Date < Now - 10000 then deBegin.Date := Now;
    if deEnd.Date < deBegin.Date then deEnd.Date := deBegin.Date;

    // ������ PopUp-���� ��� ������ ���������
    SetMsgTextPopupItems;
    NotSaved:=false;
end;

procedure TfmEventSettings.deBeginChange(Sender: TObject);
begin
//    SelectTemplateParams;
end;

procedure TfmEventSettings.deEndChange(Sender: TObject);
begin
//    SelectTemplateParams;
end;

procedure TfmEventSettings.rgShedClick(Sender: TObject);
begin
    SelectTemplateParams;
end;

procedure TfmEventSettings.InitTemplateListGrid;
var i : integer;
begin
    with pgTemplList do
    begin
        ColCount := 7;
        HideColumn(6);
        Cols[0].Width := 20;
        Cols[1].Width := 50;
        Cols[2].Width := 160;
        Cols[3].Width := 150;
        Cols[4].Width := 100;
        Cols[5].Width := 70;
        Cells[0, 0].Value := '';
        Cells[1, 0].Value := '�����';
        Cells[2, 0].Value := '������';
        Cells[3, 0].Value := '�����������';
        Cells[4, 0].Value := '�������';
        Cells[5, 0].Value := '����';
        for i := 0 to pgTemplList.VisibleColCount - 1  do Cells[i, 0].TextAlignment := taCenter;
        RowCount := 1;
    end;
end;

procedure TfmEventSettings.InitEventsListGrid;
var i : integer;
    bmUsed : TBitmap;
begin
    with pgEventList do
    begin
        ColCount := 4;
        HideColumn(0);
        Cols[0].Width := 20;
        Cols[1].Width := 180;
        Cols[2].Width := 250;
        Cells[0, 0].Value := '';
        Cells[1, 0].Value := '������� �������';
        Cells[2, 0].Value := '���������';

        Cells[0, 0].Graphic := nil;
        bmUsed := TBitmap.Create;
        ilist.GetBitmap(7, bmUsed);
        Cells[0, 0].Graphic := bmUsed;

        for i := 1 to VisibleColCount - 1  do
            Cells[i, 0].TextAlignment := taCenter;
        RowCount := 1;
    end;
end;

procedure TfmEventSettings.btAddTemplateFilterClick(Sender: TObject);
begin
    GetFormParams;

    // �������� ������ ��� ��������������
    with TADOStoredProc.Create(nil) do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_UpdateReisGroupTemplate';
        Parameters.Refresh;
        Parameters.ParamByName('@BeginDate').Value := TempleteSettings.BDATE;
        Parameters.ParamByName('@EndDate').Value := TempleteSettings.EDATE;
        Parameters.ParamByName('@SHED').Value := TempleteSettings.SHED;
        Parameters.ParamByName('@Companies').Value := TempleteSettings.COMPs;
        Parameters.ParamByName('@Airports').Value := TempleteSettings.APs;
        Parameters.ParamByName('@VSTypes').Value := TempleteSettings.TYPs;
        Parameters.ParamByName('@Temp').Value := 1; // �����
        Parameters.ParamByName('@COP').Value := DM.COP;
        ExecProc;

        if Parameters.ParamByName('@RETURN_VALUE').Value > 0 then
        begin
            HSMessageDlg('������ ���������� ������� !!!', mtError, [mbOk], 0);
            exit;
        end;

        SelectTemplateParams;
    finally
        Free;
    end;
end;

procedure TfmEventSettings.FormCreate(Sender: TObject);
begin
    InitTemplateListGrid;
    
    // ������������� ��������� ���� ������
    VTEventList.NodeDataSize := sizeof(TDataInfo);
    VTEventList.Header.Columns[0].Width := 250;
    VTEventList.FocusedNode := VTEventList.RootNode;

    EditMsgMode := 0;
end;

procedure TfmEventSettings.btSaveClick(Sender: TObject);
var i, id_templ, id_templ_new, CurrRow : integer;
    fs : TFormatSettings;
    SLog,SBefore,SAfter:string;
    sac,sap,stv:string;

begin
    if HSMessageDlg('��������� ���������?',mtConfirmation,[mbYes,mbNo],0)= mrNo then exit;
    GetFormParams;

    CurrRow := pgTemplList.Row;
    SAfter:='';
    if pgTemplList.HiddenCols[0].Cells[CurrRow].Value > 0 then // ���������, ������ �������� ������ �������
    begin
        SLog:=Format(LogGTmpAdd,[eComments.Text]);

        with TADOStoredProc.Create(nil) do
        try
            Connection := DM.con;
            ProcedureName := 'dbo.spANN_TemplSettings_6_CreateTemplate';
            Parameters.Refresh;
            Parameters.ParamByName('@Comments').Value := eComments.Text;
            Parameters.ParamByName('@COP').Value := DM.COP;
            Parameters.ParamByName('@ID_TEMPL_NEW').Value := 0;

            id_templ := StrToIntDef(pgTemplList.Cells[1, CurrRow].Text, 0);
            if id_templ > 0 then
                Parameters.ParamByName('@ID_TEMPL').Value := id_templ
            else
            begin
                HSMessageDlg('�������� �������� ������ ������� !!!', mtError, [mbOk], 0);
                exit;
            end;

            ExecProc;

            if Parameters.ParamByName('@RETURN_VALUE').Value > 0 then
            begin
                SAfter:='������ ���������� ������� !!!';
                HSMessageDlg('������ ���������� ������� !!!', mtError, [mbOk], 0);
                DM.AddToLog(SLog,'',SAfter);
                exit;
            end
            else
                id_templ_new := Parameters.ParamByName('@ID_TEMPL_NEW').Value;
            DM.AddToLog(SLog,'',SAfter);
            FillTemplateList;

            // ����� ������������ �������
            for i := 0 to pgTemplList.RowCount - 1 do
            begin
                if StrToIntDef(pgTemplList.Cells[1, i].Text, 0) = id_templ_new then
                begin
                    pgTemplList.Row := i;
                    break;
                end;
            end;

            SelectTemplateParams; // �������� �� �����
        finally
            Free;
        end;
    end
    else // ��������� ������������ ������
    begin
        SLog:=Format(LogGTmpEdit,[eComments.Text]);
        if lbCompanyList.Items.Count=0 then sac:=''
        else sac:=lbCompanyList.Items.Strings[0];
        if lbAirList.Items.Count=0 then sap:=''
        else sap:=lbAirList.Items.Strings[0];
        if lbTypeVSList.Items.Count=0 then stv:=''
        else stv:=lbTypeVSList.Items.Strings[0];
        id_templ := StrToIntDef(pgTemplList.Cells[1, CurrRow].Text, 0);
        SBefore:='';
        SAfter:=Format(LogGtmpDop,[DateToStr(deBegin.Date)+'-'+DateToStr(deEnd.Date),rgShed.Items.Strings[rgShed.ItemIndex],rgDirect.Items.Strings[rgDirect.ItemIndex],sac,sap,stv,eComments.Text]);
        with TADOStoredProc.Create(nil) do
        try
            Connection := DM.con;
            ProcedureName := 'dbo.spANN_TemplSettings_7_UpdateTemplate';
            Parameters.Refresh;
            Parameters.ParamByName('@BeginDate').Value := TempleteSettings.BDATE;
            Parameters.ParamByName('@EndDate').Value := TempleteSettings.EDATE;
            Parameters.ParamByName('@SHED').Value := TempleteSettings.SHED;
            Parameters.ParamByName('@DIRECT').Value := TempleteSettings.DIRECT;
            Parameters.ParamByName('@Companies').Value := TempleteSettings.COMPs;
            Parameters.ParamByName('@Airports').Value := TempleteSettings.APs;
            Parameters.ParamByName('@VSTypes').Value := TempleteSettings.TYPs;
            Parameters.ParamByName('@Comments').Value := eComments.Text;
            Parameters.ParamByName('@COP').Value := DM.COP;


            if id_templ > 0 then
                Parameters.ParamByName('@ID_TEMPL').Value := id_templ
            else
            begin
                HSMessageDlg('�������� �������� ������ ������� !!!', mtError, [mbOk], 0);
                exit;
            end;

            ExecProc;

            if Parameters.ParamByName('@RETURN_VALUE').Value < 0 then
            begin
                SAfter:='������ �������������� ������� !!!';
                HSMessageDlg('������ ���������� ������� !!!', mtError, [mbOk], 0);
                DM.AddToLog(SLog,SBefore,SAfter);
                exit;
            end;

            DM.AddToLog(SLog,SBefore,SAfter); 
            // ���������� ������ �������
            GetLocaleFormatSettings(0, fs);
            fs.ShortDateFormat := 'dd.mm.yyyy';
            fs.LongDateFormat := 'dd.mm.yyyy';

            pgTemplList.HiddenCols[0].Cells[CurrRow].Value := 0;
            pgTemplList.Cells[1, CurrRow].Text := IntToStr(id_templ);
            pgTemplList.Cells[1, CurrRow].WordWrap := false;
            pgTemplList.Cells[2, CurrRow].Text := DateToStr(deBegin.Date, fs) + ' - ' + DateToStr(deEnd.Date, fs);
            pgTemplList.Cells[2, CurrRow].WordWrap := false;
            pgTemplList.Cells[3, CurrRow].Text := eComments.Text;
            pgTemplList.Cells[3, CurrRow].WordWrap := false;
            pgTemplList.Cells[4, CurrRow].Text := COP_NAME;
            pgTemplList.Cells[4, CurrRow].WordWrap := false;

            NotSaved:=false;
        finally
            Free;
        end;
    end;
end;



procedure TfmEventSettings.pgTemplListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var id_templ : integer;
    rs_1, rs_2, rs_3, rs_4, rs_5 : _Recordset;
    r : integer;
    SP : TADOStoredProc;
    CanSelect2 : Boolean;
    ns : boolean;
begin
    // ����� ��.��������� ��� ��������� �������
    ns:=NotSaved;
    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_5_GetTemplateValues';
        Parameters.Refresh;
        id_templ := StrToIntDef(pgTemplList.Cells[1, ARow].Text, 0);
        if id_templ > 0 then
            Parameters.ParamByName('@ID_TEMPL').Value := id_templ
        else
        begin
            HSMessageDlg('�������� �������� ������ ������� !!!', mtError, [mbOk], 0);
            exit;
        end;

        Open;

        rs_1 := SP.Recordset;
        rs_2 := SP.NextRecordset(r);
        rs_3 := SP.NextRecordset(r);
        rs_4 := SP.NextRecordset(r);
        rs_5 := SP.NextRecordset(r);

        // ��������� ����������
        SP.Recordset := rs_1;
//        if SP.RecordCount > 0 then
//        begin
            if pgTemplList.HiddenCols[0].Cells[ARow].Value = 0 then
                eComments.Text := Fields.FieldByName('Comments').AsString
            else
                eComments.Text := '';
//        end;

        // ��������� ���� � ����������
        SP.Recordset := rs_2;
        if SP.RecordCount > 0 then
        begin
            // ��������� ������ �������
            if rgDirect.ItemIndex <> Fields.FieldByName('DIRECT').AsInteger then
            begin
                SetEventTree(Fields.FieldByName('DIRECT').AsInteger);
                rgDirect.ItemIndex := Fields.FieldByName('DIRECT').AsInteger;
            end;

            deBegin.Date := Fields.FieldByName('BDATE').AsDateTime;
            deEnd.Date := Fields.FieldByName('EDATE').AsDateTime;
            rgShed.ItemIndex := Fields.FieldByName('SCHED').AsInteger;
        end;

        // ��������� ������ ��������
        SP.Recordset := rs_3;
        lbCompanyList.Clear;
        while not Eof do
        begin
            lbCompanyList.Items.Values[Fields.FieldByName('VALUE').AsString] := Fields.FieldByName('NAME_COMP').AsString;
            Next;
        end;

        // ��������� ������ �/�
        SP.Recordset := rs_4;
        lbAirList.Clear;
        while not Eof do
        begin
            lbAirList.Items.Values[Fields.FieldByName('VALUE').AsString] := Fields.FieldByName('NAME_AP').AsString;
            Next;
        end;

        // ��������� ������ ����� ��
        SP.Recordset := rs_5;
        lbTypeVSList.Clear;
        while not Eof do
        begin
            lbTypeVSList.Items.Values[Fields.FieldByName('VALUE').AsString] := Fields.FieldByName('NAME_TYP').AsString;
            Next;
        end;

        // ������������� ������ �� ��� �������
        InitEventsListGrid;

        // ��� ���������� �������
        if pgTemplList.HiddenCols[0].Cells[ARow].Value > 0 then
        begin
            // ������������� ������ �� ������� ��
        end
        else
        begin
        end;

        // ��������� ������ ������
        SetLanguageList;

        // �������� ���� ���������
        ClearMsgFields;

        // �������� ������ ������
        ClearLanguageList;

        // �������� ������ �� ��� �������
        FillMessageList(ARow);

        if pgEventList.RowCount > 1 then
        begin
            pgEventList.Row := 1;
            pgEventList.OnSelectCell(Sender, 1, pgEventList.Row, CanSelect2);
        end;
    finally
        Free;
        pgTemplList.SetFocus;
        NotSaved:=ns;
    end;
end;



procedure TfmEventSettings.btDeleteClick(Sender: TObject);
var SP : TADOStoredProc;
    CurrRow, id_templ : integer;
    Slog,SAfter:string;
begin
  if HSMessageDlg('������� ��������� ������?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
    SLog:=Format(LogGTmpDel,[eComments.Text]);
    SAfter:='';
    CurrRow := pgTemplList.Row;
    if Assigned(pgTemplList.HiddenCols[0].Cells[CurrRow])
    and (pgTemplList.HiddenCols[0].Cells[CurrRow].Value = 0) then // ���� ������� ������
    begin
        SP := TADOStoredProc.Create(nil);
        with SP do
        try
            Connection := DM.con;
            ProcedureName := 'dbo.spANN_TemplSettings_8_DeleteTemplate';
            Parameters.Refresh;

            id_templ := StrToIntDef(pgTemplList.Cells[1, CurrRow].Text, 0);
            if id_templ > 0 then
                Parameters.ParamByName('@ID_TEMPL').Value := id_templ
            else
            begin
                HSMessageDlg('�������� �������� ������ ������� !!!', mtError, [mbOk], 0);
                exit;
            end;
            ExecProc;

            if Parameters.ParamByName('@RETURN_VALUE').Value <> 0 then
            begin
                SAfter:='������ �������� �������!';
                HSMessageDlg('������ ���������� ��������!!!', mtError, [mbOk], 0);
                DM.AddToLog(SLog,'',SAfter);
                exit;
            end;
            DM.AddToLog(SLog,'',SAfter);
        finally
            Free;
        end;
    end;

    FillTemplateList;

    if pgTemplList.RowCount >= 2 then pgTemplList.Row := 1;
end;

procedure TfmEventSettings.ActDeleteUpdate(Sender: TObject);
var CurrRow : integer;
begin
    CurrRow := pgTemplList.Row;
    (Sender as TAction).Enabled := (pgTemplList.HiddenCols[0].Cells[CurrRow].Value = 0) and FuncEnabled;
end;

procedure TfmEventSettings.deBeginExit(Sender: TObject);
begin
    if deBegin.Date < Now - 10000 then deBegin.Date := Now;
    if deBegin.Date > deEnd.Date then deEnd.Date := deBegin.Date;

    SelectTemplateParams;
end;

procedure TfmEventSettings.deEndExit(Sender: TObject);
begin
    if deEnd.Date < Now - 10000 then deEnd.Date := Now;
    if deBegin.Date > deEnd.Date then deBegin.Date := deEnd.Date;

    SelectTemplateParams;
end;

procedure TfmEventSettings.ActCompanyDelUpdate(Sender: TObject);
begin
    (Sender as TAction).Enabled := (lbCompanyList.Count > 0) and FuncEnabled;
end;

procedure TfmEventSettings.ActAPDelUpdate(Sender: TObject);
begin
    (Sender as TAction).Enabled := (lbAirList.Count > 0) and FuncEnabled;
end;

procedure TfmEventSettings.ActTypeDelUpdate(Sender: TObject);
begin
    (Sender as TAction).Enabled := (lbTypeVSList.Count > 0) and FuncEnabled;
end;

procedure TfmEventSettings.ActCompanyDelExecute(Sender: TObject);
begin
    lbCompanyList.DeleteSelected;
    SelectTemplateParams;
    NotSaved:=true;
end;

procedure TfmEventSettings.ActAPDelExecute(Sender: TObject);
begin
    lbAirList.DeleteSelected;
    SelectTemplateParams;
    NotSaved:=true;
end;

procedure TfmEventSettings.ActTypeDelExecute(Sender: TObject);
begin
    lbTypeVSList.DeleteSelected;
    SelectTemplateParams;
    NotSaved:=true;
end;

procedure TfmEventSettings.ClearLanguageList;
var i : integer;
    PMsgLang : ^TMsgLang;
begin
    // ������� ������ ������ ��� ���.�������
    for i := 0 to lbLangList.Count - 1 do
    begin
        if Assigned(lbLangList.Items.Objects[i]) then
        begin
            PMsgLang := pointer(lbLangList.Items.Objects[i]);
            PMsgLang^.lang := '';
            PMsgLang^.msg := '';
            Dispose(PMsgLang);
        end;
    end;

    lbLangList.Clear;
end;

procedure TfmEventSettings.pgEventListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var SP : TADOStoredProc;
    id_msg, i : integer;
    CurrNode, NextNode, SearchNode : PVirtualNode;
    PMsgLang : ^TMsgLang;
begin
    // ����� ��.��������� ��� ��������� �������
    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_11_GetMessageValues';
        Parameters.Refresh;
        id_msg := pgEventList.HiddenCols[0].Cells[ARow].Value;
        if id_msg > 0 then
            Parameters.ParamByName('@ID_MSG').Value := id_msg
        else
        begin
            HSMessageDlg('�������� �������� ������ ��������� !!!', mtError, [mbOk], 0);
            exit;
        end;

        Open;

        // ��������� ����
        if Fields.FieldByName('BEFORE_AFTER').AsInteger > 0 then
        begin
            rbBefore.Checked := False;
            rbAfter.Checked := True;
        end
        else
        begin
            rbBefore.Checked := True;
            rbAfter.Checked := False;
        end;

        BaseDelta.Time := Fields.FieldByName('BASE_DELTA').AsInteger / 86400;
        IntervalDTP.Time := Fields.FieldByName('INTERVAL').AsInteger / 86400;

        Comment.Text := Fields.FieldByName('COMMENTS').AsString;
        MsgText.Text := '';

        // ������� ����, �����. ���������
        SearchNode := FindNodeEx(VTEventList, VTEventList.RootNode, Fields.FieldByName('event').AsInteger);

        // if not Assigned(SearchNode) then exit;
        if Assigned(SearchNode) then
        begin
            if Assigned(VTEventList.FocusedNode)
            then VTEventList.Selected[VTEventList.FocusedNode]:=false;
            VTEventList.FocusedNode := SearchNode;
            VTEventList.Selected[VTEventList.FocusedNode] := true;
            Include(VTEventList.FocusedNode.States, vsSelected);
        end;

        // ������������/�� ������������
        if Fields.FieldByName('USED').Value = 0 then
            cbNotUsed.Checked := True
        else
            cbNotUsed.Checked := False;

        // ��������� ������ �������� ���������
        ClearLanguageList;
        while not Eof do
        begin
            if Fields.FieldByName('MSG_TXT').Value <> '' then
            begin
                AddLangToLangList(Fields.FieldByName('LANG').Value,
                                    Fields.FieldByName('LANG_NAME').Value,
                                    Fields.FieldByName('MSG_TXT').Value);
            end;

            Next;
        end;

        if (lbLangList.Count > 0) and (lbLangList.Enabled) then
        begin
            lbLangList.Selected[0] := True; // ������� ������ ������
            lbLangList.OnClick(Sender);
            lbLangList.SetFocus;
        end;
    finally
        Free;
    end;
end;

procedure TfmEventSettings.VTEventListGetImageIndex(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var PDataNode : PDataInfo;
begin
    PDataNode := (Sender as TVirtualStringTree).GetNodeData(Node);
    if column > 0 then exit;
    if Assigned(PDataNode) then
    begin
        if vsSelected in (Node.States) then
            ImageIndex := PDataNode^.SelectedIndex
        else
            ImageIndex := PDataNode^.ImageIndex;
    end;
end;

procedure TfmEventSettings.VTEventListGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var NewData: PDataInfo;
begin
    // ��������� ����� ����
    NewData := (Sender as TVirtualStringTree).GetNodeData(Node);
    if Assigned(NewData) then
    case Column of
    0 :
    begin
        CellText := NewData^.NodeName; //NodeName;
    end;
    end;
end;

procedure TfmEventSettings.GetLangListParams(var Langs, Msgs : string);
var i : integer;
    PMsgLang : ^TMsgLang;
begin
    Langs := '';
    Msgs := '';
    for i := 0 to lbLangList.Count - 1 do
    begin
        if Assigned(lbLangList.Items.Objects[i]) then
        begin
            PMsgLang := pointer(lbLangList.Items.Objects[i]);
            Langs := Langs + PMsgLang^.lang + ';';
            Msgs := Msgs + PMsgLang^.msg + ';';
        end;
    end;
end;

procedure TfmEventSettings.btAddMsgClick(Sender: TObject);
var SP : TADOStoredProc;
    i, ID_New, id_Event, id_templ : integer;
    NodeData : PDataInfo;
   // Secs : integer;
   // temp_i : integer;
    Langs, Msgs : string;
    SLog,SAfter:string;
begin
    // �������� �� � ������
    SP := TADOStoredProc.Create(nil);
    with SP do
    try
       sLog:=Format(LogGTmpAdd,[Comment.Text,eComments.Text]);
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_12_AddMessage';
        Parameters.Refresh;
        Parameters.ParamByName('@ID_New').Value := 0;
        id_templ := StrToIntDef(pgTemplList.Cells[1, pgTemplList.Row].Text, 0);
        if id_templ > 0 then
            Parameters.ParamByName('@ID_TEMPL').Value := id_templ
        else
        begin
            HSMessageDlg('�������� �������� ������ ������� !!!', mtError, [mbOk], 0);
            exit;
        end;

        if Assigned(VTEventList.FocusedNode) then
        begin
            NodeData := VTEventList.GetNodeData(VTEventList.FocusedNode);

            id_Event := StrToIntDef(NodeData^.ExData[1], 0);
            if id_Event <= 0 then
            begin
                HSMessageDlg('�� ������� ������� �������!!!', mtError, [mbOk], 0);
                exit;
            end;

            Parameters.ParamByName('@EVENT').Value := id_Event; // Event
        end
        else
        begin
            HSMessageDlg('�� ������� ������� �������!!!', mtError, [mbOk], 0);
            exit;
        end;

        Parameters.ParamByName('@MSG_TXT').Value := MsgText.Text;
        Parameters.ParamByName('@BASE_DELTA').Value := Round(Frac(BaseDelta.Time) * 86400);
        Parameters.ParamByName('@INTERVAL').Value := Round(Frac(IntervalDTP.Time) * 86400);
        if rbBefore.Checked then
            Parameters.ParamByName('@BEFORE_AFTER').Value := 0
        else
            Parameters.ParamByName('@BEFORE_AFTER').Value := 1;

        Parameters.ParamByName('@COMMENTS').Value := Comment.Text;
        if cbNotUsed.Checked then
            Parameters.ParamByName('@USED').Value := 0
        else
            Parameters.ParamByName('@USED').Value := 1;

        GetLangListParams(Langs, Msgs);

        Parameters.ParamByName('@langs').Value := Langs;
        Parameters.ParamByName('@msgs').Value := Msgs;

        ExecProc;

        ID_New := Parameters.ParamByName('@ID_New').Value;

        if (Parameters.ParamByName('@RETURN_VALUE').Value <> 0) or (ID_New <= 0) then
        begin
            SAfter:='������ ��� ���������� ��������� ���������!!!';
            HSMessageDlg('������ ��� ���������� ��������� ���������!!!', mtError, [mbOk], 0);
            DM.AddToLog(SLog,'',SAfter);
            exit;
        end;

        DM.AddToLog(SLog,'',SAfter);
        // ��������� ���� ������
        FillMessageList(pgTemplList.Row);
        NotSaved:=true;

        // ���������� ������ �� ����������� ������
        for i := 0 to pgEventList.RowCount - 1 do
        begin
            if pgEventList.HiddenCols[0].Cells[i].Value = ID_New then
            begin
                pgEventList.Row := i;
                break;
            end;
        end;
    finally
        Free;
    end;
end;

procedure TfmEventSettings.rbBeforeClick(Sender: TObject);
begin
    rbAfter.Checked := not rbBefore.Checked;
end;

procedure TfmEventSettings.rbAfterClick(Sender: TObject);
begin
    rbBefore.Checked := not rbAfter.Checked;
end;

procedure TfmEventSettings.btChangeMsgClick(Sender: TObject);
var SP : TADOStoredProc;
    i, {ID_New,} id_Event, id_msg, CurrRow : integer;
    NodeData : PDataInfo;
    //Secs : integer;
    Langs, Msgs : string;
    SLog,SAfter,se : string;
begin
    // �������� �� � ������
    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        CurrRow := pgEventList.Row;
        SLog:=Format(LogGTmpEdit,[Comment.Text,eComments.Text]);
        se:=pgEventList.Cols[1].Cells[CurrRow].Text;
        SAfter:=Format(LogMsgDop,[se,TimeToStr(BaseDelta.Time),TimeToStr(IntervalDTP.Time),cbLanguage.Text,MsgText.Text,Comment.Text]);
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_13_ChangeMessage';
        Parameters.Refresh;

        id_msg := pgEventList.HiddenCols[0].Cells[CurrRow].Value;
        if id_msg > 0 then
            Parameters.ParamByName('@ID_MSG').Value := id_msg
        else
        begin
            HSMessageDlg('�������� �������� ��������� !!!', mtError, [mbOk], 0);
            exit;
        end;

        if Assigned(VTEventList.FocusedNode) then
        begin
            NodeData := VTEventList.GetNodeData(VTEventList.FocusedNode);

            id_Event := StrToIntDef(NodeData^.ExData[1], 0);
            if id_Event <= 0 then
            begin
                HSMessageDlg('�� ������� ������� �������!!!', mtError, [mbOk], 0);
                exit;
            end;

            Parameters.ParamByName('@EVENT').Value := id_Event; // Event
        end;
        Parameters.ParamByName('@MSG_TXT').Value := MsgText.Text;
        Parameters.ParamByName('@BASE_DELTA').Value := Round(Frac(BaseDelta.Time) * 86400);
        Parameters.ParamByName('@INTERVAL').Value := Round(Frac(IntervalDTP.Time) * 86400);
        if rbBefore.Checked then
            Parameters.ParamByName('@BEFORE_AFTER').Value := 0
        else
            Parameters.ParamByName('@BEFORE_AFTER').Value := 1;
        Parameters.ParamByName('@COMMENTS').Value := Comment.Text;
        if cbNotUsed.Checked then
            Parameters.ParamByName('@USED').Value := 0
        else
            Parameters.ParamByName('@USED').Value := 1;

        GetLangListParams(Langs, Msgs);

        Parameters.ParamByName('@langs').Value := Langs;
        Parameters.ParamByName('@msgs').Value := Msgs;

        ExecProc;

        if (Parameters.ParamByName('@RETURN_VALUE').Value <> 0) then
        begin
            SAfter:='������ ��� �������������� ��������� ���������!!!';
            HSMessageDlg('������ ��� �������������� ��������� ���������!!!', mtError, [mbOk], 0);
            DM.AddToLog(SLog,'',SAfter);
            exit;
        end;
        DM.AddToLog(SLog,'',SAfter);
        // ��������� ���� ������
        FillMessageList(pgTemplList.Row);

        // ���������� ������ �� ���������� ������
        for i := 0 to pgEventList.RowCount - 1 do
        begin
            if pgEventList.HiddenCols[0].Cells[i].Value = id_msg then
            begin
                pgEventList.Row := i;
                break;
            end;
        end;
        NotSaved:=true;
    finally
        Free;
    end;
end;

procedure TfmEventSettings.btDeleteMsgClick(Sender: TObject);
var SP : TADOStoredProc;
    {i,} CurrRow, {ID_New,} id_Event, id_msg : integer;
    NodeData : PDataInfo;
    Secs : integer;
    SLog,SAfter:string;
begin
    // ������� �� �� ������
    if HSMessageDlg('������� ��������� �������� ���������?',mtConfirmation,[mbYes,mbNo],0) =mrNo then exit;
    SP := TADOStoredProc.Create(nil);
    with SP do
    try
        SLog:=Format(LogGTmpDel,[Comment.Text,eComments.Text]);
        SAfter:='';
        Connection := DM.con;
        ProcedureName := 'dbo.spANN_TemplSettings_14_DeleteMessage';
        Parameters.Refresh;
        CurrRow := pgEventList.Row;

        id_msg := pgEventList.HiddenCols[0].Cells[CurrRow].Value;
        if id_msg > 0 then
            Parameters.ParamByName('@ID_MSG').Value := id_msg
        else
        begin
            HSMessageDlg('���������� ������� �������� ���������!!!', mtError, [mbOk], 0);
            exit;
        end;

        ExecProc;


        if (Parameters.ParamByName('@RETURN_VALUE').Value <> 0) then
        begin
            SAfter:='������ ��� �������� ��������� ���������!!!';
            HSMessageDlg('������ ��� �������� ��������� ���������!!!', mtError, [mbOk], 0);
            DM.AddToLog(SLog,'',SAfter);
            exit;
        end;
        DM.AddToLog(SLog,'',SAfter);
        // ��������� ���� ������
        FillMessageList(pgTemplList.Row);

        if pgEventList.RowCount > 0 then pgEventList.Row := 1;
        NotSaved:=true;
    finally
        Free;
    end;
end;

procedure TfmEventSettings.ClearMsgFields;
var vn : PVirtualNode;
begin
    // ������� �������
    if Assigned(VTEventList.FocusedNode)
    then begin
      VTEventList.Selected[VTEventList.FocusedNode]:=false;
      VTEventList.FocusedNode := nil;
    end;

    vn := VTEventList.RootNode.FirstChild;

    while Assigned(vn) do
    begin
        VTEventList.Expanded[vn] := False;
        vn := vn.NextSibling;
    end;

    // ������� ��������
    rbBefore.Checked := False;;
    rbAfter.Checked := True;;
    BaseDelta.Time := 0;

    // �������� �����������
    IntervalDTP.Time := 0;

    // �����
    MsgText.Text := '';

    // �����������
    Comment.Text := '';
end;

procedure TfmEventSettings.btClearMsgClick(Sender: TObject);
begin
    ClearMsgFields;
end;

procedure TfmEventSettings.ActTemporaryTemplUpdate(Sender: TObject);
var CurrRow : integer;
    ActivFlag : boolean;
begin
    CurrRow := pgTemplList.Row;
    ActivFlag := not(pgTemplList.HiddenCols[0].Cells[CurrRow].Value > 0) and FuncEnabled;
    (Sender as TAction).Enabled := ActivFlag;
    gbBaseDelta.Enabled := ActivFlag;
    IntervalDTP.Enabled := ActivFlag;
    MsgText.Enabled := ActivFlag;
    Comment.Enabled := ActivFlag;
    pgEventList.Enabled := ActivFlag;
    BaseDelta.Enabled := ActivFlag;
    VTEventList.Enabled := ActivFlag;
    lbLangList.Enabled := ActivFlag;
    cbLanguage.Enabled := ActivFlag;
end;

procedure TfmEventSettings.cbNotUsedClick(Sender: TObject);
begin
    if cbNotUsed.Checked then
        cbNotUsed.Font.Color := clRed
    else
        cbNotUsed.Font.Color := clWindowText;
end;

procedure TfmEventSettings.rgDirectClick(Sender: TObject);
begin
    SelectTemplateParams;
    SetEventTree(rgDirect.ItemIndex);
end;

procedure TfmEventSettings.VTEventListFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var P : PDataInfo;
begin
    // ����������� ������, ���������� ��� ������ ����
    P := (Sender as TVirtualStringTree).GetNodeData(Node);
    if Assigned(P) then
    begin
        Finalize(P^);
    end;
end;

procedure TfmEventSettings.cbLanguageDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
    (Control as TComboBox).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top, (Control as TComboBox).Items.Names[Index]);
end;

procedure TfmEventSettings.AddLangToLangList(ALang, ALangName, AMsg : string);
var i : integer;
    PMsgLang : ^TMsgLang;
    MsgLang : TMsgLang;
    FindLang : boolean;
begin
    try
        FindLang := False;

        for i := 0 to lbLangList.Count - 1 do
        begin
            if Assigned(lbLangList.Items.Objects[i]) then
            begin
                PMsgLang := pointer(lbLangList.Items.Objects[i]);

                if (PMsgLang^.lang = Alang) then
                begin
                    FindLang := True;

                    // �������� ����� ���������
                    PMsgLang^.msg := AMsg;
                end;
            end;
        end;

        if not FindLang then
        begin
            New(PMsgLang);

            PMsgLang^.lang := ALang;
            PMsgLang^.msg := AMsg;
            lbLangList.Items.AddObject(ALangName, pointer(PMsgLang));
        end;
    finally
    end;
end;

procedure TfmEventSettings.sbLangAddEditClick(Sender: TObject);
var i : integer;
    PMsgLang : ^TMsgLang;
    MsgLang : TMsgLang;
    FindLang : boolean;
begin
    try
        FindLang := False;

        if MsgText.Text = '' then
        begin
            HSMessageDlg('���������� ������ ����� ���������!!!', mtError, [mbOk], 0);
            exit;
        end;

        if cbLanguage.ItemIndex < 0 then
        begin
            HSMessageDlg('�� ������ ���� ��� ����������!!!', mtError, [mbOk], 0);
            exit;
        end;

        AddLangToLangList(cbLanguage.Items.ValueFromIndex[cbLanguage.ItemIndex],
                            cbLanguage.Items.Names[cbLanguage.ItemIndex],
                            MsgText.Text);
    finally
    end;
end;

procedure TfmEventSettings.sbLangDelClick(Sender: TObject);
var PMsgLang : ^TMsgLang;
begin
    if lbLangList.ItemIndex >= 0 then
    begin
        if Assigned(lbLangList.Items.Objects[lbLangList.ItemIndex]) then
        begin
            PMsgLang := pointer(lbLangList.Items.Objects[lbLangList.ItemIndex]);
            PMsgLang^.lang := '';
            PMsgLang^.msg := '';
            Dispose(PMsgLang);
        end;
        lbLangList.Items.Delete(lbLangList.ItemIndex);
    end;
end;

procedure TfmEventSettings.lbLangListClick(Sender: TObject);
var PMsgLang : ^TMsgLang;
    i : integer;
begin
    if lbLangList.ItemIndex >= 0 then
    try
        if Assigned(lbLangList.Items.Objects[lbLangList.ItemIndex]) then
        begin
            PMsgLang := pointer(lbLangList.Items.Objects[lbLangList.ItemIndex]);

            for i := 0 to cbLanguage.Items.Count - 1 do
            begin
                if PMsgLang^.lang = cbLanguage.Items.ValueFromIndex[i] then
                begin
                    cbLanguage.ItemIndex := i;
                    MsgText.Text := PMsgLang^.msg;
                end;
            end;
        end;
    finally
    end;
end;

procedure TfmEventSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i : integer;
begin
    // �������� ���� �������
    ClearLanguageList;

    // �������� pgEventList
    for i := 0 to pgEventList.RowCount - 1 do
    begin
        if Assigned(pgEventList.Cells[0, i].Graphic) then
        begin
            pgEventList.Cells[0, i].Graphic := nil;
        end;
    end;

    // �������� pgTemplList
    for i := 0 to pgTemplList.RowCount - 1 do
    pgTemplList.Cells[0, i].Graphic := nil;

    // ������� ������ �������
    VTEventList.Clear;
end;

procedure TfmEventSettings.ActMsgDeleteUpdate(Sender: TObject);
var CurrTemplRow, CurrEventRow : integer;
    ActivFlag : boolean;
begin
    CurrTemplRow := pgTemplList.Row;
    ActivFlag := not(pgTemplList.HiddenCols[0].Cells[CurrTemplRow].Value > 0) and FuncEnabled;

    (Sender as TAction).Enabled := ActivFlag and (pgEventList.Row > 0)
                                    and (pgEventList.HiddenCols[0].Cells[pgEventList.Row].Value > 0);
end;



procedure TfmEventSettings.PopUpMenuAddItemClick(Sender: TObject);
var Str1, Str2 : string;
    CurPos : integer;
begin
    try
        EditMsgMode := 1; //������� �������

        Str1 := (Sender as TMenuItem).Caption;
        with Sender as TMenuItem do
        begin
            CurPos := MsgText.SelStart;
            Str1 := copy(MsgText.Text, 1, MsgText.SelStart);
            Str2 := copy(MsgText.Text, MsgText.SelStart + 1,
                        length(MsgText.Text) - MsgText.SelStart);

            MsgText.Text := Str1 + ItemsArray[Tag] + Str2;
            if Length(MsgText.Text) > Length(Str1 + Str2) then
                MsgText.SelStart := CurPos + Length(ItemsArray[Tag]);
        end;
    finally
        EditMsgMode := 0;
    end;
end;



procedure TfmEventSettings.PopUpMenuDeleteItemClick(Sender: TObject);
var Str1, Str2 : string;
    CurPos, KeyWordPos, i : integer;
begin
    // ���� ������� ������� �� �������� �����, �������������� ����������.
    try
        EditMsgMode := 2; //������� ��������

        Str1:=MsgText.SelText;                                  //2907210 ������� �.�.
        //i:=pmMsgText.Items.IndexOf(pmMsgText.Items.Find(Str1));
        {if i<>-1 then }MsgText.SelText:='';


       { CurPos := MsgText.SelStart;

        for i := 0 to High(ItemsArray) do
        begin
            KeyWordPos := PosEx(ItemsArray[i], MsgText.Text);

            while KeyWordPos > 0 do
            begin
                if (KeyWordPos <= CurPos) and (KeyWordPos + Length(ItemsArray[i]) - 2 >= CurPos) then
                begin
                    // ����� ����� ��� �������� - ������� ���
                    Str1 := copy(MsgText.Text, 1, KeyWordPos - 1);
                    Str2 := copy(MsgText.Text, KeyWordPos + length(ItemsArray[i]), length(MsgText.Text));
                    MsgText.Text := Str1 + Str2;
                    MsgText.SelStart := KeyWordPos - 1;
                    exit;
                end;

                KeyWordPos := PosEx(ItemsArray[i], MsgText.Text, KeyWordPos + 1);
            end;
        end;    }
    finally
        EditMsgMode := 0;
    end;
end;

procedure TfmEventSettings.MsgTextKeyPress(Sender: TObject; var Key: Char);
var Str1, Str2 : string;
    CurPos, KeyWordPos, i : integer;
begin
    // ���� ������� ������� �� �������� �����, �������������� ����������.
    {
    CurPos := MsgText.SelStart;

    for i := 0 to High(ItemsArray) do
    begin
        KeyWordPos := PosEx(ItemsArray[i], MsgText.Text);

        while KeyWordPos > 0 do
        begin
            // ������ �� �������� �����
            if (Key = #8) and (KeyWordPos <= CurPos) and (KeyWordPos + Length(ItemsArray[i]) - 1 >= CurPos) then
            begin
                Key := Char(20);
                exit;
            end
            else
            if (KeyWordPos <= CurPos) and (KeyWordPos + Length(ItemsArray[i]) - 2 >= CurPos) then
            begin
                Key := Char(20);
                exit;
            end;

            KeyWordPos := PosEx(ItemsArray[i], MsgText.Text, KeyWordPos + 1);
        end;
    end;
    }
end;

procedure TfmEventSettings.MsgTextChange(Sender: TObject);
var Str1, Str2 : string;
    CurPos, KeyWordPos, i : integer;
begin
    if trim(MsgText.Text)='' then exit;
    CurPos := MsgText.SelStart;

    // ���� ������� ������� �� �������� �����, �������������� ����������.
    for i := 0 to High(ItemsArray) do
    begin
        KeyWordPos := PosEx(ItemsArray[i], MsgText.Text);

        while KeyWordPos > 0 do
        begin
            MsgText.SelStart := KeyWordPos - 1;
            MsgText.SelLength := length(ItemsArray[i]);
            MsgText.SelAttributes.Color := clRed;
            MsgText.SelAttributes.Protected := True;

            KeyWordPos := PosEx(ItemsArray[i], MsgText.Text, KeyWordPos + 1);
        end;
    end;

    MsgText.SelStart := CurPos;
end;

function TfmEventSettings.CursorOnKeyWord : boolean;
var KeyWordPos, i, CurPos, res : integer;
begin
    result := False;

    CurPos := MsgText.SelStart;

    // �������� ��������� ������� (AllowChange = false - �� ����.�����)
    for i := 0 to High(ItemsArray) do
    begin
        KeyWordPos := PosEx(ItemsArray[i], MsgText.Text);

        while KeyWordPos > 0 do
        begin
            if (KeyWordPos <= CurPos) and (KeyWordPos + Length(ItemsArray[i]) - 2 >= CurPos) then
            begin
                result := True;
                break;
            end;

            if result then break;

            KeyWordPos := PosEx(ItemsArray[i], MsgText.Text, KeyWordPos + 1);
        end;
    end;
end;

procedure TfmEventSettings.MsgTextProtectChange(Sender: TObject; StartPos,
  EndPos: Integer; var AllowChange: Boolean);
var KeyWordPos, i, CurPos : integer;
begin
    //AllowChange := True;
   if trim(MsgText.Text)='' then
   begin
     AllowChange := True;
     exit;
   end;
    if not MsgText.Focused then
        AllowChange := True
    else
    if (MsgText.Focused)
    and ((not CursorOnKeyWord) and (EditMsgMode = 1)) then
        AllowChange := True
    else
    if EditMsgMode = 2 then
        AllowChange := True
    else AllowChange := False;

    {
    AllowChange := (not MsgText.Focused)
                    or
                    ((not CursorOnKeyWord) and (EditMsgMode = 1))
                            or (EditMsgMode = 2);
    }
end;

procedure TfmEventSettings.pmMsgTextPopup(Sender: TObject);
//var i : integer;
begin
{    for i := 0 to pmMsgText.Items.Count - 1 do
    begin
        if i = pmMsgText.Items.Count - 1 then // ��������� - ����� "��������"
            pmMsgText.Items[i].Enabled := CursorOnKeyWord
        else
            pmMsgText.Items[i].Enabled := not CursorOnKeyWord;
    end;   }
end;

procedure TfmEventSettings.btClearClick(Sender: TObject);
begin
// ������� ��������� �������   23072010 �������
  lbCompanyList.Clear;
  lbAirList.Clear;
  lbTypeVSList.Clear;
  eComments.Clear;
  deBegin.Clear;
  deEnd.Clear;
  SelectTemplateParams;
end;

procedure TfmEventSettings.Timer1Timer(Sender: TObject);
begin
  if NotSaved then
  begin
    if btSave.Font.Color=clRed then
    begin
      btSave.Font.Color:=clMenuHighlight;
      btSave.Font.Style:=[];
    end
    else
    begin
      btSave.Font.Color:=clRed;
      btSave.Font.Style:=[fsBold];    
    end;  
  end;
end;

procedure TfmEventSettings.eCommentsChange(Sender: TObject);
begin
  notSaved:=true;
end;

end.
