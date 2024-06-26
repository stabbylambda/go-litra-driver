module github.com/kharyam/go-litra-driver/lib

go 1.21

require (
	github.com/kharyam/go-litra-driver/config v0.0.0
	github.com/rs/zerolog v1.32.0
	github.com/sstallion/go-hid v0.14.1
)

replace github.com/kharyam/go-litra-driver/config v0.0.0 => ../config

require (
	github.com/bigkevmcd/go-configparser v0.0.0-20230427073640-c6b631f70126 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	golang.org/x/sys v0.18.0 // indirect
)
