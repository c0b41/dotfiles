function testhook
{
data="$(cat <<-EOF
#!/usr/bin/env bash
npm test
EOF
  )"
  command sudo touch .git/hooks/pre-commit
  command echo "$data" > .git/hooks/pre-commit
  command sudo chmod +x .git/hooks/pre-commit
  echo -e "${blue}   Git Test Hook'u oluşturuldu :)  ${reset}"
}
