function fish_prompt
  set -l emoji    "👻"
  set -l nick     $nickname
  set -l code     $status
  set -l nodejsv  (eval node --version)
  set -l gov	    (eval go version | awk '{ print substr( $0, 14 ,6) }')
  set -l cyan     (set_color -o cyan)
  set -l yellow   (set_color -o yellow)
  set -l red      (set_color -o red)
  set -l blue     (set_color -o blue)
  set -l green    (set_color -o green)
  set -l purple   (set_color -o purple)
  set -l normal   (set_color -o normal)

  echo -n -e (begin
    test $code = 0
      and echo "$purple ~ $nick $normal [$yellow nodejs $nodejsv $normal] $yellow ⚡ $normal [$yellow go $gov $normal] \n"
  end) "$blue"(prompt_pwd) (begin
    echo "$yellow git:("$normal(git_branch_name)"$yellow)"
    git_is_touched; and echo "$yellow⇡⇡"
  end) " $normal\n $cyan$emoji  "
end
