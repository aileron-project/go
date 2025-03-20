$(shell mkdir -p _bin/)
export GOBIN := $(CURDIR)/_bin/

ifneq (,$(wildcard .env.mk))
  include .env.mk
endif
ifneq (,$(wildcard .env))
  include .env
endif

include scripts/_makefiles/buf.mk
include scripts/_makefiles/cspell.mk
include scripts/_makefiles/go-build.mk
include scripts/_makefiles/go-licenses.mk
include scripts/_makefiles/go-test.mk
include scripts/_makefiles/go.mk
include scripts/_makefiles/goda.mk
include scripts/_makefiles/golangci-lint.mk
include scripts/_makefiles/govulncheck.mk
include scripts/_makefiles/markdownlint.mk
include scripts/_makefiles/prettier.mk
include scripts/_makefiles/protolint.mk
include scripts/_makefiles/scanoss.mk
include scripts/_makefiles/shellcheck.mk
include scripts/_makefiles/shfmt.mk
include scripts/_makefiles/trivy.mk
include scripts/_makefiles/util.mk


export GOLANGCI_LINT_OPTION += --config scripts/.golangci.yaml
export CSPELL_OPTION += --config scripts/.cspell.yaml 

LOCAL_CHECKS += buf-lint
LOCAL_CHECKS += cspell-run
LOCAL_CHECKS += go-licenses-run
LOCAL_CHECKS += golangci-lint-run
LOCAL_CHECKS += govulncheck-run
LOCAL_CHECKS += markdownlint-run
LOCAL_CHECKS += prettier-run
LOCAL_CHECKS += protolint-run
LOCAL_CHECKS += scanoss-run
LOCAL_CHECKS += shellcheck-run
LOCAL_CHECKS += shfmt-run

.PHONY: local-check
local-check: $(LOCAL_CHECKS)

.PHONY: local-format
local-format:
	$(MAKE) buf-format ARGS="--write"
	$(MAKE) go-fmt ARGS="-w"
	$(MAKE) prettier-run ARGS="--write"
