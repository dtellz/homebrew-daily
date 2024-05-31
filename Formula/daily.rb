class Daily < Formula
    desc "CLI tool to track your daily tasks to help you share with your team during daily standup"
    homepage "https://github.com/dtellz/daily"
    url "https://github.com/dtellz/homebrew-daily/archive/refs/tags/v0.0.9.tar.gz"
    sha256 "59a6943fd84ecb24caa8034ae178063e7f720e5a7b13a1553606243fc275c675"
    license "MIT"
  
    def install
        bin.install "bin/daily.sh" => "daily"
    end
  
    test do
      system "#{bin}/daily", "--version"
    end
  end
