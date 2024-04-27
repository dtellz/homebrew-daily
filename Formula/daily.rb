class Daily < Formula
    desc "CLI tool to track your daily tasks to help you share with your team during daily standup"
    homepage "https://github.com/dtellz/daily"
    url "https://github.com/dtellz/homebrew-daily/archive/refs/tags/v0.0.1.tar.gz"
    sha256 "63a2b6e1217c38d2a060d8642b4f3113ec73e006a642013e11236da64f104b16"
    license "MIT"
  
    def install
        bin.install "bin/daily.sh" => "daily"
    end
  
    test do
      system "#{bin}/daily", "--version"
    end
  end