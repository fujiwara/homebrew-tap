update/%:
	maltmill -w $*.rb

create/%:
	maltmill new -w fujiwara/$*

update-all:
	grep -l darwin *.rb | xargs -n 1 maltmill -w

test/%:
	brew install --build-from-source $*
