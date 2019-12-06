class Ngt < Formula
  desc "Neighborhood graph and tree for indexing high-dimensional data"
  homepage "https://github.com/yahoojapan/NGT"
  url "https://github.com/yahoojapan/NGT/archive/v1.8.4.tar.gz"
  sha256 "3edcbad5865c23bff399d4b0419ce84e1adbcda5c04fa88088f795782ab3a7d3"

  bottle do
    cellar :any
    sha256 "0fd0a7913ff425ca15f28f08467df5844a084012d2f2af546ddd89dba81ea869" => :catalina
    sha256 "a740b2bd1c0c112a43f7a8a15707b7bbcac194ef9cf1a6ced529a6b217680958" => :mojave
    sha256 "cf47ef2a67991f3a9aa8aa67debe135e0a73f957b50af5b0fa2bd600298f47ba" => :high_sierra
  end

  depends_on "cmake" => :build
  depends_on "libomp"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
    pkgshare.install "data"
  end

  test do
    cp_r (pkgshare/"data"), testpath
    system "#{bin}/ngt", "-d", "128", "-o", "c", "create", "index", "data/sift-dataset-5k.tsv"
  end
end
