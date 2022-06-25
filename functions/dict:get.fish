# @halostatue/fish-dict/functions/dict:get.fish
function dict:get -a name key -d 'Gets $name{$key}'
    if test -z $name
        echo >&2 'dict:get: requires a name.'
        return 1
    end

    if test -z $key
        echo >&2 'dict:get: requires a key.'
        return 1
    end

    set -l _var (dict:::key $name $key)
    echo $$_var
end
