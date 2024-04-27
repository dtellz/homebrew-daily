class Daily < Formula
    desc "CLI tool to track your daily tasks to help you share with your team during daily standup"
    homepage "https://github.com/dtellz/daily"
    url "https://github.com/dtellz/homebrew-daily/archive/refs/tags/v.0.0.3.tar.gz"
    sha256 "cd4bb51c48c4ace7ad7d7fe822aec2af69dcea49d4e6fa9c62b5f599ba468726"
    license "MIT"
  
    def install
        bin.install "bin/daily.sh" => "daily"
    end
  
    test do
      system "#{bin}/daily", "--version"
    end
  end