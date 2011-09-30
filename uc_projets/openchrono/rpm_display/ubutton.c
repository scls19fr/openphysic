/* uWidgets - the microWidgets Toolkit
 * Copyright (C) 2007 Sebastien Celles
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "ubutton.h"

/* Forward declarations */
static void u_button_class_init (uButtonClass *class);
static void u_button_init (uButton *but);

void u_button_expose(uWidget *widget);


void u_button_expose(uWidget *widget) {

}


static void u_button_class_init (uButtonClass *class) {
  //  widget_class->realize = gtk_dial_realize;
  //  widget_class->expose_event = gtk_dial_expose;
}

static void u_button_init (uButton *but) {

}
