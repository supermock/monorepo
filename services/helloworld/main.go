package main

import (
	"fmt"

	"github.com/supermock/monorepo/pkg/util"
)

func main() {
	fmt.Printf("I'am the %s service\n", util.Concatenate("Hello", "World"))
}
