module github.com/kharyam/go-litra-driver/lcli

go 1.21

require (
	github.com/kharyam/go-litra-driver/lib v0.0.0
	github.com/spf13/cobra v1.8.0
)

require (
	github.com/bigkevmcd/go-configparser v0.0.0-20230427073640-c6b631f70126 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/kharyam/go-litra-driver/config v0.0.0 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.19 // indirect
	github.com/rs/zerolog v1.32.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/sstallion/go-hid v0.14.1 // indirect
	golang.org/x/sys v0.12.0 // indirect
)

replace github.com/kharyam/go-litra-driver/lib v0.0.0 => ../lib

replace github.com/kharyam/go-litra-driver/config v0.0.0 => ../config
