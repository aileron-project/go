package yyy_test

import (
	"testing"

	"github.com/aileron-project/go/pkg-foo/internal/yyy"
)

func TestFuncYYY(t *testing.T) {
	if yyy.FuncYYY() != "yyy" {
		t.Error("fail")
	}
}
