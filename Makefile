$(shell mkdir -p _bin/)
export GOBIN := $(CURDIR)/_bin/

ifneq (,$(wildcard .env.mk))
  include .env.mk
endif
ifneq (,$(wildcard .env))
  include .env
endif

include scripts/_makefiles/cspell.mk
include scripts/_makefiles/go-build.mk
include scripts/_makefiles/go-test.mk
include scripts/_makefiles/go.mk
include scripts/_makefiles/golangci-lint.mk
include scripts/_makefiles/protolint.mk
include scripts/_makefiles/scanoss.mk
include scripts/_makefiles/shellcheck.mk
include scripts/_makefiles/shfmt.mk
include scripts/_makefiles/trivy.mk
include scripts/_makefiles/util.mk

export GOLANGCI_LINT_OPTION += scripts/.golangci.yaml
export CSPELL_OPTION += --config scripts/.cspell.yaml 
