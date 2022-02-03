for i in *
do        
	 if test -d "$i" -a -f "$i"/canonical-data.json
	 then                           
		 echo "$i"
		 nim c -d:writeTestFile -d:inputDir="$i" generator
	 fi
done
