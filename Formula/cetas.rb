class Cetas < Formula
  desc "Native Cetas terminal AI agent"
  homepage "https://github.com/colmugx/cetas"
  version "0.11.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.2/cetas-darwin-arm64.tar.gz"
      sha256 "e0dd2fb1e5ee4fd81fb6093ffee5046a0224b35d99b492d39d1c62a3926b4995"

      resource "acp" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.2/cetas-acp-darwin-arm64.tar.gz"
        sha256 "da0b85a67752e89e36440a8b8b1c13f226709a5c5419a6041cf5ba5775036daa"
      end

      resource "run" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.2/cetas-run-darwin-arm64.tar.gz"
        sha256 "7535418cdf74db0ef9e7384a126ba61e6287a89fce447be0ce806aecc0cf4fac"
      end

    end
  end

  on_linux do
    on_intel do
      url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.2/cetas-linux-x64.tar.gz"
      sha256 "0f8a7099bbfd15af0f6d33c70bce664c2c5cd0a8a987fd20a976e527945e53ff"

      resource "acp" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.2/cetas-acp-linux-x64.tar.gz"
        sha256 "d67d6a52a0079c7232760efa0225f6cd5dada5735b8149fd1e5cb148ba70158d"
      end

      resource "run" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.2/cetas-run-linux-x64.tar.gz"
        sha256 "89ea8857a4c69e8315b283fbcab83c80b9bae24930790b8ebdf52b06e4cf978f"
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
