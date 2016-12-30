unit ZabbixModule;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, Zabbix1C_TLB, StdVcl, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient;

type
  TZabbix = class(TAutoObject, IZabbix)
  protected
    FTCPClient: TIdTCPClient;
    FHost: WideString;
    FPort: Integer;
    FTimeout: Integer;
    function Get_Host: WideString; safecall;
    function Get_Port: Integer; safecall;
    procedure Set_Host(const Value: WideString); safecall;
    procedure Set_Port(Value: Integer); safecall;
    function Get_Timeout: Integer; safecall;
    procedure Set_Timeout(Value: Integer); safecall;
    procedure Close; safecall;
    procedure Init(const HostZ: WideString; Port, Timeout: Integer); safecall;
    procedure Send(const Host, KeyItem, KeyValue: WideString); safecall;
  end;

implementation

uses ComServ, SysUtils;

function TZabbix.Get_Host: WideString;
begin
  if FTCPClient <> nil then
    Result:=FTCPClient.Host;
end;

function TZabbix.Get_Port: Integer;
begin
  if FTCPClient <> nil then
    Result:=FTCPClient.Port;
end;

procedure TZabbix.Set_Host(const Value: WideString);
begin
  if FTCPClient <> nil then
    FTCPClient.Host:=Value;
end;

procedure TZabbix.Set_Port(Value: Integer);
begin
  if FTCPClient <> nil then
    FTCPClient.Port:=Value;
end;

function TZabbix.Get_Timeout: Integer;
begin
  Result:=FTimeout;
end;

procedure TZabbix.Set_Timeout(Value: Integer);
begin
  FTimeout:=Value;
end;

procedure TZabbix.Close;
begin
  if FTCPClient.Connected then
    FTCPClient.Disconnect;
  FreeAndNil(FTCPClient);
end;

procedure TZabbix.Init(const HostZ: WideString; Port, Timeout: Integer);
begin
  FTCPClient:=TIdTCPClient.Create(nil);
  FTCPClient.Host:=HostZ;
  FTCPClient.Port:=Port;
  FTimeout:=Timeout;
end;

procedure TZabbix.Send(const Host, KeyItem, KeyValue: WideString);
var
  DataStr, AllData: string;
  DataSz, r: Integer;
begin
  DataStr:='{"request":"sender data","data":[{"host":"' + Host + '","key":"' + KeyItem + '","value":"' + KeyValue + '"}';
  DataStr:=DataStr+']}';

  DataSz:=Length(DataStr);

  //AllData:='ZBXD'+#1+Char(sz)+#0#0#0#0#0#0#0+s;

  AllData:='ZBXD'+#1;

  r:=Trunc(DataSz/256);
  
  if(r) > 0 then begin
    AllData:=AllData + Char(DataSz-r*256);
    AllData:=AllData + Char(r);
    AllData:=AllData + #0#0#0#0#0#0;
  end else begin
    AllData:=AllData + Char(DataSz);
    AllData:=AllData + #0#0#0#0#0#0#0;
  end;

  AllData:=AllData + DataStr;

  FTCPClient.Connect(FTimeout);
  FTCPClient.WriteLn(AllData);
  FTCPClient.Disconnect;

end;

initialization
  TAutoObjectFactory.Create(ComServer, TZabbix, Class_Zabbix,
    ciSingleInstance, tmApartment);
end.
