# Docker SSH

Use containers like if they were vms

run this container

connect via ssh for the first time


you can use the bash scripts provided:

    sh build.sh

then

    sh run.sh


then connect!

     ssh root@localhost -p PORT

 (find the port on the previus line)

enter the password, it's: `temporary_pass`

because it's a temporary pass as its name states, after logging in you will need to change it to your own password:

first re enter it again and then enter your new password (twice)!

happy usage!


---
after you are done with it you can free the space with  `sh cleanup.sh`
