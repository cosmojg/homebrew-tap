class Doc2docx < Formula
  include Language::Python::Virtualenv

  desc "Convert doc to docx"
  homepage "https://github.com/cosmojg/doc2docx"
  url "https://files.pythonhosted.org/packages/dc/2f/86f311a31cb437a2bee53bf8ec19c1ed513a8b65192972c73076335aa487/doc2docx-0.2.4.tar.gz"
  sha256 "3a645892549f9e814a3b938d580a1e391e0d557980b5a0ad5e9574071bb5feae"
  license "MIT"
  head "https://github.com/cosmojg/doc2docx.git"

  depends_on "python"

  resource "appscript" do
    url "https://files.pythonhosted.org/packages/8a/9e/fe193f177dca67e5bfd70593568a85a195f93e39347f5719edf3938e5f08/appscript-1.2.2.tar.gz"
    sha256 "64552e87a6b8fac437951f14dd66370576dd2a311bded2aef041580f82fa2c1f"
  end

  resource "doc2docx" do
    url "https://files.pythonhosted.org/packages/dc/2f/86f311a31cb437a2bee53bf8ec19c1ed513a8b65192972c73076335aa487/doc2docx-0.2.4.tar.gz"
    sha256 "3a645892549f9e814a3b938d580a1e391e0d557980b5a0ad5e9574071bb5feae"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/06/5a/e11cad7b79f2cf3dd2ff8f81fa8ca667e7591d3d8451768589996b65dec1/lxml-4.9.2.tar.gz"
    sha256 "2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/3d/78/81191f56abb7d3d56963337dbdff6aa4f55805c8afd8bad64b0a34199e9b/tqdm-4.65.0.tar.gz"
    sha256 "1871fb68a86b8fb3b59ca4cdd3dcccbc7e6d613eeed31f4c332531977b89beb5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "false"
  end
end
