[Setup]
AppId=5ef970f9-2b9e-4155-b7d6-a9d4dbd6b226
AppVersion={#MyAppVersion}
AppName=PiliPlus
AppPublisher=dom
AppPublisherURL=https://github.com/bggRGjQaUbCoE/PiliPlus
AppSupportURL=https://github.com/bggRGjQaUbCoE/PiliPlus
AppUpdatesURL=https://github.com/bggRGjQaUbCoE/PiliPlus
DefaultDirName={autopf}\PiliPlus
DisableProgramGroupPage=yes
OutputDir={#MyOutputDir}
OutputBaseFilename={#MyOutputFilename}
Compression=lzma
SolidCompression=yes
SetupIconFile={#MyIconFile}
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesAllowed=arm64
ArchitecturesInstallIn64BitMode=arm64

[Code]
procedure KillOldProcess;
var ResultCode: Integer;
begin
  Exec('taskkill', '/F /IM piliplus.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;

function InitializeSetup(): Boolean;
begin
  KillOldProcess;
  Result := True;
end;

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce
Name: "launchAtStartup"; Description: "{cm:AutoStartProgram,PiliPlus}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#MySourceDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\PiliPlus"; Filename: "{app}\piliplus.exe"
Name: "{autodesktop}\PiliPlus"; Filename: "{app}\piliplus.exe"; Tasks: desktopicon
Name: "{userstartup}\PiliPlus"; Filename: "{app}\piliplus.exe"; WorkingDir: "{app}"; Tasks: launchAtStartup

[Run]
Filename: "{app}\piliplus.exe"; Description: "{cm:LaunchProgram,PiliPlus}"; Flags: runascurrentuser nowait postinstall skipifsilent
