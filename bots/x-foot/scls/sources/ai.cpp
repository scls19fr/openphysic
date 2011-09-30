//////////////////////////////////////////////////////////////////////
//
//                             X-Foot
//
// Copyright © 2001 - 2005, Cedric Ronvel
//
// Contact: estariel@x-foot.net
//
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License as published by the Free Software Foundation; either
// version 2 of the License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
//
//  File                :       AI.cpp
//  Classes             :       Advanced_Example_AI
//  Description         :       advanced example of how to make a team
//
////////////////////////////////////////////////////////////////////////




#include "ai.h"
#include <math.h>

#include "vector.h"
#include "time.h"
//#include "random.h"
//#include "fuzzy.h"


////////////////////////////////////////////////////////////////////////

int main ( int argc , char** argv )
{
	// [EN] create an instance of the Advanced_Example_AI class:
	// [FR] crée une instance de la classe Advanced_Example_AI:
	Advanced_Example_AI ai;	
	
	// [EN] ... and start it:
	// [FR] ... et la lance:
	return ai.Launch();
}

////////////////////////////////////////////////////////////////////////

Advanced_Example_AI::Advanced_Example_AI () :
	X_Foot_AI()
{
	// [EN] AI construction
	// [FR] construction de l'IA	
}

////////////////////////////////////////////////////////////////////////

Advanced_Example_AI::~Advanced_Example_AI ()
{
	// [FR] AI destruction
	// [EN] destruction de l'IA	
}

////////////////////////////////////////////////////////////////////////

void Advanced_Example_AI::configure ( TeamConfigurator& team )
{	
        cout << "*********** Configure scls AI ***********" << endl;

	// [EN] your nickname... useless, just for fun
	// [FR] ton pseudo... en fait Áa sert ‡ rien, sauf pour le fun
	team.SetCoach( "Scls coach" ) ;

	// [EN] your team name:
	// [FR] le nom de ton Èquipe
	team.SetTeam( "Scls Team" ) ;

	// [EN] version number; standard : "x.yz"
	// [FR] numéro de version; le standard : "x.yz"
	team.SetVersion( "0.1" ) ;

	// [EN] It allows to chat in the correct langage - standard : fr us uk ...
	// [FR] A titre indicatif... permet de tchatter dans la langue appropriée - le standard : fr us uk ...
	team.SetNation( "fr" ) ;

	// [EN] your team logo file:
	// [FR] le fichier logo de ton équipe:
	team.SetLogo( "basic_bot" ) ;

	// [EN] Your team's players name: 
	// [FR] Le nom de tous les joueurs de ton équipe:
	team.SetPlayer( Goalkeeper, "Goalkeeper" ) ;
	team.SetPlayer( Player_2, "P2" ) ;
	team.SetPlayer( Player_3, "P3" ) ;  
	team.SetPlayer( Player_4, "P4" ) ;
	team.SetPlayer( Player_5, "P5" ) ;  
	team.SetPlayer( Player_6, "P6" ) ;  
	team.SetPlayer( Player_7, "P7" ) ;  
	team.SetPlayer( Player_8, "P8" ) ;  
	team.SetPlayer( Player_9, "P9" ) ;  
	team.SetPlayer( Player_10, "P10" ) ;
	team.SetPlayer( Player_11, "P11" ) ; 

        int pid=getpid ();
        srand(pid*time(NULL));;
        int rnd = 0;
	//rnd = rand();
        //rnd = (rand() % 11) + 1; // entre 1 et 11
        //rnd = (rand() % 11) + 2; // entre 2 et 11
        //cout << "Random=" << rnd << endl;
}

////////////////////////////////////////////////////////////////////////

void Advanced_Example_AI::init ( const Parameter& parameter )
{
	// [EN]
	// This method allows you to init the AI depending on Parameter
	// Parameter contains match-relative data 
	// (both teams attributes, halftime, etc)	
	// This particular example doesn't need any initialization.
	// [FR]
	// Cette méthode sert à initialiser l'IA en fonction de Parameter
	// Parameter contient toutes les données relatives au match 
	// (caractéristiques des deux equipes, temps d'une mi-temps, etc)
	// Cet exemple simple ne nécessite pas d'initialisation particulière.
	
	// [FR] Here we save parameter in the AI instance:
	// [FR] Ici on sauve parameter dans l'instance de l'IA:
	param = parameter ;
}

////////////////////////////////////////////////////////////////////////

void Advanced_Example_AI::update ( const Situation& situation, OrdersManager& orders, ChatterBox& chat )
{
	// [EN]
	// 'situation' contains all the match elements state
	// 'orders' allows you to give an order to each player each time the method's called
	// 'chat' allows to send text messages which will be displayed during the match
	// [FR]
	// 'situation' contient l'état actuel de tous les éléments du match
	// 'orders' vous permet de donner un order par joueur à chaque appel de cette méthode
	// 'chat' permet d'envoyer des messages texte qui seront affichés pendant le match
	
	preliminaries( situation ) ;

	goalkeeper( situation , orders , chat ) ;

	player( situation , orders , chat ) ;
}


