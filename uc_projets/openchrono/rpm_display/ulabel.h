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

#ifndef __u_LABEL_H__
#define __u_LABEL_H__

#include "uwidgets.h"

typedef struct _uLabel uLabel;
typedef struct _uLabelClass uLabelClass;

struct _uLabel {
  uWidget widget;
};

struct _uLabelClass {
  uWidgetClass parent_class;
};

#endif /* __u_LABEL_H__ */
