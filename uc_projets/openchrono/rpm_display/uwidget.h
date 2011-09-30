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

#ifndef __u_WIDGET_H__
#define __u_WIDGET_H__

#include <stdbool.h>
#include <stdint.h>

#include "uobject.h"
#include "uwindow.h"

typedef struct _uWidget uWidget;
typedef struct _uWidgetClass uWidgetClass;

struct _uWidget {
  /* The object structure needs to be the first
   *  element in the widget structure in order for
   *  the object mechanism to work correctly. This
   *  allows a uWidget pointer to be cast to a
   *  uObject pointer.
   */
  uObject object;
  
  /* The state of the widget. There are actually only
   *  5 widget states (defined in "uenums.h").
   */
  uint8_t state;
  
  /* The saved state of the widget. When a widget's state
   *  is changed to U_STATE_INSENSITIVE via
   *  "u_widget_set_state" or "u_widget_set_sensitive"
   *  the old state is kept around in this field. The state
   *  will be restored once the widget gets sensitive again.
   */
  uint8_t saved_state;
  
  /* The widget's name. If the widget does not have a name
   *  (the name is NULL), then its name (as returned by
   *  "u_widget_get_name") is its class's name.
   * Among other things, the widget name is used to determine
   *  the style to use for a widget.
   */
  char *name;
  
  /*< public >*/

  /* The style for the widget. The style contains the
   *  colors the widget should be drawn in for each state
   *  along with graphics contexts used to draw with and
   *  the font to use for text.
   */
  /* uStyle *style; */
  
  /* The widget's window or its parent window if it does
   *  not have a window. (Which will be indicated by the
   *  U_NO_WINDOW flag being set).
   */
  uWindow *window;
  
  /* The widget's parent.
   */
  uWidget *parent;
};

struct _uWidgetClass {
  /* The object class structure needs to be the first
   *  element in the widget class structure in order for
   *  the class mechanism to work correctly. This allows a
   *  uWidgetClass pointer to be cast to a uObjectClass
   *  pointer.
   */
  uObjectClass parent_class;

  /*< public >*/
  
  uint8_t activate_signal; // gint

  /* basics */
  /*
  void (* show)		       (uWidget        *widget);
  void (* show_all)            (uWidget        *widget);
  void (* hide)		       (uWidget        *widget);
  void (* hide_all)            (uWidget        *widget);
  void (* map)		       (uWidget        *widget);
  void (* unmap)	       (uWidget        *widget);
  void (* realize)	       (uWidget        *widget);
  void (* unrealize)	       (uWidget        *widget);

  void (* state_changed)       (uWidget        *widget,
				uStateType   	  previous_state);
  void (* parent_set)	       (uWidget        *widget,
				uWidget        *previous_parent);
  void (* hierarchy_changed)   (uWidget        *widget,
				uWidget        *previous_toplevel);
  void (* style_set)	       (uWidget        *widget,
				uStyle         *previous_style);
  void (* direction_changed)   (uWidget        *widget,
				uTextDirection  previous_direction);
  void (* grab_notify)         (uWidget        *widget,
				bool          was_grabbed);
  void (* child_notify)        (uWidget	 *widget,
				GParamSpec       *pspec);
  */
    
  /* explicit focus */
  /*
  void     (* grab_focus)      (uWidget        *widget);
  bool (* focus)           (uWidget        *widget,
                                uDirectionType  direction);
  */
  
  /* events */
  /*
  bool (* event)		(uWidget	     *widget,
				 GdkEvent	     *event);
  bool (* button_press_event)	(uWidget	     *widget,
				 GdkEventButton      *event);
  bool (* button_release_event)	(uWidget	     *widget,
				 GdkEventButton      *event);
  bool (* scroll_event)		(uWidget           *widget,
					 GdkEventScroll      *event);
  bool (* motion_notify_event)	(uWidget	     *widget,
				 GdkEventMotion      *event);
  bool (* delete_event)		(uWidget	     *widget,
				 GdkEventAny	     *event);
  bool (* destroy_event)		(uWidget	     *widget,
					 GdkEventAny	     *event);
  bool (* expose_event)		(uWidget	     *widget,
				 GdkEventExpose      *event);
  bool (* key_press_event)		(uWidget	     *widget,
					 GdkEventKey	     *event);
  bool (* key_release_event)	(uWidget	     *widget,
				 GdkEventKey	     *event);
  bool (* enter_notify_event)	(uWidget	     *widget,
				 GdkEventCrossing    *event);
  bool (* leave_notify_event)	(uWidget	     *widget,
				 GdkEventCrossing    *event);
  bool (* configure_event)		(uWidget	     *widget,
					 GdkEventConfigure   *event);
  bool (* focus_in_event)		(uWidget	     *widget,
					 GdkEventFocus       *event);
  bool (* focus_out_event)		(uWidget	     *widget,
					 GdkEventFocus       *event);
  bool (* map_event)		(uWidget	     *widget,
				 GdkEventAny	     *event);
  bool (* unmap_event)		(uWidget	     *widget,
				 GdkEventAny	     *event);
  bool (* property_notify_event)	(uWidget	     *widget,
					 GdkEventProperty    *event);
  bool (* selection_clear_event)	(uWidget	     *widget,
					 GdkEventSelection   *event);
  bool (* selection_request_event)	(uWidget	     *widget,
					 GdkEventSelection   *event);
  bool (* selection_notify_event)	(uWidget	     *widget,
					 GdkEventSelection   *event);
  bool (* proximity_in_event)	(uWidget	     *widget,
					 GdkEventProximity   *event);
  bool (* proximity_out_event)	(uWidget	     *widget,
				 GdkEventProximity   *event);
  bool (* visibility_notify_event)	(uWidget	     *widget,
					 GdkEventVisibility  *event);
  bool (* client_event)		(uWidget	     *widget,
				 GdkEventClient	     *event);
  bool (* no_expose_event)		(uWidget	     *widget,
					 GdkEventAny	     *event);
  bool (* window_state_event)	(uWidget	     *widget,
				 GdkEventWindowState *event);
  */

  
};

#endif /* __u_WIDGET_H__ */
