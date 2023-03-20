class Doc2docx < Formula
  include Language::Python::Virtualenv

  desc "Convert doc to docx"
  homepage "https://github.com/cosmojg/doc2docx"
  url "https://files.pythonhosted.org/packages/79/8e/9e97cc0430cde4c2f99fa8701292deabdd373e7ba137224ae7cd505b7690/doc2docx-0.2.0.tar.gz"
  sha256 "cfbb9c059553d1386a49138c307aae59c7f360d21b93dd87f4acf12acbefe1b2"
  license "MIT"
  head "https://github.com/cosmojg/doc2docx"

  depends_on "python"

  resource "appscript" do
    url "https://files.pythonhosted.org/packages/8a/9e/fe193f177dca67e5bfd70593568a85a195f93e39347f5719edf3938e5f08/appscript-1.2.2.tar.gz"
    sha256 "64552e87a6b8fac437951f14dd66370576dd2a311bded2aef041580f82fa2c1f"
  end

  resource "doc2docx" do
    url "https://files.pythonhosted.org/packages/79/8e/9e97cc0430cde4c2f99fa8701292deabdd373e7ba137224ae7cd505b7690/doc2docx-0.2.0.tar.gz"
    sha256 "cfbb9c059553d1386a49138c307aae59c7f360d21b93dd87f4acf12acbefe1b2"
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
    xy = Language::Python.major_minor_version "python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
    resources.each do |r|
      r.stage do
        system "python3", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
    system "python3", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "false"
  end
end
