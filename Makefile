all: _gokrazy/extrafiles_arm64.tar _gokrazy/extrafiles_amd64.tar

_gokrazy/extrafiles_amd64.tar:
	mkdir -p _gokrazy/extrafiles_amd64/usr/local/bin
	curl -fsSL https://github.com/containerd/containerd/releases/download/v2.1.4/containerd-static-2.1.4-linux-amd64.tar.gz | tar xzv --strip-components=1 -C _gokrazy/extrafiles_amd64/usr/local/bin/ --exclude containerd-stress
	curl -fsSL -o _gokrazy/extrafiles_amd64/usr/local/bin/runc https://github.com/opencontainers/runc/releases/download/v1.3.2/runc.amd64
	chmod +x _gokrazy/extrafiles_amd64/usr/local/bin/runc
	curl -fsSL https://github.com/seqeralabs/criu-static/releases/download/v4.1-r1/criu-static-4.1-r1-linux-amd64.tar.gz | tar xz -C /tmp/
	cp /tmp/criu*linux-amd64/bin/criu _gokrazy/extrafiles_amd64/usr/local/bin/
	rm -rf /tmp/criu*linux-amd64
	cd _gokrazy/extrafiles_amd64 && tar cf ../extrafiles_amd64.tar *
	rm -rf _gokrazy/extrafiles_amd64

_gokrazy/extrafiles_arm64.tar:
	mkdir -p _gokrazy/extrafiles_arm64/usr/local/bin
	curl -fsSL https://github.com/containerd/containerd/releases/download/v2.1.4/containerd-static-2.1.4-linux-arm64.tar.gz | tar xzv --strip-components=1 -C _gokrazy/extrafiles_arm64/usr/local/bin/ --exclude containerd-stress
	curl -fsSL -o _gokrazy/extrafiles_arm64/usr/local/bin/runc https://github.com/opencontainers/runc/releases/download/v1.3.2/runc.arm64
	chmod +x _gokrazy/extrafiles_arm64/usr/local/bin/runc
	curl -fsSL https://github.com/seqeralabs/criu-static/releases/download/v4.1-r1/criu-static-4.1-r1-linux-arm64.tar.gz | tar xz -C /tmp/
	cp /tmp/criu*linux-arm64/bin/criu _gokrazy/extrafiles_arm64/usr/local/bin/
	rm -rf /tmp/criu*linux-arm64
	cd _gokrazy/extrafiles_arm64 && tar cf ../extrafiles_arm64.tar *
	rm -rf _gokrazy/extrafiles_arm64

clean:
	rm -f _gokrazy/extrafiles_*.tar
