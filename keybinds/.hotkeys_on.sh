(
  cd /home/jerome/
  #!/bin/bash
  pgrep xcape | xargs kill
  xkbcomp ~/.xkbmap $DISPLAY
  xcape -e 'Shift_L=parenleft;Shift_R=parenright'
)
