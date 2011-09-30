Turbojet WrenTrubines MW54 Mk3 Turbo-Jet Kit with Autostart
http://wrenturbines.co.uk

ECU FADEC
http://www.espiell.com/soft.htm
http://www.espiell.com/fadprot.pdf Protocole de communication série

VI Labview pour le contrôle du turbojet
par S. CELLES
	test_turbo_serial.vi : VI permettant la visualisation des données depuis l'ECU connecté via la liaison série (cable USB Xicoy)
		read_serial_turbo.vi : sous-VI connexion série et chaîne de caractères en sortie
	test_sim_turbo.vi : VI simulant l'envoi des trames par l'ECU et visulisant les données
		sim_turbo_rs232.vi : sous-VI simulant l'envoi des trames par l'ECU (chaîne de caractères en sortie)
			fixed_string : sous-VI générant une chaîne de taille définie à partir d'une autre chaîne	
		read_buffer_turbo_rs232.vi : sous-VI découpant la chaîne de caractère pour former un cluster comportant les données lues sur la liaison série

button_press.vi
menu_down.vi / menu_up.vi / data_up.vi / data_down.vi
sous-vi gestion du clavier

stick_trim_2_channel.vi : sous-vi tranformant la valeur du stick (0-100%) et la valeur du trim(-100% ; 100%) en une information (channel value) comprise entre 0 et 100%
test_stick_trim.vi : test du sous-vi stick_trim_2_channel.vi

channel_2_pulsewidth.vi / channel_2_u8.vi / channel_2_u16.vi / channel_2_vdc.vi : sous-vi tranformant une information channel value en largeur d'impulsion (us), entier non signé sur 8 bits (U8), entier non signé sur 16 bits (U16), en tension continu entre 0 et 5V

calibration_stick_trim.vi : sous-vi étalonnage du stick/trim afin de régler la position pour l'arrêt, le ralenti et la pleine puissance


ToDo
Testeur de servo USB avec drivers FTDI D2XX
voir ouverture et fermeture du handle du matériel
