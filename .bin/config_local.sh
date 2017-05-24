webstop()
{
    ps aux | ag python\ manager.py\ start | ag -v ag\  | awk '{print $2}' | while read pid
    do
        echo kill $pid
        kill $pid
        sleep 1
        kill $pid
    done

}
alias webr='webstop && sleep 0.5 && web'

# start python2 env
py2
