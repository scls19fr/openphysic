<?xml version='1.0'?>
<Project Type="Project" LVVersion="8508002">
   <Property Name="NI.Project.Description" Type="Str">Contrôle du turbojet Wren Turbines MW54 Mk 3 - Autostart Kit
IUT Poitiers
S. CELLES</Property>
   <Item Name="Poste de travail" Type="My Computer">
      <Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="server.tcp.enabled" Type="Bool">false</Property>
      <Property Name="server.tcp.port" Type="Int">0</Property>
      <Property Name="server.tcp.serviceName" Type="Str">Poste de travail/VI Serveur</Property>
      <Property Name="server.tcp.serviceName.default" Type="Str">Poste de travail/VI Serveur</Property>
      <Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
      <Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="specify.custom.address" Type="Bool">false</Property>
      <Item Name="read_buffer_turbo_rs232.vi" Type="VI" URL="read_buffer_turbo_rs232.vi"/>
      <Item Name="read_serial_turbo.vi" Type="VI" URL="read_serial_turbo.vi"/>
      <Item Name="sim_turbo_rs232.vi" Type="VI" URL="sim_turbo_rs232.vi"/>
      <Item Name="test_sim_turbo.vi" Type="VI" URL="test_sim_turbo.vi"/>
      <Item Name="fixed_string.vi" Type="VI" URL="fixed_string.vi"/>
      <Item Name="test_turbo_serial.vi" Type="VI" URL="test_turbo_serial.vi"/>
      <Item Name="button_press.vi" Type="VI" URL="button_press.vi"/>
      <Item Name="data_down.vi" Type="VI" URL="data_down.vi"/>
      <Item Name="data_up.vi" Type="VI" URL="data_up.vi"/>
      <Item Name="menu_down.vi" Type="VI" URL="menu_down.vi"/>
      <Item Name="menu_up.vi" Type="VI" URL="menu_up.vi"/>
      <Item Name="Dépendances" Type="Dependencies">
         <Item Name="vi.lib" Type="Folder">
            <Item Name="VISA Configure Serial Port" Type="Document" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
            <Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
            <Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
            <Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
            <Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
            <Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
            <Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
            <Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
            <Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
            <Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
            <Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
            <Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
            <Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
            <Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
            <Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
            <Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
            <Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
            <Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
            <Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
            <Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
            <Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
            <Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
            <Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
            <Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
            <Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
            <Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
            <Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
            <Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
            <Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
            <Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
            <Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
         </Item>
      </Item>
      <Item Name="Spécifications de construction" Type="Build">
         <Item Name="setup_Wren_Turbines_MW54_Mk_3_Autostart_Kit" Type="Installer">
            <Property Name="arpCompany" Type="Str">IUT Poitiers - Département Génie Thermique et Energie</Property>
            <Property Name="arpContact" Type="Str">Sébastien CELLES</Property>
            <Property Name="arpPhone" Type="Str">0549453439</Property>
            <Property Name="arpURL" Type="Str">http://wwwiutp.univ-poitiers.fr</Property>
            <Property Name="AutoIncrement" Type="Bool">true</Property>
            <Property Name="BuildLabel" Type="Str">setup_Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="BuildLocation" Type="Path">../../Builds/turbo/setup_Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="DirInfo.Count" Type="Int">1</Property>
            <Property Name="DirInfo.DefaultDir" Type="Str">{DDE590CC-69F1-4B3E-941A-8BD0AA041F3A}</Property>
            <Property Name="DirInfo[0].DirName" Type="Str">turbo</Property>
            <Property Name="DirInfo[0].DirTag" Type="Str">{DDE590CC-69F1-4B3E-941A-8BD0AA041F3A}</Property>
            <Property Name="DirInfo[0].ParentTag" Type="Str">{3912416A-D2E5-411B-AFEE-B63654D690C0}</Property>
            <Property Name="DistID" Type="Str">{C6485952-10A4-432B-91BF-FE93117FA3CC}</Property>
            <Property Name="DistParts.Count" Type="Int">2</Property>
            <Property Name="DistPartsInfo[0].FlavorID" Type="Str">DefaultFull</Property>
            <Property Name="DistPartsInfo[0].ProductID" Type="Str">{47FFFF8E-A6E7-4C9A-AB7B-1BE0FE29A95A}</Property>
            <Property Name="DistPartsInfo[0].ProductName" Type="Str">NI Moteur d'exécution de LabVIEW 8.5</Property>
            <Property Name="DistPartsInfo[0].UpgradeCode" Type="Str">{99D796C3-2E53-4839-A25B-22C26B029103}</Property>
            <Property Name="DistPartsInfo[1].FlavorID" Type="Str">_deployment_</Property>
            <Property Name="DistPartsInfo[1].ProductID" Type="Str">{5DBDA3D6-7D16-419C-8434-219011CF652B}</Property>
            <Property Name="DistPartsInfo[1].ProductName" Type="Str">Moteur d'exécution de NI-VISA 4.2</Property>
            <Property Name="DistPartsInfo[1].UpgradeCode" Type="Str">{8627993A-3F66-483C-A562-0D3BA3F267B1}</Property>
            <Property Name="FileInfo.Count" Type="Int">2</Property>
            <Property Name="FileInfo[0].DirTag" Type="Str">{DDE590CC-69F1-4B3E-941A-8BD0AA041F3A}</Property>
            <Property Name="FileInfo[0].FileName" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit.exe</Property>
            <Property Name="FileInfo[0].FileTag" Type="Str">{AA0FEF1C-93B5-43A7-AB3E-0C98C0657331}</Property>
            <Property Name="FileInfo[0].Type" Type="Int">3</Property>
            <Property Name="FileInfo[0].TypeID" Type="Ref">/Poste de travail/Spécifications de construction/Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="FileInfo[1].DirTag" Type="Str">{DDE590CC-69F1-4B3E-941A-8BD0AA041F3A}</Property>
            <Property Name="FileInfo[1].FileName" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit.aliases</Property>
            <Property Name="FileInfo[1].FileTag" Type="Str">{8BD03EF2-2AE4-4E77-BEAA-1262EDEF6458}</Property>
            <Property Name="FileInfo[1].Type" Type="Int">3</Property>
            <Property Name="FileInfo[1].TypeID" Type="Ref">/Poste de travail/Spécifications de construction/Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="InstSpecVersion" Type="Str">8508002</Property>
            <Property Name="Language" Type="Int">12</Property>
            <Property Name="LicenseFile" Type="Ref"></Property>
            <Property Name="OSCheck" Type="Int">0</Property>
            <Property Name="OSCheck_Vista" Type="Bool">false</Property>
            <Property Name="ProductName" Type="Str">turbo</Property>
            <Property Name="ProductVersion" Type="Str">1.0.0</Property>
            <Property Name="ReadmeFile" Type="Ref"></Property>
            <Property Name="ShortcutInfo.Count" Type="Int">1</Property>
            <Property Name="ShortcutInfo[0].DirTag" Type="Str">{B9E310F1-839C-48B7-8CAE-33000780C26E}</Property>
            <Property Name="ShortcutInfo[0].FileTag" Type="Str">{AA0FEF1C-93B5-43A7-AB3E-0C98C0657331}</Property>
            <Property Name="ShortcutInfo[0].FileTagDir" Type="Str">{DDE590CC-69F1-4B3E-941A-8BD0AA041F3A}</Property>
            <Property Name="ShortcutInfo[0].Name" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="ShortcutInfo[0].SubDir" Type="Str">turbo</Property>
            <Property Name="UpgradeCode" Type="Str">{65EAF93D-07A4-4781-BF20-417059DA5584}</Property>
         </Item>
         <Item Name="Wren_Turbines_MW54_Mk_3_Autostart_Kit" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{AA0FEF1C-93B5-43A7-AB3E-0C98C0657331}</Property>
            <Property Name="App_applicationName" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit.exe</Property>
            <Property Name="App_companyName" Type="Str">IUT Poitiers</Property>
            <Property Name="App_fileDescription" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{8BD03EF2-2AE4-4E77-BEAA-1262EDEF6458}</Property>
            <Property Name="App_INI_GUID" Type="Str">{0E7B8D5F-ADCB-42F4-B4C2-7C4C623FD53A}</Property>
            <Property Name="App_internalName" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright 2008 IUT Poitiers</Property>
            <Property Name="App_productName" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="Bld_buildSpecName" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit</Property>
            <Property Name="Bld_defaultLanguage" Type="Str">French</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">Wren_Turbines_MW54_Mk_3_Autostart_Kit.exe</Property>
            <Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Wren_Turbines_MW54_Mk_3_Autostart_Kit/internal.llb</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Répertoire de support</Property>
            <Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Wren_Turbines_MW54_Mk_3_Autostart_Kit/data</Property>
            <Property Name="DestinationCount" Type="Int">2</Property>
            <Property Name="Source[0].itemID" Type="Str">{8846C234-8E29-415B-ACB9-97F597056446}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref">/Poste de travail/test_sim_turbo.vi</Property>
            <Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[1].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">2</Property>
         </Item>
      </Item>
   </Item>
</Project>
