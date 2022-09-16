

# alias du='du -h'


export MY_DIRS_FILE=~/001_my_dirs.txt
export MY_LOG_FILE=~/002_my_logs.txt
if [ ! -e $MY_DIRS_FILE ];then touch $MY_DIRS_FILE ;fi
if [ ! -e $MY_LOG_FILE ];then touch $MY_LOG_FILE ;fi

alias bb001_showWorkDirs='cat $MY_DIRS_FILE'
alias bb002_addPwd2WorkDirs='echo $PWD >> $MY_DIRS_FILE'
alias bb003_showNewestWorkDirs='tail -n20 $MY_DIRS_FILE'
alias bb004_cd_LastDir_InDirList='cd `cat $MY_DIRS_FILE|tail -n1`'
#alias bb005_cd_LastN_dir='cd `cat $MY_DIRS_FILE|tail -n\!^|head -n1`'
function bb005_cd_LastN_dir()
{
	cd `cat $MY_DIRS_FILE|tail -n$1|head -n1`
}
alias bb006a_VimLog_tailN10='tail -n10 $MY_LOG_FILE'
alias bb031_find_BKfiles="find ./ -name '*.bk.*'"
alias bb051_checkPwd_DuSize="du --max-depth=1 -h ."


#function bb001_showWorkDirs()
#{
#	if [ -e ~/001_my_dirs.txt ];then
#		cat ~/001_my_dirs.txt
#	else
#		touch ~/001_my_dirs.txt
#	fi
#}

########
#bTag=alias for aa*=
unalias aa[0-9]*

alias aa000_grepInMyAlias="alias |grep -i --color"   ;#即根据关键字,在自己的 alias 中找
alias aa001_PWD='echo $PWD'
alias aa003_ls_ltha="ls -ltha"
alias aa101_qstat='qstat|nl'
alias aa301_findLast2minChangedFile="find ./ -type f -name '*' -mmin -2 -exec ls -lt {} \;"
alias aa601_egrep_nur_color="egrep -nur --color"
alias aa602_egrep_nuri_color="egrep -nuri --color"

##########

#bTag=alias for gg*= git=
unalias gg[0-9]*
alias gg001_gitStatus_pwd="git status ."
alias gg002_gitStatus="git status"
alias gg003_gitDiff="git diff"
alias gg004_gitCommit_sm="git commit -sm"
alias gg005_gitCommit_asm="git commit -asm"

#bTag=alias for vim/vv*=
alias gvim2_os='/usr/bin/gvim -u ~/.vimrc_none'
alias vim2_os='/usr/bin/vim  -u ~/.vimrc_none'
alias vimdiff2_os='/usr/bin/vimdiff -u ~/.vimrc_none'
alias gvimdiff2_os='/usr/bin/gvimdiff -u ~/.vimrc_none'

#bTag=alias for ccc*= Common Tool in Linux/Unix=

alias cccff001_find_name_InPwd='find ./ -name'
alias cccff002_find_regexpEgrep_InPwd="find ./ -regextype 'egrep' -regex"   ;#注意=是全路径
#alias cccgg001_egrep_nur_InPwd='egrep  -nur   \!*  ./ --color'  ;#OK, 若忽略大小写,可以在后面加 -i

function cccgg001_egrep_nur_InPwd()
{
	egrep  -nur   "$1"  ./ --color  ;#OK, 若忽略大小写,可以在后面加 -i
}

#bTag=new settings=


alias ..='cd ..;pwd'
alias ...='..; ..'
alias ....='..; ..; ..'
alias .....='..; ..; ..; ..'

alias cd1='cd ..;pwd'
alias cd2='cd ../..;pwd'
alias cd3='cd ../../..;pwd'
alias cd4='cd ../../../..;pwd'

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=80000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

