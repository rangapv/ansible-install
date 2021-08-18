# ansible-install
A simple script to install ansible


Order of Pip install

1. pip21 3
  
    calls pipupgrade "$#"
     * This function call is to make sure the latest pip is installed
  
        1. calls piprelease 3
           * This function call is to make sure the pip is pointing to the right wrapper

        2. calls pipup
            This calls the below function after some checks!
          
            calls pipaddons
              *  This function call is to install additional packages in python like the boto,boto3..etc
   
