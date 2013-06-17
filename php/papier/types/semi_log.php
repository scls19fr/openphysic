<?php

/**
 * phpPapier2PDF
 *
 *  Copyright 2013 by Sebastien Celles <s.celles@gmail.com>
 *
 * This program is free software: you can redistribute 
 * it and/or modify it under the terms of the GNU General Public 
 * License as published by the Free Software Foundation, either 
 * version 3 of the License, or (at your option) any later version.
 * 
 * Some open source application is distributed in the hope that it will 
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @license GPL-3.0+ <http://spdx.org/licenses/GPL-3.0+>
 */

	function semi_log($nb_modules) {
		global $pdf;
		global $nb_papier;
		global $width;
		global $tick;
		global $couleur_rgb_prim;
		global $couleur_rgb_sec;
			
		for($page = 1; $page <= $nb_papier; $page++) {
			$pdf->AddPage();
			// Grille secondaire
			$pdf->SetLineWidth($width["normal"]);
			$pdf->SetDrawColor($couleur_rgb_sec[0], $couleur_rgb_sec[1], $couleur_rgb_sec[2]);
			
				// Lignes verticales secondaires
			for($j = 10; $j <= 200; $j++) {
				$pdf->Line($j, 10-$tick["small"], $j, 280+$tick["small"]);
			}
			$pdf->SetLineWidth($width["normal-bold"]);
			for($j = 10; $j <= 200; $j += 10) {
				$pdf->Line($j, 10-$tick["big"], $j, 280+$tick["big"]);
			}
			
				// Lignes horizontales secondaires
			$pdf->SetLineWidth($width["normal"]);
			for($i = 1; $i <= 10; $i += 0.1) {
				$y = 270/$nb_modules - log10($i) * 270/$nb_modules;
				for($module = 1 ; $module <= $nb_modules ; $module++) {
					$pdf->Line(10-$tick["small"], 10+$y, 200+$tick["small"], 10+$y);
					$y += 270/$nb_modules;
				}
			}
			
			
			$pdf->SetLineWidth($width["normal-bold"]);			
			for($i = 1; $i <= 10; $i += 0.5) {
				$x = 270/$nb_modules - log10($i) * 270/$nb_modules;
				for($module = 1 ; $module <= $nb_modules ; $module++) {
					$pdf->Line(10-$tick["big"], 10+$x, 200+$tick["big"], 10+$x);
					$y += 270/$nb_modules;
				}
			}
			
			
			// Grille primaire
			$pdf->SetLineWidth($width["bold"]);
			$pdf->SetDrawColor($couleur_rgb_prim[0], $couleur_rgb_prim[1], $couleur_rgb_prim[2]);
			for($i = 1; $i <= 10; $i++) {
				$y = 270/$nb_modules - log10($i) * 270/$nb_modules;
				for($module = 1 ; $module <= $nb_modules ; $module++) {
					$pdf->Line(10-$tick["verybig"], 10+$y, 200+$tick["verybig"], 10+$y);
					$y += 270/$nb_modules;
				}
			}
			for($j = 10; $j <= 200; $j += 50) {
				$pdf->Line($j, 10-$tick["verybig"], $j, 280+$tick["verybig"]);
			}
			$pdf->Line(200, 10-$tick["verybig"], 200, 280+$tick["verybig"]);
			$type_papier = 'Papier semi-logarithmique à 1 module';
		}
		$pdf->SetLineWidth($width["normal"]);
	}
?>