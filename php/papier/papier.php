<html>
<head>
<title>Papier</title>
</head>
<body>
<form method="post" action="/papier/gen_papier.php" name="papier">
  <div align="center"> 
    <table width="80%" border="0" cellspacing="0" cellpadding="0">

      <tr> 
        <td colspan="2"> 
          <div align="center">Type de papier : 
            <select name="papier">
              <option value="1" selected>Papier quadrill&eacute; 5mm x 5mm</option>
              <option value="2">Papier millimetr&eacute;</option>
              <option value="12">Papier semi-log 1 module</option>
              <option value="13">Papier semi-log 2 modules</option>
              <option value="3">Papier semi-log 3 modules</option>
              <option value="4">Papier semi-log 4 modules</option>
              <option value="14">Papier semi-log 5 modules</option>
	      <option value="5">Papier log-log 3 modules</option>
              <option value="6">Papier log-log 4 modules</option>
              <option value="7">Grille au pas 2,54mm</option>
	      <option value="8">Ligne d'écriture CP</option>
              <option value="9">Ligne d'écriture 12mm</option>
              <option value="10">Ligne d'écriture 10mm</option>
              <option value="11">Ligne d'écriture 8mm</option>
            </select>
            et le nombre d'exemplaires 
            <select name="nb_papier">
              <option value="1" selected>1</option>
              <option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
            </select>
          </div>
        </td>
      </tr>
      <tr> 
        <td colspan="2">&nbsp; </td>
      </tr>
      <tr> 
        <td colspan="2"> 
          <div align="center"><font color="#00CC00"><b>Facultatif</b></font></div>

        </td>
      </tr>
      <tr> 
        <td width="50%"> 
          <input type="checkbox" name="imp_type_papier" value="True" checked>
          Impression du type de papier et de la date en pied de page<br/>
          <input type="checkbox" name="imp_logo" value="True" checked>
          Impression du logo
        </td>
        <td width="50%"> 
          <div align="right">Couleur de la grille principale : 
            <select name="coul_prim">
              <option value="#000000" selected>Noir</option>
              <option value="#800000">Rouge</option>
	      <option value="#FF0000">Rouge foncé</option>
              <option value="#00FF00">Vert</option>
	      <option value="#008000">Vert foncé</option>
	      <option value="#FFFF00">Jaune</option>

	      <option value="#808000">Jaune foncé</option>
              <option value="#0000FF">Bleu</option>
	      <option value="#000080">Bleu foncé</option>
	      <option value="#FF00FF">Rose</option>
	      <option value="#800080">Rose foncé</option>
	      <option value="#00FFFF">Cyan</option>
	      <option value="#008080">Cyan foncé</option>
              <option value="#808080">Gris</option>
	      <option value="#C0C0C0">Gris clair</option>
            </select>
            <br/>
            Couleur de la grille secondaire : 
            <select name="coul_sec">
	      <option value="#000000">Noir</option>

              <option value="#800000">Rouge</option>
	      <option value="#FF0000">Rouge foncé</option>
              <option value="#00FF00">Vert</option>
	      <option value="#008000">Vert foncé</option>
	      <option value="#FFFF00">Jaune</option>
	      <option value="#808000">Jaune foncé</option>
              <option value="#0000FF">Bleu</option>
	      <option value="#000080">Bleu foncé</option>
	      <option value="#FF00FF">Rose</option>
	      <option value="#800080">Rose foncé</option>
	      <option value="#00FFFF">Cyan</option>
	      <option value="#008080">Cyan foncé</option>
              <option value="#808080" selected>Gris</option>
	      <option value="#C0C0C0">Gris clair</option>
            </select>
          </div>
        </td>
      </tr>
      <tr> 
        <td colspan="2">&nbsp;</td>

      </tr>
      <tr> 
        <td colspan="2">          <div align="center"> 
            <input type="submit" name="Submit" value="Valider">
            <input type="reset" name="retablir" value="R&eacute;tablir">
            <input type="button" name="fermer" value="Quitter" onClick="window.close();">
			</div>
        </td>
      </tr>

    </table>
  </div>
</form>
</body>
</html>

