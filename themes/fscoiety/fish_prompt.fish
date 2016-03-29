function fish_prompt
  set -l emoji    "⚡"
  set -l nick     $nickname
  set -l code     $status
  set -l nodejsv  (eval node --version)
  set -l cyan     (set_color -o cyan)
  set -l yellow   (set_color -o yellow)
  set -l red      (set_color -o red)
  set -l blue     (set_color -o blue)
  set -l green    (set_color -o green)
  set -l purple   (set_color -o purple)
  set -l normal   (set_color -o normal)

  echo -n -e (begin
    test $code = 0
      and echo "$red ~ $nick $normal [$green nodejs $nodejsv $normal] \n"
  end) "$cyan"(prompt_pwd) (begin
    echo "$normal git:("$normal(git_branch_name)"$normal)"
    git_is_touched; and echo "$yellow⇡⇡"
  end) " $normal\n $yellow$emoji  "
end
