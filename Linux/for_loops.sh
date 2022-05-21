#!/bin/bash

# List Variables
States=(
        'Georgia'
        'Florida'
        'Montana'
        'Tennessee'
        'Arizona'
)

#Print out of States

for State in ${States[@]};
do
        if [ State == 'Hawaii' ];
        then echo "Hawaii is the best!"
        else echo "I'm not fond of Hawaii" 
fi
done