////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////
// [EN] First we make some preliminary 
// computing, usefull further
// [FR] D'abord on va effectuer quelques calculs   
// préliminaires bien utiles pour la suite    
////////////////////////////////////////////////

void Advanced_Example_AI::preliminaries ( const Situation& situation )
{
	// [EN] Some variables to earn some time...
	// [FR] Quelques variables pour gagner du temps... 
	short3 ballPos = situation.GetBallState().GetPos();
	short3 ballSpeed = situation.GetBallState().GetSpeedVec();
	short myOffSideLimit = situation.GetGameState().GetMyOffSideLimit();		// [EN] this variable contains the virtual offside line
	virtual_ballPos = ballPos ;

	// [EN] we watch if the team 'virtually' has the ball
	// [FR] on regarde si l'equipe a 'virtuellement' le ballon
	if ( situation.GetGameState().IsForMe() )  
	{
		// [EN] we got the ball!
		// [FR] c'est nous qui l'avons !
		we_got_the_ball = true ;
	}
	else  
	{
		// [EN] adversary got the ball
		// [FR] c'est l'adversaire qui l'a 
		we_got_the_ball = false ;
	}
  
	// En remplacant la ligne du 'if' par celle-là
	// if ( situation.GetBallState().GetLastPlayer().GetTeam() == AdvTeam ) 
	// on regarderait qui a réellement touché le ballon en dernier, alors
	// que dans notre programme on veut savoir qui l'a touché et en a fait ce
	// qu'il en voulait ( exit les collisions involontaires ou le frolage de ballon)
  
	// [EN] if we are in a game stop
	// (waiting for a free kick, a corner, a throw in, etc...), we consider
	// the ball is already at the position it will be teleported to.
	// [FR] si on est dans un arret de jeu
	// (en attente d'un coup franc, corner, touche etc...), on considËre
	// que le ballon se trouve déjà à la position à laquelle il va etre téléporté	
	if ( situation.GetGameState().IsStopped() )
	{
		short2 ballOutPos = situation.GetGameState().GetBallOutPos();
		if ( we_got_the_ball ) 
		{
			virtual_ballPos.y = ( ballOutPos.y / 10 ) * 12 ;
		}
		else  
		{
			virtual_ballPos.y = ( ballOutPos.y / 10 ) * 8 ;
		}
		virtual_ballPos.x = ballOutPos.x - 500 + abs( virtual_ballPos.y / 10 ) ;
		myOffSideLimit = myOffSideLimit - 500 + abs( virtual_ballPos.y / 10 ) ;
	}
  
	// [EN] reference positions computing
	// [FR] calcul des positions de reference
	
	// [EN] Warning : growing x in the adversary direction
	// y are growing on the right when we look at the adversary goal...
	// [FR] Attention : les x sont croissant vers le but adverse, 
	// les y croissent vers la droite quand on regarde le but adverse... 

	// [EN] goalkeeper reference position
	// [FR] position de reference du gardien
	Ref_x[0] = GOAL_x + 100 ;	// [EN] goal's center, one meter forward [FR] c-a-d au centre du but, un metre en avant
	Ref_y[0] = 0 ;
  
	// [EN] other playerd reference position... we'll code a good old 4-3-3 
	// [FR] position de reference des autres joueurs... on va coder une bonne vieille 4-3-3 à plat
	Ref_y[1] = PENALTYAREA_ymin ;
	Ref_y[2] = GOAL_ymin ;
	Ref_y[3] = GOAL_ymax ;
	Ref_y[4] = PENALTYAREA_ymax ;
	Ref_y[5] = PENALTYAREA_ymin - 150 ;
	Ref_y[6] = + 100 ;
	Ref_y[7] = PENALTYAREA_ymax + 150 ;
	Ref_y[8] = PENALTYAREA_ymin + 250 ;
	Ref_y[9] = - 100 ;
	Ref_y[10] = PENALTYAREA_ymax - 250 ;

	// [EN] we set the defense lines, middle and front (x coordinate)	
	// [FR] On fixe les lignes defensives, milieu et avant (leur coordonnee x)
																				// [FR] cette variable contient la ligne virtuelle de hors-jeu
	if ( we_got_the_ball )  
	{
		// [EN] the attack line is placed 5 meters before the offside limit when we got the ball 
		// [FR] la ligne d'attaque se place 5 metres a la limite du hors-jeu quand on a le ballon
		Attaque = myOffSideLimit - 500 ;	
		Limite = myOffSideLimit - 150 ;
	}
	else  
	{
		// [EN] else it's placed 8 meters beyond
		// [FR] Sinon elle se place 8 metres en arrière	
		Attaque = myOffSideLimit - 800 ;
		Limite = myOffSideLimit - 250 ;
	}
  
  
	if ( we_got_the_ball )  
	{
		Defense = virtual_ballPos.x - 600 ;		// [EN] If we got the ball, the defense line is placed 6 meters beyond the ball
										// [FR] Si on a le ballon, la ligne défensive se place 6 metres derriere le ballon
		if ( Defense > 0 ) 
		{	
			Defense = 0 ;	// [EN] without going further than the ground center
							// [FR] sans toutefois dépasser le centre du terrain
		}
	}
	else  
	{
		Defense = virtual_ballPos.x - 1500 ;	// [EN] else the defense line is placed 15 meters beyond the ball 
										// [FR] sinon la ligne défensive se place 15 mètres derrière le ballon
		
		if ( Defense > 0 )  
		{
			Defense = 0 ;	// [EN] without going further than the ground center
							// [FR] sans toutefois dépasser le centre du terrain
		}
		
		if ( Defense > Attaque - 3000 )
		{
			Defense = Attaque - 3000 ;	// [EN] without being too close to the attack line
										// [FR] sans non plus être trop près de la ligne des attaquants
		}
		else if ( Defense < GOALKICK_xmax - 100 )
		{
			Defense = GOALKICK_xmax - 100 ;		// [EN] neither going too far in the goal
												// [FR] ni trop rentrer dans les buts
		}
	}
  
	if ( Attaque > - PENALTY_x )  Attaque = - PENALTY_x ;
	Milieu = ( Defense + Attaque ) / 2 ; 

	// [EN] the middle players are going between the two lines
	// [FR] Les milieux de terrain se place entre les deux lignes
	Ref_x[1] = Ref_x[2] = Ref_x[3] = Ref_x[4] = Defense ;
	Ref_x[5] = Ref_x[7] = Milieu ;
	if ( virtual_ballPos.x > 200 )
	{
		Ref_x[6] = ( Milieu + Attaque ) / 2 ;
	}
	else
	{
		Ref_x[6] = ( Milieu + Defense ) / 2 ;
	}
	Ref_x[8] = Ref_x[9] = Ref_x[10] = Attaque ; 
  

	// [EN] computing of the nearest player to the ball (of our team)
	// [FR] Calcul de l'alliÈ le plus proche du ballon
	int index ;
	short Distance ;
	short Mini ;

	Mini = 20000 ;
  
	short3 currentPlayerPos;
  

	// [EN] for the 10 field players, do
	// [FR] Pour les 10 joueurs de champ, faire...
	for ( index = 1 ; index < 11 ; index ++ )  
	{
		currentPlayerPos = situation.GetMyPlayerState((Player)index).GetPos();	// [FR] Get the current player position
		
		Distance = (short)sqrt( pow( virtual_ballPos.x +  ballSpeed.x - currentPlayerPos.x , 2 ) + pow( virtual_ballPos.y + ballSpeed.y - currentPlayerPos.y , 2 ) ) ;
    	// [EN] It's the magic formula to compute a distance (thanks Pythagore!), between points A & B, and this is:
    	// sqrt( pow( Ax - Bx , 2 ) + pow ( Ay - By , 2 ) ) 
    	// Here we calculate the distance between the ball and the current player
    	// [FR] C'est la formule magique pour calculer une distance ( merci pythagore ! ), entre un point A et B ça donne :
    	// sqrt( pow( Ax - Bx , 2 ) + pow ( Ay - By , 2 ) ) 
    	// Ici je calculais donc la distance entre le ballon et le joueur courant
    
    
		if ( Distance < Mini )  // [EN] We're searching the minimal distance [FR] On cherche la distance minimale
		{		
			Mini = Distance ;			
			n_proche_allie = index ;
			dist_proche_allie = Mini ;
		}
	}

	// [EN] out from the loop, we've got:
	//   -  n_proche_allie contains the number of the nearest player in the team
	//   -  dist_proche_allie contains its distance to the ball	
	// [FR] En sortant de la boucle on a :
	//   -  n_proche_allie qui contient le no du joueur de notre équipe le plus proche
	//   -  dist_proche_allie qui contient sa distance au ballon
  
	// [EN] Computing of the nearest player to the ball in the adversary team
	// ( same thing as for our team )
	// [FR] Calcul de l'adversaire le plus proche du ballon
	// ( la même chose mais pour l'adversaire... )
	Mini = 20000 ;

	for ( index = 1 ; index < 11 ; index ++ )  
	{
		currentPlayerPos = situation.GetAdvPlayerState((Player)index).GetPos();

		Distance = (short)sqrt( pow( virtual_ballPos.x - currentPlayerPos.x , 2 ) + pow( virtual_ballPos.y - currentPlayerPos.y , 2 ) ) ;

		if ( Distance < Mini )  
		{
			Mini = Distance ;
			n_proche_adversaire = index ;
			dist_proche_adversaire = Mini ;
		}
	}
  
	// [EN] same thing at the end of the loop for the adversary
	// [FR] Idem en sortie de boucle pour l'adversaire

	// [EN] Computing of the best placed player, protecting the nearest	
	// [FR] Calcul de l'allie le mieux place en couverture du plus proche


	Mini = 20000 ;
	n_couvre_allie = n_proche_allie ;	// si y'en a pas c'est lui-même 

	for ( index = 1 ; index < 11 ; index ++ )  
	{
		currentPlayerPos = situation.GetMyPlayerState((Player)index).GetPos();
    
		if ( ( currentPlayerPos.x < virtual_ballPos.x ) && ( index != n_proche_allie ) )   // [EN] ^- if we want it to stay behind [FR] ^- on veut qu'il soit en retrait
		{
			Distance = (short)sqrt( pow( virtual_ballPos.x - 200 - currentPlayerPos.x , 2 ) + pow( virtual_ballPos.y - currentPlayerPos.y , 2 ) ) ;
      
			if ( Distance < Mini )  
			{
				Mini = Distance ;
				n_couvre_allie = index ;
				dist_couvre_allie = Mini ;
			}    
		}    
	}
  

	// [EN] Computing of the best placed player for a pass
	// [FR] Calcul de l'alliÈ le mieux placé pour une passe
  
	Mini = 20000 ;
	n_passe_allie = n_proche_allie ;	// [EN] if there's no, so it's himslef // [FR] si y'en a pas c'est lui-mÍme 

	for ( index = 1 ; index < 11 ; index ++ )  
	{
		currentPlayerPos = situation.GetMyPlayerState((Player)index).GetPos();
    
                if ( ( currentPlayerPos.x > virtual_ballPos.x + 150 ) && ( index != n_proche_allie ) )  
                                              // [EN] ^- we want it to be in front 
                                              // [FR] ^- on veut qu'il soit devant
		{
			Distance = (short)sqrt( pow( virtual_ballPos.x - currentPlayerPos.x , 2 ) + pow( virtual_ballPos.y - currentPlayerPos.y , 2 ) ) ;
	
			if ( ( Distance < Mini ) && ( Distance > 800 ) )  
			{
				// [EN] ^- we don't want it to be too near neither
				// [FR] ^- on veut pas qu'il soit trop proche non plus
				Mini = Distance ;
				n_passe_allie = index ;
				dist_passe_allie = Mini ;
			}    
		}
	}
  

	// [EN] Computing of the best defense placed adversary
	// ( ... )	
	// [FR] Calcul de l'adversaire le mieux placé en défense
	// ( ... )

	Mini = 20000 ;
	n_def_adversaire = n_proche_adversaire ;	// [EN] if there's no one, it's itself // [FR] si y'en a pas c'est lui-même 
  
	for ( index = 1 ; index < 11 ; index ++ )  
	{
		currentPlayerPos = situation.GetAdvPlayerState((Player)index).GetPos();

		if ( ( currentPlayerPos.x > virtual_ballPos.x ) && ( index != n_proche_adversaire ) )  // [EN] we want him to be in front of us // [FR] ^- on veut qu'il soit devant nous
		{
			Distance = (short)sqrt( pow( virtual_ballPos.x - currentPlayerPos.x , 2 ) + pow( virtual_ballPos.y - currentPlayerPos.y , 2 ) ) ;
			if ( Distance < Mini )  
			{
				Mini = Distance ;
				n_def_adversaire = index ;
				dist_def_adversaire = Mini ;
			}    
		}
	}
  
	// [EN] Now we're more aware of the game state! 
	// [FR] Nous voila mieux renseigné sur l'etat du jeu ! 

}


