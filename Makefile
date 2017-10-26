NAME = stepsaway/baseimage
VERSION = 2.1.2

.PHONY: all build_all clean clean_images \
	build_jruby1726 build_jruby914 \
	release test

all: build_all

build_all: \
	build_jruby1726 build_jruby914

build_jruby1726:
	rm -rf jruby1726_image
	cp -pR image jruby1726_image
	echo jruby1726=1 >> jruby1726_image/buildconfig
	echo final=1 >> jruby1726_image/buildconfig
	sed -i -e "s/##TAG##/$(VERSION)/" jruby1726_image/Dockerfile
	docker build -t $(NAME)-jruby17:26-$(VERSION) --rm jruby1726_image

build_jruby914:
	rm -rf jruby914_image
	cp -pR image jruby914_image
	echo jruby914=1 >> jruby914_image/buildconfig
	echo final=1 >> jruby914_image/buildconfig
	sed -i -e "s/##TAG##/$(VERSION)/" jruby914_image/Dockerfile
	docker build -t $(NAME)-jruby91:4-$(VERSION) --rm jruby914_image

clean:
	rm -rf jruby1726_image
	rm -rf jruby914_image

clean_images:
	@if docker images $(NAME)-jruby17:26-$(VERSION) | awk '{ print $$2 }' | grep -q -F 26-$(VERSION); then docker rmi -f $(NAME)-jruby17:26-$(VERSION) || true; fi
	@if docker images $(NAME)-jruby91:4-$(VERSION) | awk '{ print $$2 }' | grep -q -F 4-$(VERSION); then docker rmi -f $(NAME)-jruby91:4-$(VERSION) || true; fi

release: test
	@if ! docker images $(NAME)-jruby17:26-$(VERSION) | awk '{ print $$2 }' | grep -q -F 26-$(VERSION); then echo "$(NAME)-jruby17:26-$(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)-jruby91:4-$(VERSION) | awk '{ print $$2 }' | grep -q -F 4-$(VERSION); then echo "$(NAME)-jruby91:4-$(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)-jruby17:26-$(VERSION)
	docker push $(NAME)-jruby91:4-$(VERSION)
	@echo "*** Don't forget to create a tag. git tag $(VERSION) && git push origin $(VERSION)"

test:
	@if docker images $(NAME)-jruby17:26-$(VERSION) | awk '{ print $$2 }' | grep -q -F 26-$(VERSION); then env NAME=$(NAME)-jruby17:26 JRUBY='1.7.26' VERSION=$(VERSION) ./test/runner.sh; fi
	@if docker images $(NAME)-jruby91:4-$(VERSION) | awk '{ print $$2 }' | grep -q -F 4-$(VERSION); then env NAME=$(NAME)-jruby91:4 JRUBY='9.1.4.0' VERSION=$(VERSION) ./test/runner.sh; fi
