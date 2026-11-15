class Cetas < Formula
  desc "Native Cetas terminal AI agent"
  homepage "https://github.com/colmugx/cetas"
  version "0.11.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.5/cetas-darwin-arm64.tar.gz"
      sha256 "9e61d493799db7edf1552d21f62eb3b32e5004316e0929fda37577f43397f250"

      resource "acp" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.5/cetas-acp-darwin-arm64.tar.gz"
        sha256 "040327721d4ab1b424b07d84b33b1cae3c6ea22698492ebe1225b5aed9212240"
      end

      resource "run" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.5/cetas-run-darwin-arm64.tar.gz"
        sha256 "bcc4d5d59df77bc577019b38700d864c9210703fcfcfc6fc86e829f514722dde"
      end

    end
  end

  on_linux do
    on_intel do
      url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.5/cetas-linux-x64.tar.gz"
      sha256 "e3bf755b89ea0fd8117f5fa1a9b8459764305d5a51e185bcc99758697e1a6fe6"

      resource "acp" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.5/cetas-acp-linux-x64.tar.gz"
        sha256 "9abc413e5f12775c2f5a0bf7ecaa38a4e9026fb673ec8a83f0f1cbe11f203318"
      end

      resource "run" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.5/cetas-run-linux-x64.tar.gz"
        sha256 "52d25a1b3b8b0646e5eb1cdf8cf1b50f33d6373c77207ab0042f5980cb74ec6a"
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
