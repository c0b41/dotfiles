function todoc
{
  command cat ~/.todo-db.json | jq '(.[ ] | select(.status == "pending"))' | grep -w "pending" -c
}