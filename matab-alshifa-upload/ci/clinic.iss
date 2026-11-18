; Inno Setup script - real Windows installer for Clinic Sync (installs to Program Files, adds firewall rule once)
#define AppVer GetEnv("CLINIC_VER")
[Setup]
AppId={{3237CE46-E714-4222-9455-F1AAC1135C58}
AppName=Matab Alshifa
AppVersion={#AppVer}
AppPublisher=Matab Alshifa
VersionInfoVersion={#AppVer}.0
VersionInfoCompany=Matab Alshifa
DefaultDirName={localappdata}\Programs\Matab Alshifa
DefaultGroupName=Matab Alshifa
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
DisableDirPage=yes
DisableReadyPage=no
UsePreviousAppDir=no
OutputDir=..\dist
OutputBaseFilename=MatabAlshifa-Setup
SetupIconFile=..\pc\icon.ico
UninstallDisplayIcon={app}\MatabAlshifa.exe
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes
RestartApplications=no
ArchitecturesInstallIn64BitMode=x64compatible

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; Flags: checkedonce

[Files]
Source: "..\build_app\MatabAlshifa.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\Matab Alshifa"; Filename: "{app}\MatabAlshifa.exe"
Name: "{autodesktop}\Matab Alshifa"; Filename: "{app}\MatabAlshifa.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\MatabAlshifa.exe"; Description: "Start Matab Alshifa now"; Parameters: "--noinstall"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "{sys}\taskkill.exe"; Parameters: "/F /IM MatabAlshifa.exe"; Flags: runhidden

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
var R: Integer;
begin
  if CurStep = ssInstall then Exec(ExpandConstant('{sys}\taskkill.exe'), '/F /IM MatabAlshifa.exe', '', SW_HIDE, ewWaitUntilTerminated, R);
end;
