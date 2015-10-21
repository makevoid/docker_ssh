docker run -d -P --name test_sshd dock_sshd
docker port test_sshd 22
echo "run: ssh root@localhost -p PORT"
