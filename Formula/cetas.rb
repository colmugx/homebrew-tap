class Cetas < Formula
  desc "Native Cetas terminal AI agent"
  homepage "https://github.com/colmugx/cetas"
  version "0.11.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.3/cetas-darwin-arm64.tar.gz"
      sha256 "fc1278e509aa39856bdabf8ca6eb65889e1af74c687c10befcc0280a6c7122f9"

      resource "acp" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.3/cetas-acp-darwin-arm64.tar.gz"
        sha256 "4452004c6715c8b91a7e2952caef3460ec4d2056efcbec60ccbe52bb5ef5b42e"
      end

      resource "run" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.3/cetas-run-darwin-arm64.tar.gz"
        sha256 "19bb4fbf5e8bf676f0c8989df758ac9f46c1b4829049ce195cc369381a5e3781"
      end

    end
  end

  on_linux do
    on_intel do
      url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.3/cetas-linux-x64.tar.gz"
      sha256 "fdef97f7dcd6d01bbb6ffc57027a4a4af1738ffd686b169bc6aed02015086e90"

      resource "acp" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.3/cetas-acp-linux-x64.tar.gz"
        sha256 "9fdb829a5adf546a9381fa510091496ff37badfeffec9047d641a642ea859ec4"
      end

      resource "run" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.3/cetas-run-linux-x64.tar.gz"
        sha256 "9e3f38d0ebcc85efd3db6f555cfc5a114d6c46754e39b8b77fdbfa6a3fc8deb3"
      end

    end
  end

  def install
    bin.install "cetas"
    resource("acp").stage { bin.install "cetas-acp" }
    resource("run").stage { bin.install "cetas-run" }
  end

  test do
    assert_match "cetas #{version}", shell_output("#{bin}/cetas --version")
    assert_match "cetas-acp", shell_output("#{bin}/cetas acp --version")
    assert_match "cetas-run", shell_output("#{bin}/cetas run --version")
  end
end
