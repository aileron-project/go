package yyy_test

import (
	"testing"

	"github.com/aileron-project/go/pkg-bar/internal/yyy"
)

func TestFuncYYY(t *testing.T) {
	if yyy.FuncYYY() != "yyy" {
		t.Error("fail")
	}
}
