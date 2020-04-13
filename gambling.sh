echo "welcome";

stack=100;
betAmount=1;
gameStatus=$(( RANDOM % 2));
if (( gameStatus == 0)); then
    echo "you win";
else
    echo "you lost";
fi