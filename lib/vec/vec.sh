apush ()
{
    declare -n arr="$1"
    shift
    arr+=("$@")
}

apop ()
{
    declare -n array=$1
    shift
    declare _i=0
    if [[ $1 =~ ^- ]]
    then
        while (($#))
        do
            if [[ $1 = '-a' ]]
            then
                declare -n output=$2
                shift;shift
                continue;
            fi
            if [[ $1 = '-n' ]]
            then
                declare c=$2
                shift;shift
                continue
            fi
            echo "$1 is an invalid option"
            return 1
        done

        while ((_i<c))
        do
            ((_i+=1))
            output+=("${array[-_i]}")
        done
    else
        for _v ; do
            declare -n _var=$_v
            ((_i+=1))
            # shellcheck disable=SC2034 #https://github.com/koalaman/shellcheck/wiki/SC2034
            _var=${array[-_i]}
        done
    fi
    array=("${array[@]:0:$((${#array[@]}-_i))}")
}

aunshift ()
{
    declare -n arr="$1"
    shift
    arr=("$@" "${arr[@]}")
}

    ashift ()
{
    declare -n array=$1
    shift
    declare _i=-1
    if [[ $1 =~ ^- ]]
    then
        while (($#))
        do
            if [[ $1 = '-a' ]]
            then
                declare -n output=$2
                shift;shift
                continue;
            fi
            if [[ $1 = '-n' ]]
            then
                declare c=$2
                shift;shift
                continue
            fi
            echo "$1 is an invalid option"
            return 1
        done

        while ((_i+1<c))
        do
            ((_i+=1))
            output+=("${array[_i]}")
        done
    else
        for _v ; do
            declare -n _var=$_v
            ((_i+=1))
            # shellcheck disable=SC2034 #https://github.com/koalaman/shellcheck/wiki/SC2034
            _var=${array[_i]}
        done
    fi
    array=("${array[@]:((_i+1))}")
}

a_new_rev_from_args() {
	declare -n new_arr="$1"
	shift
	for  val in "$@"
	do
		apush new_arr "$val"
	done
}

#apush    array value1 value2 value3 ...
#ashift   array value1 value2 value3 ...
#
#apop     array var1 var2 var3 ...   # Extracted values stored in variables.
#apop     array -n 3 -a tgtarray     # 3 extracted values stored in array
#                                    # 'tgtarray'. Note that the values are
#                                    # ADDED to any existing values already
#                                    # in the 'tgtarray'.
#
#aunshift array var1 var2 var3 ...   # Extracted values stored in variables.
#aunshift array -n 4 -a tgtarray     # 4 extracted values stored in array
#                                    # 'tgtarray'. Note that the values are
#                                    # ADDED to any existing values already
#                                    # in the 'tgtarray'.
