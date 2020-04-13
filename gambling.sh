echo "welcome";

stack=0;
betAmount=1;
daysWon=0;
daysLost=0;
declare everyDayGameStatus;
declare winingDays;
declare losingDays;
declare everyDaysWonnings;
declare everyDaysLosses;
luckiestDay=1;
unLuckiestDay=1

for (( counter=1; counter<=20; counter++))
do
stack=$(( $stack + 100));
max=$(( $stack + $(( $stack / 2)) ));
min=$(( $stack - $(( $stack / 2)) ));
temp=$stack;
toDayWinnings=0;
toDayLosses=0;
    while (( $stack < $max && $stack > $min))
    do
        gameStatus=$(( RANDOM % 2));
        if (( gameStatus == 0)); then
            echo "you win";
            stack=$(( $stack + $betAmount));
            toDayWinnings=$(( $toDayWinnings + 1 ));
        else
            echo "you lost";
            stack=$(( $stack - $betAmount));
            toDayLosses=$(( $toDayLosses + 1 ));
        fi
    done
    everyDaysWonnings[$counter]=$toDayWinnings;
    everyDaysLosses[$counter]=$toDayLosses;
    everyDayGameStatus[$counter]=$stack;
    if (( $stack > $temp));then
        daysWon=$(( $daysWon + 1));
        winingDays[$counter]=$(( $stack - $temp));
    else
        daysLost=$(( $daysLost + 1));
        losingDays[$counter]=$(( $temp - $stack));
    fi
done

for (( counter=2; counter<=20; counter++))
do
    if (( ${everyDaysWonnings[$luckiestDay]} < ${everyDaysWonnings[$counter]} )) ; then
        luckiestDay=$counter;
    fi
    if (( ${everyDaysLosses[$unLuckiestDay]} < ${everyDaysLosses[$counter]} )); then
        unLuckiestDay=$counter;
    fi
done

if (( $winingDays > $losingDays )); then
    echo "i will continue";
else
    echo "i will stop";
fi

echo ${everyDayGameStatus[@]};
echo $daysWon;
echo $daysLost;
echo $luckiestDay;
echo $unLuckiestDay
echo $stack;
