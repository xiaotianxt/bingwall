class Bingwall < Formula
  desc "Tool to update macOS wallpaper daily using Bing images."
  homepage "https://github.com/xiaotianxt/bingwall"
  url "https://github.com/xiaotianxt/bingwall/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "?"
  license "MIT"

  depends_on "wallpaper"
  depends_on "python@3.12"

  def install
    bin.install "bin/bingwall"

    # Install plist file
    plist_path = "com.tian.update-wallpaper.plist"
    prefix.install plist_path

    # Install python dependencies
    system "pip3", "install", "requests"
  end

  plist do
    (prefix/"com.tian.update-wallpaper.plist").read
  end

  test do
    system "#{bin}/bingwall", "--version"
  end
end 