////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////
// On va maintenant s'occuper du gardien //
///////////////////////////////////////////

void Advanced_Example_AI::goalkeeper ( const Situation& situation, OrdersManager& orders, ChatterBox& chat )
{
	// [EN] Some variables to earn some time and lisibility
	// [FR] Quelques variables pour gagner du temps et de la lisibilité	
	short3 ballSpeed = situation.GetBallState().GetSpeedVec();

	short2 position;

	// [EN] A dark computing ( and imperfect ! ) pour find the goalkeeper y position 
	// [FR] Un calcul bien obscur ( et imparfait ! ) pour trouver la position y du gardien
	position.y = ( virtual_ballPos.y + ballSpeed.y ) / 3 ;

	// [EN] We don't want the goalkeeper to go out the goal :	
	// [FR] On veut pas que le gardien dépasse les poteaux :
	if ( position.y < GOAL_ymin )   
	{
		position.y = GOAL_ymin ;
	}
	
	if ( position.y > GOAL_ymax )
	{
		position.y = GOAL_ymax ;
	}

	// [EN] If the goalkeeper can interact...
	// [FR] Si le gardien peut intéragir...
	if ( situation.GetMyPlayerState( Goalkeeper ).CanInteract() )  
	{
		// [EN] ... so he kicks the ball far away from the goal
		// [FR] ... alors il dégage le ballon loin des buts
		short2 shootPos (0, situation.GetMyPlayerState((Player)n_passe_allie).GetPos().y);

		// [EN] The order means to shoot a lob trying to fall down
		// to a special ground position 
		// operand 1 corresponds to the this point's ground coordinate 
		// operand 2 corresponds to the high pass height in centimeters
		//   -> here we make a 6 meters high pass 
		// [FR] L'ordre indique de tirer un lob en essayant qu'il retombe
		// sur un point précis du sol
		// l'opérande 1 indique la coordonnée au sol de ce point
		// l'opérande 2 indique la hauteur du lob en centimètre
		//   -> ici ça fait un lob de 6 metres de haut		
		orders( Goalkeeper ).ShootLobTo( shootPos , 600 ) ;

		// [EN] ^- this line is used to chat on the X-Foot screen
		// The first argument defines who chats (here id 0 player, the GoalKeeper)
		// the second defines text itself...		
		// [FR] ^- cette ligne sert à tchatter sur l'écran d'x-foot,
		// Le premier argument donne qui parle (ici le gardien, donc 0), 
		// le deuxième définit le texte lui-même...
		chat.PlayerChat( Goalkeeper, "I'm kicking !!!");
    						
		////////////////////////////////////////////////////////////////////////////
		// [EN] Take a look at the AI programming guide for a full description of 
		// the available orders in the documentation.
		// [FR] La liste complète des orders disponible se trouve dans 
		// le guide de programmation d'IA dans la documentation.
		////////////////////////////////////////////////////////////////////////////
	}

	// [EN] Else the ball is in the penalty area...
	// [FR] Sinon si le ballon est dans la surface de but... 
	else if ( ( virtual_ballPos.x < GOALKICK_xmax ) && ( virtual_ballPos.y < GOALKICK_ymax ) && ( virtual_ballPos.y > GOALKICK_ymin ) )  
	{
		// [EN] there's a emergency of adversary shoot to the goal ! 
		// [FR] Il y a un risque imminent de tir au but ! 
		chat.PlayerChat( Goalkeeper , "Houla, I'm diving !" ) ;

		// [EN] The GoalKeeper will try to run to the ball
		// [FR] Le gardien va donc essayer d'aller sur le ballon
		position.x = virtual_ballPos.x + ballSpeed.x ;	
		position.y = virtual_ballPos.y + ballSpeed.y ;

		// [EN] as we want to anticipate the shoot, we don't place the player to the ball's position
		// but to the position the ball will be at in one second
		// i.e. ball's position + its speed
		// [FR] comme on veut anticiper le tir, on ne se place pas à la position du ballon
		// mais à la position du ballon + sa vitesse
		// c-a-d à l'endroit où sera le ballon dans une seconde

		// [EN] We don't want the goal keeper to go out of the goal ...
		// ... either to be beyond the goal line
		// [FR] On ne veut pas que le gardien dépasse les poteaux ...
		// ... ni soit derrière la ligne de but		
		if ( position.y < GOAL_ymin )
		{
			position.y = GOAL_ymin ;	
		}
		if ( position.y > GOAL_ymax )   
		{
			position.y = GOAL_ymax ;	
		}
		if ( position.x < GOAL_x ) 
		{
			position.x = GOAL_x ;		 
		}

		orders( Goalkeeper ).DiveTo( position , 850 ) ;
		// [EN] ^- it means that we want to define the order for the goal keeper
		// ( id 0, because arrays start at 0 )
		// We choose DiveTo, the same as GoTo, but the available acceleration
		// is triple; only the goal keeper can handle that order.
		// ... In counterpart, diving only lasts a short time, and keep the goal keeper 
		// a quite long time when finished
		// order operand 1 : the position you want to dive to
		// order operand 2 : the maximum allowed speed during the diving
		// here it's 8.5 meter per second, the player maximum speed
		// [FR] ^- cela signifie qu'on veut définir l'ordre du joueur no0
		// ( donc du dossard réel no1, le gardien )
		// On choisit l'ordre DiveTo, c'est comme GoTo, mais l'accélération disponible
		// vaut le triple, seul le gardien peut invoquer cet ordre... 
		// ... en contrepartie, le plongeon ne dure qu'un temps, et il immobilise le gardien
		// assez longtemps une fois fini
		// opérande 1 de l'ordre : la position du plongeon
		// opérande 2 : la vitesse maximum autorisé pendant le plongeon
		// ici 8.5 mètre par seconde, la vitesse maximale d'un joueur
	}
	// [EN] Else, the ball is further...
	// [FR] Sinon, si le ballon est plus loin... 
	else  
	{
		// [EN] ... else we place the player to the position computing at the beginning
		// [FR] ... alors on se place à la position calculée au début de la fonction
		short2 newGoalPos ( Ref_x[ 0 ] , position.y );
		orders( Goalkeeper ).GoTo( newGoalPos , 700 ) ;

		// [EN] GoTo order allows to go to a position, and to stop exactly on this position
		// ( if we repeat the order for each frame, player will decelerate to be able to stop
		// in time)
		// ( It's different from GoTowards, in which the player doesn't decelerate, but goes 
		// in a direction using the specified speed)
		// op1 : position  op2 : max speed allowed during the move
		// [FR] L'ordre GoTo permet de se rendre en un endroit, et de s'y arrêter
		// exactement ( si on répête l'ordre à chaque frame, le joueur va décélérer
		// pour pouvoir s'arrêter à temps )
		// ( différent de GoTowards, là on ne décélère pas, on va dans une direction
		// à la vitesse précisée par la 2ème opérande )
		// op1 : position  op2 : vitesse max autorisée lors de ce déplacement
	}
}

