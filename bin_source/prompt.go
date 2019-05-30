package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	cwd, _ := os.Getwd()
	home := os.Getenv("HOME")
	var parts []string
	if strings.HasPrefix(cwd, home) {
		cwd = "~" + cwd[len(home):]
	}
	parts = strings.Split(cwd, "/")
	for i, part := range parts {
		if i == len(parts)-1 {
			fmt.Printf("%s", part)
		} else {
			if len(part) != 0 {
				fmt.Printf("%c/", part[0])
			} else {
				fmt.Printf("/")
			}
		}
	}
}
