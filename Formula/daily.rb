class Daily < Formula
    desc "CLI tool to track your daily tasks to help you share with your team during daily standup"
    homepage "https://github.com/dtellz/daily"
    url "https://github.com/dtellz/mac-uninstall/archive/refs/tags/v1.0.2.tar.gz"
    sha256 "3073dac8c03a513ff38661c9cc8dab792c1f59ce6477235609f106bfe80d3d5c"
    license "MIT"
  
    def install
        bin.install "bin/daily.sh" => "daily"
    end
  
    test do
      system "#{bin}/daily", "--version"
    end
  end