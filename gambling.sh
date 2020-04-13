echo "welcome";

stack=0;
betAmount=1;
declare everyDayGameStatus;

for (( counter=1; counter<=20; counter++))
do
stack=$(($stack + 100));
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
    everyDayGameStatus[$counter]=$stack;
done
echo ${everyDayGameStatus[@]};
echo $stack;