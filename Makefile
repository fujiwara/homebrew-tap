export SHELL=/bin/bash -x

update/%:
	maltmill -w $*.rb

create/%:
	maltmill new -w fujiwara/$*

update-all:
	for i in $(shell grep -l linux *.rb); do maltmill -w $$i; done

test/%:
	brew install --build-from-source $*
