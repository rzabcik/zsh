local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

precmd () {
    let fillsize=${COLUMNS}-9
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="-${fill}" # fill with underscores to work on 
        let fillsize=${fillsize}-1
    done
}

#preexec () {
#    echo -n "$reset_color"
#}

if [[ $TERM != *256color ]] || [ $(locale charmap) != UTF-8 ]; then
    PREFIX=">"
elif [ $EUID -eq 0 ]; then
    PREFIX="#%b"
    PCOLOR=(
        $fg_bold[red]
        $fg_bold[red]
        $fg_bold[red]
        $fg_bold[red]
    )
elif [[ $HOST = tachyon* ]]; then
    PREFIX="❱" # U+2771
    PCOLOR=(
        $FG[039]
        $FG[037]
        $FG[035]
        $FG[040]
    )
elif [[ $HOST = neutrino* ]]; then
    PREFIX="❱"
    PCOLOR=(
        $FG[118]
        $FG[120]
        $FG[122]
        $FG[123]
    )
else
    PREFIX="❱"
    PCOLOR=(
        $FG[129]
        $FG[135]
        $FG[141]
        $FG[147]
    )
fi

# Other possible prefix characters: 
# Gullimet           U+00BB » 
# Sine wave          U+223F ∿ 
# Much greater than  U+226B ≫
# Electric arrow     U+2301 ⌁
# Arrowhead          U+27A4 ➤
# Bullet             U+2202 •
# Round arrow        U+279C ➜

zle_highlight=( default:bg=underline )
PROMPT='%{$fg_bold[black]$fill%} %*
%{$reset_color$PCOLOR[1]%}%m%{$PCOLOR[2]%} %2~%{$PCOLOR[3]%}$(git_prompt_info)$(dropbox_status)%{$PCOLOR[4]%} $PREFIX%f '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_DROPBOX_PROMPT_PREFIX=" ("
ZSH_THEME_DROPBOX_PROMPT_SUFFIX=")"

