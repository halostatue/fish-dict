# @halostatue/fish-dict/functions/dict:set.fish
function dict:set -d 'Sets $name{$key}=$argv'
    argparse -xq,e q/query e/erase -- $argv
    or return

    set -l mode assign

    set -q _flag_query
    and set mode query

    set -q _flag_erase
    and set mode erase

    switch $mode
        case assign
            test (count $argv) -lt 2; and begin
                echo >&2 'dict:set: assignment requires name and key.'
                return 1
            end

    end

    dict:set:::{$mode} $argv
end

function dict:set:::assign -a name key
    set -l _var (dict:::key $name $key)
    set -g $_var $argv[3..-1]
end

function dict:set:::erase -a name key
    if test -z $name
        echo >&2 'dict:set: erase requires name and optional key.'
        return 1
    end

    if test -z $key
        for key in (dict:::keys $name)
            set -ge (string replace '$' '' $key)
        end
    else
        set -l _key (dict:::key $name $key)
        set -ge $_key
    end
end

function dict:set:::query -a name key
    if test -z $name
        echo >&2 'dict:set: query requires name and optional key.'
        return 1
    end

    if test -z $key
        not dict:empty $name
    else
        dict:has_key $name $key
    end
end
