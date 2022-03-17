#!/bin/sh
FILES=$(find -type f | grep '.html.part')

for SRCFILE in $FILES
do
	DSTFILE=$(echo $SRCFILE | sed s/.part//)
	echo $SRCFILE
	echo $DSTFILE
	cat top.html "$SRCFILE" bot.html > $DSTFILE
	TITLE=$(grep TITLEVALUELINE "$DSTFILE" | sed "s/TITLEVALUELINE://")
	sed -i "s/TITLEPLACEHOLDERTEXT/$TITLE/" $DSTFILE
done