////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
// [EN] Now we deal with the field players.
// [FR] On va maintenant s'occuper des joueurs de champs        
////////////////////////////////////////////////////////////////////////

void Advanced_Example_AI::player ( const Situation& situation, OrdersManager& orders, ChatterBox& chat )
{
	// [EN] Some variable to earn time and enhance lisibility
	// [FR] Quelques variables utiles pour gagner du temps et pour la lisibilité
	short3 ballSpeed = situation.GetBallState().GetSpeedVec();

	short3 goalAdvPos = situation.GetAdvPlayerState( Goalkeeper ).GetPos() ;

	short3 passingPlayerPos = situation.GetMyPlayerState( (Player)n_passe_allie ).GetPos();
	short3 passingPlayerSpeed = situation.GetMyPlayerState( (Player)n_passe_allie ).GetSpeedVec();
	
	short3 currentPlayerPos;
	short3 currentPlayerSpeed;	
  
	// [EN] For each of the 10 field player do...
	// [FR] Pour chacun des 10 joueurs de champs faire... 
	for ( int num = Player_2 ; num <= Player_11 ; num++ )  
	{    
		// [EN] Get the current player
		// [FR] Fixer le joueur courant
		currentPlayerPos = situation.GetMyPlayerState( (Player)num ).GetPos();
		currentPlayerSpeed = situation.GetMyPlayerState((Player)num).GetSpeedVec();
		
		if ( num == n_proche_allie )  
		{
    		// [EN] Here we got the key player!
    		// He's the one we computed in the preliminaries
    		// as the nearest player to the ball
    		// [FR] On tient le joueur sur le coup !!! 
    		// Celui qu'on avait calculer dans les préliminaires comme étant 
    		// le plus proche du ballon
			
			if ( situation.GetMyPlayerState( (Player)num ).CanInteract() )  // en plus il peut interagir avec le ballon !!!
			{
				// [EN] If we're near the adversary goal line, but out of the penalty area,
				// we will center        
				// [FR] Si on est près de la ligne de but adverse, mais hors de la surface de réparation
				// On va centrer        
				if ( ( currentPlayerPos.x > - GOALKICK_xmax - 150 ) 
					 && ( ( currentPlayerPos.y > PENALTYAREA_ymax ) || ( currentPlayerPos.y < REPARATION_ymin ) ) ) 
				{
					chat.PlayerChat( (Player)num , "I'm centering !!!" ) ;
					
					short2 shootPos ( - GOAL_x - 800 , 0 );
					
					orders( (Player)num ).ShootLobTo( shootPos , 400 ) ;
					// [EN] As we saw some pages below, we target 8 meters before the goal using a 4 meters high pass 
					// [FR] Comme vu quelques pages plus haut on vise à 8m des buts avec une cloche de 4 metres de haut
				}
				else if ( currentPlayerPos.x > virtual_ballPos.x )  
				{
					// [EN] ... but the ball's behind him, we have to put it back on the axis 
					// to make a good shoot, i.e using the optimal power and sharpness 
					// ( else the shoot will be executed using a heel kick power... )
					// It corresponds to a control...					
					// [FR] ... mais le ballon est derriere lui, il faut donc le remettre dans l'axe
					// pour faire un tir correct, c-a-d avec la puissance et la prÈcision optimale
					// ( sinon le tir sera executé avec la puissance d'une talonnade... )
					// Ca correspond à un controle...
          
					chat.PlayerChat( (Player)num , "I'm putting the ball back on the axis!" ) ;
          
					short2 shootPos;
					short shootSpeed;
          
					// [EN] ^- if the player moves towards the adversary goal line
					// ( growing x goes towards the adversary )
					// [FR] ^- si on se déplace vers la ligne de but adverse
					// ( les x croissant vont chez l'adversaire )
					if ( currentPlayerSpeed.x > 0 )  
					{
						shootPos.x = currentPlayerPos.x + 150 ;
						// [EN] the ground point targetted, here a meter in front of the player
						// [FR] le point du sol visé, ici un petit mètre devant nous

						shootSpeed = currentPlayerSpeed.x ;
						// [EN] the residual speed the ball must roll at when
						// reaching this point, here the player own speed
						// [FR] la vitesse résiduelle à laquelle le ballon doit aller
						// en atteignant ce point, ici notre propre vitesse
					}
					// [EN] else he moves towards our goal...
					// [FR] sinon si on se déplace vers nos buts... 
					else 
					{
						shootPos.x = currentPlayerPos.x + 150 ;	// [EN] We target half a meter in front of the player... // [FR] On vise un demi-mètre devant nous...
						shootSpeed = 0 ;			
						// [EN] ... but this time the ball will reach him with a null speed
						// [FR] ... mais cette fois le ballon l'atteindra avec une vitesse nulle
					}
					
					// [EN] If the player we want to pass to is on the current player's right
					// [FR] Si l'allié à qui ont veut faire une passe est à notre droite
					if ( currentPlayerPos.y < passingPlayerPos.y - 200 )  
					{
						shootPos.y = currentPlayerPos.y + 50 ;  // alors on oriente un peu le controle à droite
					}
					// [EN] Else he's on the left
					// [FR] Sinon s'il est plus à gauche...
					else if ( currentPlayerPos.y > passingPlayerPos.y + 200 )  
					{
						shootPos.y = currentPlayerPos.y - 50 ;  // ... on oriente un peu à droite
					}
					// [EN] Else... he's quite on the same row...
					// [FR] Sinon... s'il est à peu près sur la même colonne...
					else  
					{
						shootPos.y = currentPlayerPos.y ;  // on vise droit devant nous
					}
        
					orders( (Player)num ).ShootGroundTo_S( shootPos, shootSpeed ) ;
					// [EN] the same as ShootGroundto, but using a residual speed
					// [FR] C'est comme ShootGroundTo, mais avec une vitesse résiduelle
				}
				// [EN] If we're near the penalty area
				// [FR] Si on est près de la surface de réparation
				else if ( currentPlayerPos.x > - PENALTYAREA_xmax - 100 )  
				{
					// [EN] We're near the adversary goal !!!
					// [FR] On est près des buts adverses !!!
					chat.PlayerChat( (Player)num , "I'm shooting !!!" ) ;
          
					// [FR] on est trËs prËs, alors on va tirer pres du milieu du but
					// [EN] we are very close to the goal, so we shoot near the center of the goal
					if ( currentPlayerPos.x > - GOAL_x - 750 )
					{
						if ( currentPlayerPos.y > 0 )
						{
							short3 shootPos ( - GOAL_x , 150 , 100 );
							orders( (Player)num ).ShootTowards( shootPos, 4000 ) ;
						}
						else
						{
							short3 shootPos ( - GOAL_x , -150 , 100 );
							orders( (Player)num ).ShootTowards( shootPos, 4000 ) ;
						}
						
					}
					// [EN] Little tip : If the adversary goal is on right, shoot on left, and vice versa 
					// [FR] Petite astuce : si le gardien est ‡ droite on vise ‡ gauche et vice versa
					else if ( goalAdvPos.y < 0 )  
					{
						short3 shootPos ( - GOAL_x , GOAL_ymax - 50 , GOAL_zmax - 20 );
						
						orders( (Player)num ).ShootTowards( shootPos, 4000 ) ;
						// [EN] using the order ShootTo, we set a 3D point and a shoot power
						// ... and he shoots targetting this point ( but without taking care of the gravity... )
						// op1 : the targetted point coordinates (we target the goal's line)
						// op2 : the shoot power in meter per second (here 40 m/s)
						// [FR] Ordre ShootTo, on précise un point 3D et une force de frappe
						// ... et il tire en visant ce point ( mais sans compter la gravité... )
						// op1 : la coordonnée du point visé (on vise la ligne de but)
						// op2 : la force de frappe en metre par seconde (ici 40 m/s)
					}
					else  
					{
						short3 shootPos ( - GOAL_x , GOAL_ymin + 50 , GOAL_zmax - 20 );
						
						orders( (Player)num ).ShootTowards( shootPos, 4000 ) ;
					}
				}
				// [EN] Else we're behind the 16m50 line in our camp
				// [FR] Sinon si on est derriËre les 16m50 dans notre camp
				else if ( currentPlayerPos.x < PENALTYAREA_xmax )  
				{
					// [EN] We're near our goal
					// [FR] On est pres de nos buts 

					chat.PlayerChat( (Player)num , "I'm kicking !!!" ) ;

					short2 shootPos ( 0, situation.GetMyPlayerState((Player)n_passe_allie).GetPos().y );
					
					orders( (Player)num ).ShootLobTo( shootPos, 400 ) ;
					// [EN] As we saw some pages below, we target the central line 
					// the origin ( 0 , 0 ) of the coordinates system corresponds with the kick off point
					// we target the row where the player we want to pass to using a 4 meter high pass
					// [FR] Comme vu quelques pages plus haut on vise la ligne séparatrice des 2 camps
					// l'origine ( 0 , 0 ) du système de coordonnÈe coincide avec le point d'engagement
					// on vise dans la colonne de l'allié à qui on pourrait faire une passe
					// avec une cloche de 4 metres de haut
				}
				// [EN] if the current player isn't the one we want to pass to
				// [FR] Si on est pas celui à qui on veut faire une passe
				else if ( num != n_passe_allie )  
				{
					// [EN] So we do the pass ...
					// [FR] Eh bien on la fait, la passe ...
					chat.PlayerChat( (Player)num , "I'm executing a pass" ) ;  

					short distance = passingPlayerPos.x - currentPlayerPos.x ;

					short2 shootPos;
					shootPos.x = passingPlayerPos.x + passingPlayerSpeed.x + 50 + distance / 3 ;
					shootPos.y = passingPlayerPos.y + passingPlayerSpeed.y ;
					
					if ( passingPlayerSpeed.x > 0 )  
					{
						orders( (Player)num ).ShootGroundTo_S( shootPos, passingPlayerSpeed.x );
					}
					else  
					{
						orders((Player)num).ShootGroundTo_S( shootPos, 0 );
					}
				}
				// [EN] Euh, if it failed... 
				// [FR] Euh, si rien n'a donné quoi que ce soit... 
				else  
				{
					// [EN] we'll dribble...
					// [FR] on va dribbler...
					short3 defenseAdvPos = situation.GetAdvPlayerState( (Player)n_def_adversaire ).GetPos();
					if ( defenseAdvPos.x < virtual_ballPos.x )  
					{
						// [EN] there's noone in front of the player!!!						
						// [FR] On a personne devant nous !!!
						chat.PlayerChat( (Player)num , "I'm running towards the adversary goal" ) ;

						short3 shootPos( - GOAL_x , 0 , 0 ) ;
						
						orders( (Player)num ).ShootTowards( shootPos, 400 + currentPlayerSpeed.x ) ;																
					}
					else if ( defenseAdvPos.y < virtual_ballPos.y )  
					{
						// [EN] The defender is on the left so we better go on right
						// [FR] Le defenseur est à gauche donc on va plutot vers la droite
						chat.PlayerChat( (Player)num , "I'm trying to dribble..." ) ;

						short3 shootPos( - GOAL_x , PENALTYAREA_ymax , 0 ) ;

						orders( (Player)num ).ShootTowards( shootPos, 300 + currentPlayerSpeed.x ) ;
					}
					else 
					{
						// [EN] The defender is on the right so we better go on left					
						// [FR] Le defenseur est à droite donc on va plutot vers la gauche
						chat.PlayerChat( (Player)num , "I'm trying to dribble..." ) ;

						short3 shootPos( - GOAL_x , PENALTYAREA_ymin , 0 ) ;

						orders((Player)num).ShootTowards( shootPos, 200 + currentPlayerSpeed.x ) ;														
					}
				}
			}
			// [EN] the player can't interact ... (we don't always have the ball, of course... )
			// the current player is although the nearest to the ball
			// [FR] Si on peut pas intéragir... (on a pas toujours le ballon, fallait s'y attendre... )
			// On est quand même le joueur le plus proche de celui-ci
			else  
			{
				short2 ballGndPos ( virtual_ballPos.x, virtual_ballPos.y ) ;
				short2 ballGndSpeed ( ballSpeed.x, ballSpeed.y ) ;

				// [EN] We have the ball... 			
				// [FR] Notre équipe a le ballon... 
				if ( we_got_the_ball )  
				{
					orders( (Player)num ).Follow_S( ballGndPos, 850 , ballGndSpeed ) ;
				}
				
				// [EN] We don't have the ball...
				// [FR] Notre équipe n'a pas le ballon...
				else  
				{
					orders( (Player)num ).Follow_S( ballGndPos, 850 , ballGndSpeed ) ;
				}
			}
		}
		// [EN] the current player isn't the nearest, but the covering one
		// [FR] On a pas le joueur le plus proche mais le joueur en couverture
		else if ( num == n_couvre_allie )  
		{
			short2 movePos;

			if ( we_got_the_ball )  
			{
				movePos.x = ( virtual_ballPos.x + 2 * Ref_x[ num ] ) / 3 ;
				movePos.y = ( virtual_ballPos.y + 2 * Ref_y[ num ] ) / 3 ;
				
				orders( (Player)num ).GoTo( movePos, 850 ) ;
			}
			else  
			{
				movePos.x = virtual_ballPos.x - 400 ;
				movePos.y = ( 2 * virtual_ballPos.y + Ref_y[ num ] ) / 3;
				
				orders( (Player)num ).GoTo( movePos, 500 ) ;
			}
		}
		// [EN] The current player is the one we'd like to pass to
		// [FR] On a le joueur à qui on voudrait faire la passe
		else if ( num == n_passe_allie )  
		{
			// [EN] The player is sent on the row of its reference position in a 4-3-3 formation
			// but on the attack limit line, at full speed		
			// [FR] On l'envoie sur la colonne de sa position de référence dans la formation 4-3-3
			// mais sur la ligne limite d'attaque, et à pleine vitesse			
			short2 movePos ( Limite , Ref_y[ num ]) ;

			orders( (Player)num ).GoTo( movePos, 850 ) ;
		}
		// [EN] If the current player has nothing special to do ...
		// [FR] On a un joueur qui n'a rien à de particulier à faire ...
		else  
		{
			// [EN] We send it to its reference position in the 4-3-3 formation
			// we computed in the preliminaries method
			// [FR] On l'envoie à sa position de référence dans la formation 4-3-3
			// qu'on a calculé dans la fonction preliminaries()
			short2 movePos ( Ref_x[ num ] , Ref_y[ num ] ) ;

			orders((Player)num).GoTo( movePos, 500 ) ;
		}
	}
}

////////////////////////////////////////////////////////////////////////


