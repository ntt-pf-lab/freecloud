 knife client list |grep freecloud|perl -pe '$_="knife client delete -y $_"' |bash
 knife node list |grep freecloud|perl -pe '$_="knife node delete -y $_"' |bash
