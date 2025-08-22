update/%:
	maltmill -w $*.rb

create/%:
	maltmill new -w fujiwara/$*

update-all:
	for file in $(shell grep -l linux *.rb); do \
		echo "Updating $$file"; \
		maltmill -w $$file; \
	done

test/%:
	brew install --build-from-source $*
