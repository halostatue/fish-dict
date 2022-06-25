# @halostatue/fish-dict/functions/dict:empty.fish
function dict:empty -a name -d 'Returns true if $name has no keys'
    if test -z $name
        echo >&2 'dict:empty: requires a name.'
        return 1
    end

    test (count (dict:::keys $name)) -eq 0
end
