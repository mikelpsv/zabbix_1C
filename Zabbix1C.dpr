library Zabbix1C;

uses
  ComServ,
  ZabbixModule in 'ZabbixModule.pas' {Zabbix: CoClass},
  Zabbix1C_TLB in 'Zabbix1C_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
