#include <stdio.h>  /* pour l'utilisation de printf         */
#include <stdlib.h> /* pour l'utilisation de malloc et free */

/* la structure list_item represente un element de la liste */
typedef struct _list_item list_item;

struct _list_item {
  int       val;   /* element que l'on stocke dans la liste   */
  list_item *next; /* adresse du prochain element de la liste */
};

/* permet d'inserer la valeur val au debut de la liste list */
/* renvoie la nouvelle liste cree                           */
list_item *inserer_debut(list_item *list, int val)
{ list_item *vlist_item;
  /* on alloue la memoire pour le nouvel element */
  if((vlist_item = (list_item *)malloc(sizeof(list_item))) == NULL)
  { perror("malloc failed "); exit(1); }
  /* on recopie la valeur */
  vlist_item->val  = val;
  /* on chaine avec le prochain element de la liste (l'ancien premier) */
  vlist_item->next = list;
  /* on renvoie notre element car c'est maintenant le permier */
  return(vlist_item);
}

/* permet d'inserer la valeur val a la finde la liste list */
/* renvoie la nouvelle liste cree                          */
list_item *inserer_fin(list_item *list, int val)
{ list_item *vlist_item;
  list_item *vlist_move;
  /* on alloue la memoire pour le nouvel element */
  if((vlist_item = (list_item *)malloc(sizeof(list_item))) == NULL)
  { perror("malloc failed "); exit(1); }
  /* on recopie la valeur */
  vlist_item->val  = val;
  /* on chaine avec le prochain element de la liste
     (aucun car on est le dernier) */
  vlist_item->next = NULL;

  if(list == NULL)
  { /* la liste etait vide, on devient le premier element */
    return(vlist_item);
  } else {
    /* on parcour la liste jusqu'au dernier element
       (celui qui pointe sur NULL) */
    for(vlist_move=list;vlist_move->next!=NULL;vlist_move=vlist_move->next);
    /* le dernier element pointe maitenant sur le nouvel element */
    vlist_move->next = vlist_item;
    /* le premier element de la liste n'a pas change */
    return(list);
  }
}

/* permet de supprimer un element dans la liste en */
/* connaissant sa valeur                           */
/* renvoie la nouvelle liste cree                  */
list_item *supprimer(list_item *list, int val)
{ list_item *vlist_move;
  list_item *vlist_move_prev;
  list_item *vlist_tmp;

  /* on recherche l'element avec la valeur val dans la liste */
  /* on conserve aussi dans vlist_move_prev l'element qui le */
  /* precende dans la liste.                                 */
  vlist_move_prev = NULL;
  for(vlist_move=list;(vlist_move!=NULL) && (vlist_move->val!=val);
      vlist_move_prev=vlist_move,vlist_move=vlist_move->next);

  if(vlist_move == NULL)
  { /* l'element n'existe pas dans la liste   */
    /* on ne peut donc pas le supprimer.      */
    /* on sait cela car NULL indique que l'on */
    /* est alle au dela de la fin de la liste */
    return(list);
  } else {
    if(vlist_move_prev == NULL)
    { /* pas d'element avant, on etait le permier */
      /* on conserve l'element suivant            */
      vlist_tmp = vlist_move->next;
      /* on libere la memoire de l'element que l'on devait trouver */
      free(vlist_move);
      /* l'element suivant devient le premier de la liste */
      return(vlist_tmp);
    } else {
      /* l'element d'avant indique maintenant le suivant          */
      /* de l'element trouve (on cours circuite l'element trouve) */
      vlist_move_prev->next = vlist_move->next;
      /* on libere l'element trouve */
      free(vlist_move);
      /* le premier de la liste n'a pas change */
      return(list);
    }
  }
}

/* un petit exemple d'utilisation */
int main(int argc, char **argv)
{ list_item *ma_liste;
  list_item *vlist_move;

  /* initialise la liste comme une liste vide (pas d'elements) */
  ma_liste = NULL;

  /* on rajoute la valeur 4 au debut de la liste */
  ma_liste = inserer_debut(ma_liste, 4);
  /* on rajoute la valeur 3 au debut de la liste */
  ma_liste = inserer_debut(ma_liste, 3);
  /* on rajoute la valeur 44 a la fin de la liste */
  ma_liste = inserer_fin(ma_liste, 44);
  /* on rajoute la valeur 5 a la fin de la liste */
  ma_liste = inserer_fin(ma_liste, 5);
  /* on supprime la valeur 44 de la liste */
  ma_liste = supprimer(ma_liste, 44);

  /* on parcours la liste pour en afficher le contenu */
  for(vlist_move=ma_liste;vlist_move!=NULL;vlist_move=vlist_move->next)
  {
    printf("valeur %d\n",vlist_move->val);
  }

  return(0);
}
