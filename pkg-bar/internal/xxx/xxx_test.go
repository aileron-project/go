package xxx_test

import (
	"testing"

	"github.com/aileron-project/go/pkg-bar/internal/xxx"
)

func TestFuncXXX(t *testing.T) {
	if xxx.FuncXXX() != "xxx" {
		t.Error("fail")
	}
}
