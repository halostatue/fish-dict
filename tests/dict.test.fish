@echo (status basename)

source (status dirname)"/../functions/dict:::key.fish"
source (status dirname)"/../functions/dict:::keys.fish"
source (status dirname)"/../functions/dict:::name.fish"
source (status dirname)"/../functions/dict:count.fish"
source (status dirname)"/../functions/dict:empty.fish"
source (status dirname)"/../functions/dict:get.fish"
source (status dirname)"/../functions/dict:has_key.fish"
source (status dirname)"/../functions/dict:keys.fish"
source (status dirname)"/../functions/dict:set.fish"

@test 'dict:set fails without a dictionary and key' (
    dict:set 2>&1
) = 'dict:set: assignment requires name and key.'

@test 'dict:set x fails without a key' (
    dict:set x 2>&1
) = 'dict:set: assignment requires name and key.'

@test 'dict:set x y assigns an empty value to x{y}' (
    dict:set -e x
    dict:set x y 2>&1
    dict:get x y
) = ''

@test 'dict:set x y a sets x{y} = a' (
    dict:set -e x
    dict:set x y a
    dict:get x y
) = a

@test 'dict:set x y a b c sets x{y} = a b c' (
    dict:set -e x
    dict:set x y a b c
    dict:get x y
) = 'a b c'

@test 'dict:set -q fails without a dictionary name' (
    dict:set -e x
    dict:set -q 2>&1
) = 'dict:set: query requires name and optional key.'

@test 'dict:set -q x is false when dictionary is not set' (
    dict:set -e x
    dict:set -q x
) $status = 1

@test 'dict:set -q x is true when dictionary has any key' (
    dict:set -e x
    dict:set x y a
    dict:set -q x
) $status = 0

@test 'dict:set -q x y is false when x{y} is not set' (
    dict:set -e x
    dict:set x q a;
    dict:set -q x y
) $status = 1

@test 'dict:set -q x y is true when x{y} is set' (
    dict:set -e x
    dict:set x y a
    dict:set -q x y
) $status = 0

@test 'dict:set -e fails iwthout a dictionary name' (
    dict:set -e 2>&1
) = 'dict:set: erase requires name and optional key.'

@test 'dict:set -e x y erases x{y}' (
    dict:set -e x
    dict:set x y a
    dict:set -e x y
    dict:set -q x y
) $status = 1

@test 'dict:set -e x y does not erase x{a}' (
    dict:set -e x
    dict:set x y a
    dict:set x a a
    dict:set -e x y
    dict:set -q x a
) $status = 0

@test 'dict:set -e x erases x{}' (
    dict:set -e x
    dict:set x y a
    dict:set -e x
    dict:set -q x
) $status = 1

@test 'dict:keys x is empty when there is no dictionary x' (
    dict:set -e x
    dict:keys x
) = ''

@test 'dict:keys x returns an alphabetized list of dictionary keys' (
    dict:set -e x
    dict:set x y a
    dict:set x q a
    dict:keys x 2>&1
) = 'q y'

@test 'dict:empty fails if no dictionary is provided' (
    dict:empty 2>&1
) = 'dict:empty: requires a name.'

@test 'dict:empty x returns true if it does not exist (opposite of dict:set -q x)' (
    dict:set -e x
    dict:empty x
) $status = 0

@test 'dict:empty x returns false if any keys are set for x' (
    dict:set -e x
    dict:set x y a
    dict:empty x
) $status = 1

@test 'dict:count fails if no dictionary is provided' (
    dict:count 2>&1
) = 'dict:count: requires a name.'

@test 'dict:count outputs 0 if the dictionary does not exist' (
    dict:set -e x
    dict:count x
) = 0

@test 'dict:count returns the number of keys defined' (
    dict:set -e x
    dict:set x y a
    dict:set x a b
    dict:count x
) = 2

@test 'dict:has_key x y returns false if x{y} does not exist (same as dict:set -q x y)' (
    dict:set -e x
    dict:set x q a
    dict:has_key x y
) $status = 1

@test 'dict:has_key x y returns true if x{y} exists' (
    dict:set -e x
    dict:set x y a
    dict:has_key x y
) $status = 0

@test 'dict:has_key fails without a dictionary' (
    dict:has_key 2>&1
) = 'dict:has_key: requires a name.'

@test 'dict:has_key fails without a key' (
    dict:has_key x 2>&1
) = 'dict:has_key: requires a key.'


@test 'dict:get fails without a dictionary' (
    dict:get 2>&1
) = 'dict:get: requires a name.'

@test 'dict:get fails without a key' (
    dict:get x 2>&1
) = 'dict:get: requires a key.'

@test 'dict:keys fails without a dictionary' (
    dict:keys 2>&1
) = 'dict:keys: requires a name.'
