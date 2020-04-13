echo "welcome";

stack=100;
betAmount=1;
max=$(( $stack + $(( $stack / 2)) ));
min=$(( $stack - $(( $stack / 2)) ));

while (( $stack < $max && $stack > $min))
do
    gameStatus=$(( RANDOM % 2));
    if (( gameStatus == 0)); then
        echo "you win";
        stack=$(( $stack + 1));
    else
        echo "you lost";
        stack=$(( $stack - 1));
    fi
done
echo $stack;