<?xml version='1.0'?>
<Project Type="Project" LVVersion="8508002">
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
      <Item Name="test_ecartements_positions.vi" Type="VI" URL="test_ecartements_positions.vi"/>
      <Item Name="calc_h.vi" Type="VI" URL="calc_h.vi"/>
      <Item Name="calc_k.vi" Type="VI" URL="calc_k.vi"/>
      <Item Name="calc_lambda.vi" Type="VI" URL="calc_lambda.vi"/>
      <Item Name="ecartements_positions.vi" Type="VI" URL="ecartements_positions.vi"/>
      <Item Name="splash.vi" Type="VI" URL="splash.vi"/>
      <Item Name="main_sim.vi" Type="VI" URL="main_sim.vi"/>
      <Item Name="Dépendances" Type="Dependencies">
         <Item Name="vi.lib" Type="Folder">
            <Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
            <Item Name="subBuildXYGraph.vi" Type="VI" URL="/&lt;vilib&gt;/express/express controls/BuildXYGraphBlock.llb/subBuildXYGraph.vi"/>
            <Item Name="Dynamic To Waveform Array.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Dynamic To Waveform Array.vi"/>
            <Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
            <Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
         </Item>
      </Item>
      <Item Name="Spécifications de construction" Type="Build">
         <Item Name="tp_barre_semi_infinie" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{A114647C-19FA-44BD-A848-6114FFB73E72}</Property>
            <Property Name="App_applicationName" Type="Str">tp_barre_semi_infinie.exe</Property>
            <Property Name="App_companyName" Type="Str">EN</Property>
            <Property Name="App_fileDescription" Type="Str">tp_barre_semi_infinie</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{302CB19D-72C4-484B-9216-A560FBC756F1}</Property>
            <Property Name="App_INI_GUID" Type="Str">{AEE124A8-5D66-4462-8CB3-10D3D2772A58}</Property>
            <Property Name="App_internalName" Type="Str">tp_barre_semi_infinie</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright 2009 EN</Property>
            <Property Name="App_productName" Type="Str">tp_barre_semi_infinie</Property>
            <Property Name="Bld_buildSpecName" Type="Str">tp_barre_semi_infinie</Property>
            <Property Name="Bld_defaultLanguage" Type="Str">French</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">tp_barre_semi_infinie.exe</Property>
            <Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/tp_barre_semi_infinie/internal.llb</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Répertoire de support</Property>
            <Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/tp_barre_semi_infinie/data</Property>
            <Property Name="DestinationCount" Type="Int">2</Property>
            <Property Name="Source[0].itemID" Type="Str">{5867DE9A-CA16-4D16-B0CA-BCB1618B049C}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref"></Property>
            <Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[1].type" Type="Str">VI</Property>
            <Property Name="Source[2].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[2].itemID" Type="Ref">/Poste de travail/splash.vi</Property>
            <Property Name="Source[2].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[2].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">3</Property>
         </Item>
      </Item>
   </Item>
</Project>
