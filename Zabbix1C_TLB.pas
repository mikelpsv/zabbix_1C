unit Zabbix1C_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 30.12.2016 16:42:51 from Type Library described below.

// ************************************************************************  //
// Type Lib: G:\Delphi\Util1C\Zabbix\Zabbix1C.tlb (1)
// LIBID: {3F856440-DBC5-4C16-8129-47F17F3C8965}
// LCID: 0
// Helpfile: 
// HelpString: Zabbix1C Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Zabbix1CMajorVersion = 1;
  Zabbix1CMinorVersion = 0;

  LIBID_Zabbix1C: TGUID = '{3F856440-DBC5-4C16-8129-47F17F3C8965}';

  IID_IZabbix: TGUID = '{7E113DEE-533E-4CE3-BFD4-6B4BEB93BD63}';
  CLASS_Zabbix: TGUID = '{EC922F05-4419-4E34-84D8-85F5CB9F4725}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IZabbix = interface;
  IZabbixDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Zabbix = IZabbix;


// *********************************************************************//
// Interface: IZabbix
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7E113DEE-533E-4CE3-BFD4-6B4BEB93BD63}
// *********************************************************************//
  IZabbix = interface(IDispatch)
    ['{7E113DEE-533E-4CE3-BFD4-6B4BEB93BD63}']
    function Get_Host: WideString; safecall;
    procedure Set_Host(const Value: WideString); safecall;
    function Get_Port: Integer; safecall;
    procedure Set_Port(Value: Integer); safecall;
    function Get_Timeout: Integer; safecall;
    procedure Set_Timeout(Value: Integer); safecall;
    procedure Init(const HostZ: WideString; Port: Integer; Timeout: Integer); safecall;
    procedure Close; safecall;
    procedure Send(const Host: WideString; const KeyItem: WideString; const KeyValue: WideString); safecall;
    property Host: WideString read Get_Host write Set_Host;
    property Port: Integer read Get_Port write Set_Port;
    property Timeout: Integer read Get_Timeout write Set_Timeout;
  end;

// *********************************************************************//
// DispIntf:  IZabbixDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7E113DEE-533E-4CE3-BFD4-6B4BEB93BD63}
// *********************************************************************//
  IZabbixDisp = dispinterface
    ['{7E113DEE-533E-4CE3-BFD4-6B4BEB93BD63}']
    property Host: WideString dispid 201;
    property Port: Integer dispid 202;
    property Timeout: Integer dispid 205;
    procedure Init(const HostZ: WideString; Port: Integer; Timeout: Integer); dispid 203;
    procedure Close; dispid 204;
    procedure Send(const Host: WideString; const KeyItem: WideString; const KeyValue: WideString); dispid 206;
  end;

// *********************************************************************//
// The Class CoZabbix provides a Create and CreateRemote method to          
// create instances of the default interface IZabbix exposed by              
// the CoClass Zabbix. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoZabbix = class
    class function Create: IZabbix;
    class function CreateRemote(const MachineName: string): IZabbix;
  end;

implementation

uses ComObj;

class function CoZabbix.Create: IZabbix;
begin
  Result := CreateComObject(CLASS_Zabbix) as IZabbix;
end;

class function CoZabbix.CreateRemote(const MachineName: string): IZabbix;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Zabbix) as IZabbix;
end;

end.
