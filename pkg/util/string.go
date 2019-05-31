package util

import "strings"

//Concatenate word by comma
func Concatenate(s ...string) string {
	return strings.Join(s, " ")
}
