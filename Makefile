OPTS_simplemq-cli = -asset simplemq-cli

update/%.rb:
	maltmill $(OPTS_$*) -w $*.rb

create/%:
	maltmill new -w fujiwara/$*

update-all:
	for file in $(shell grep -l linux *.rb); do \
		echo "Updating $$file"; \
		$(MAKE) update/$${file}; \
	done

test/%:
	HOMEBREW_DEVELOPER=true brew install --build-from-source $*
