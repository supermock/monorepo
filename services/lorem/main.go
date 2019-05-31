package main

import (
	"fmt"

	lorem "github.com/drhodes/golorem"
)

func main() {
	fmt.Println("I'am the Lorem service")
	fmt.Println(lorem.Paragraph(20, 60))
}
