for d in private/*/ private/.*/ ; do
    [ -L "${d%/}" ] && continue
    if [ $d == 'private/*/' ]; then
        continue
    elif [ $d == 'private/./' ]; then
        continue
    elif [ $d == 'private/../' ]; then
        continue
    else
        echo "Running ${d}setup.sh"
        sh "${d}setup.sh" 
    fi
done