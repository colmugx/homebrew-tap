class Cetas < Formula
  desc "Native Cetas terminal AI agent"
  homepage "https://github.com/colmugx/cetas"
  version "0.11.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.7/cetas-darwin-arm64.tar.gz"
      sha256 "9fe01f837e785872f21ac5421d6a26fbf847e3f1f96d06010db4414726f9edc3"

      resource "acp" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.7/cetas-acp-darwin-arm64.tar.gz"
        sha256 "18b5ef6d8e1cfee564dadbf44c85024ac4360d59d4db964b945936a2076a778f"
      end

      resource "run" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.7/cetas-run-darwin-arm64.tar.gz"
        sha256 "515114c947ace28bd40784696c7d13359503dc3fc5f37bf167a903a6d79bf44d"
      end

    end
  end

  on_linux do
    on_intel do
      url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.7/cetas-linux-x64.tar.gz"
      sha256 "73895f657214e64b3bbb0f058fe37222ddd2ebd8060ba8d28dcae0b0ce1287c5"

      resource "acp" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.7/cetas-acp-linux-x64.tar.gz"
        sha256 "cf6584f63192434ef7aba715e65f7a91e46e8089e7ed578cfb020f5d69ebb128"
      end

      resource "run" do
        url "https://github.com/colmugx/cetas/releases/download/cetas-v0.11.7/cetas-run-linux-x64.tar.gz"
        sha256 "7c42777fa298bc2218604ac02461e573c3d4d316abb623d355064e2c82e504e5"
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
