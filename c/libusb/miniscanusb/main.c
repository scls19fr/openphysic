#include <stdio.h>
#include <usb.h>

int main(int argc, char **argv)
{
  struct usb_bus *busses;
  usb_init();
  usb_find_busses();
  usb_find_devices();
  busses = usb_get_busses();
  struct usb_bus *bus;
  int c, i, a;
  
  /* boucle sur les bus USB */
  for (bus = busses; bus; bus = bus->next) {
    struct usb_device *dev;
    /* Par bus, boucle sur les devices */
    for (dev = bus->devices; dev; dev = dev->next) {
      printf("0x%.04X:0x%.04X",
	     dev->descriptor.idVendor,
	     dev->descriptor.idProduct);
      printf("\n");
      //      if ((dev->descriptor.idVendor == MYVENDOR) &&
      //	  (dev->descriptor.idProduct == MYPRODUCT) ) {
	/* boucle sur les configurations, si plus de 1 seule */
      //}
    }
  }
}
