function privatenpm
{
 data="$(cat package.json | jq '.private="true"')"
 command echo "$data" > package.json
}