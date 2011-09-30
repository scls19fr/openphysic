## rempl.sed
:a
/\$\$/{ x;     # If "$$" is found, switch hold and pattern space
  /^ON/{       # If "ON" is in the (former) hold space, then ..
    s///;      # .. delete it
    x;         # .. switch hold space and pattern space back
    s|\$\$|\\]|; # .. turn the next "$$" into "\]"
    ba;        # .. jump back to label :a and start over
  }
s/^/ON/;       # Else, "ON" was not in the hold space; create it
x;             # Switch hold space and pattern space
s|\$\$|\\[|;   # Turn the first "$$" into "\["
ba;            # Branch to label :a to find another pattern
}