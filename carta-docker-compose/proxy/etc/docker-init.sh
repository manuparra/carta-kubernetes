  
#!/bin/bash

# wait until core is accepting TCP over 8000
chmod +x ./tmp/wait-for-it.sh 
/tmp/wait-for-it.sh -h carta-core -p 8000 -t 0 

# run
nginx