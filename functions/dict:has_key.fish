# @halostatue/fish-dict/functions/dict:has_key.fish
function dict:has_key -a name key -d 'Returns true if $name{$key} exists'
    if test -z $name
        echo >&2 'dict:has_key: requires a name.'
        return 1
    end

    if test -z $key
        echo >&2 'dict:has_key: requires a key.'
        return 1
    end

    set -l _var (dict:::key $name $key)
    set -gq $_var
end
