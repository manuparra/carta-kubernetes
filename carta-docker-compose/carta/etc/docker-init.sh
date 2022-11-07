  
#!/bin/bash

# wait until mongo is accepting TCP over 27017
chmod +x ./tmp/wait-for-it.sh 
/tmp/wait-for-it.sh -h carta-mongo -p 27017 -t 0 

# run
pm2-runtime carta-controller