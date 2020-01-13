GIT_LAST_COMMIT := $(shell git describe --tags --always | sed 's/-/+/' | sed 's/^v//')
FLUTTER ?= flutter

ifneq ($(DRONE_TAG),)
	VERSION ?= $(subst v,,$(DRONE_TAG))-$(GIT_LAST_COMMIT)
else
	ifneq ($(DRONE_BRANCH),)
		VERSION ?= $(subst release/v,,$(DRONE_BRANCH))-$(GIT_LAST_COMMIT)
	else
		VERSION ?= master-$(GIT_LAST_COMMIT)
	endif
endif

.PHONY: test
test:
	$(FLUTTER) test

# clean command
.PHONY: clean
clean:
	$(FLUTTER) clean

# build everything
.PHONY: build-all
build-all: build-all-apk build-all-ios

# android section
.PHONY: build-all-apk
build-all-apk: build-debug-apk build-staging-apk build-release-apk

.PHONY: build-debug-apk
build-debug-apk:
	$(FLUTTER) build apk --debug --build-name=$(VERSION) --flavor dev

.PHONY: build-staging-apk
build-staging-apk:
	$(FLUTTER) build apk --debug --build-name=$(VERSION) --flavor staging

.PHONY: build-release-apk
build-release-apk:
	$(FLUTTER) build appbundle --target-platform android-arm,android-arm64,android-x64 --release --build-name=$(VERSION) --flavor prod

# ios sections
.PHONY: build-all-ios
build-all-apk: build-debug-ios build-staging-ios build-release-ios

.PHONY: build-debug-ios
build-debug-ios:
	$(FLUTTER) build ios --debug --build-name=$(VERSION) --flavor dev

.PHONY: build-staging-ios
build-staging-ios:
	$(FLUTTER) build ios --debug --build-name=$(VERSION) --flavor staging

  .PHONY: build-release-ios
build-release-ios:
	$(FLUTTER) build ios --release --build-name=$(VERSION) --flavor prod

.PHONY: format
format:
	$(FLUTTER) format lib

.PHONY: format-check
format-check:
	@diff=$$(flutter format -n lib); \
	if [ -n "$$diff" ]; then \
		echo "The following files are not formatted correctly:"; \
		echo "$${diff}"; \
		echo "Please run 'make format' and commit the result."; \
		exit 1; \
	fi;
