NAME := pacdash

PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
SHAREDIR := $(PREFIX)/share

SRC := $(NAME)
DEST := $(BINDIR)/$(NAME)

SRC_README := README.md
DEST_README := $(SHAREDIR)/README.md

.PHONY: fmt
fmt: ## Format code and write a file
	shfmt -i 2 -w $(SRC)

.PHONY: lint
lint: ## Lint code
	shellcheck $(SRC)

.PHONY: install
install: ## Install script
	install -D -m755 $(SRC) $(DEST)

.PHONY: uninstall
uninstall:
	rm $(DEST)
