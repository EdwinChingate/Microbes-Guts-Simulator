gimp -i -b '(let* ((image (car (gimp-file-load RUN-NONINTERACTIVE "Flowcharts/Geometry.svg" "Flowcharts/Geometry.svg" )))(drawable (car (gimp-image-active-drawable image))))(gimp-invert drawable)(file-png-save RUN-NONINTERACTIVE image drawable  "Flowcharts/Geometry.svg" "Flowcharts/Geometry.svg" 0 0 0 0 0 1 1)(gimp-quit 0))'
