# @halostatue/fish-dict/functions/dict:::keys.fish
function dict:::keys -a name
    test -z $name
    and return 1

    set -l _dict (dict:::name $name)
    complete -C\$$_dict | string replace -r '\s+Variable:.*$' ''
end
