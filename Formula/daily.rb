class Daily < Formula
    desc "CLI tool to track your daily tasks to help you share with your team during daily standup"
    homepage "https://github.com/dtellz/daily"
    url "https://github.com/dtellz/homebrew-daily/archive/refs/tags/v0.0.4.tar.gz"
    sha256 "d8744db65277d6d7d2ab2e7ad66173831f9953c182cd4477ca1dc577ec4bb80b"
    license "MIT"
  
    def install
        bin.install "bin/daily.sh" => "daily"
    end
  
    test do
      system "#{bin}/daily", "--version"
    end
  end