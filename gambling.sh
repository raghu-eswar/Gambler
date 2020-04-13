echo "welcome";

stack=0;
betAmount=1;
daysWon=0;
daysLost=0;
declare everyDayGameStatus;
declare winingDays;
declare losingDays;

for (( counter=1; counter<=20; counter++))
do
stack=$(( $stack + 100));
max=$(( $stack + $(( $stack / 2)) ));
min=$(( $stack - $(( $stack / 2)) ));
temp=$stack;
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
    if (( $stack > $temp));then
        daysWon=$(( $daysWon + 1));
        winingDays[$counter]=$(( $stack - $temp));
    else
        daysLost=$(( $daysLost + 1));
        losingDays[$counter]=$(( $temp - $stack));
    fi
done
echo ${everyDayGameStatus[@]};
echo $daysWon;
echo $daysLost;
echo $stack;
