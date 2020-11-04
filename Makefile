.PHONY = apply all clean

# List all subdirectories that we want to run "go build" on
images := counter sender

targets := $(foreach dir,$(images),$(dir)/$(dir))

all: $(targets)

# ko apply
apply: all
	${GOPATH}/bin/ko apply -f config/

%: %.go
	cd $(dir $@); go build

clean:
	rm -f $(targets)
