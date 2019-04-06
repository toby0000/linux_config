if [ -z $1 ]; then
    echo 请输入ip
    exit
fi
echo $1
ps -ef | grep 'autossh/autossh' | grep $1 | awk '{print $2}' | xargs kill
autossh -fCNR  8722:localhost:22 ubuntu@$1
