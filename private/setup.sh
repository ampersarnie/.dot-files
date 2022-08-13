for d in private/*/ private/.*/ ; do
    [ -L "${d%/}|../" ] && continue
    echo "Running $d"
    # sh $d/setup.sh 2> /dev/null
done