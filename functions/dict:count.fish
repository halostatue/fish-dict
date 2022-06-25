# @halostatue/fish-dict/functions/dict:count.fish
function dict:count -a name -d 'Returns the count of keys in the dictionary'
    if test -z $name
        echo >&2 'dict:count: requires a name.'
        return 1
    end

    count (dict:::keys $name)
end
