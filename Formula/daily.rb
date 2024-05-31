class Daily < Formula
    desc "CLI tool to track your daily tasks to help you share with your team during daily standup"
    homepage "https://github.com/dtellz/daily"
    url "https://github.com/dtellz/homebrew-daily/archive/refs/tags/v0.0.7.tar.gz"
    sha256 "2be6239e32e5273497990deb48e6bb81f16c533c61f4417389bedbeae9eaf2a4"
    license "MIT"
  
    def install
        bin.install "bin/daily.sh" => "daily"
    end
  
    test do
      system "#{bin}/daily", "--version"
    end
  end
