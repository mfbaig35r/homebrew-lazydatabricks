class Lazydatabricks < Formula
  include Language::Python::Virtualenv

  desc "A keyboard-first TUI for Databricks ops — lazygit for your data platform"
  homepage "https://github.com/yourusername/lazybricks"
  url "https://files.pythonhosted.org/packages/7e/cf/d7846974da6a41665a22f14be5e3558198ef42e533b2bcc5838a8613754d/lazydatabricks-1.0.0.tar.gz"
  sha256 "8409a088449b6613bf8a34ef9450b4e32f9bb65a6c7706a855650bcb77e01423"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Create virtualenv
    venv = virtualenv_create(libexec, "python3.12")

    # Install lazydatabricks from PyPI (lets pip resolve all dependencies)
    system libexec/"bin/pip", "install", "--no-cache-dir", "lazydatabricks==1.0.0"

    # Link the entry point script
    bin.install_symlink libexec/"bin/lazydatabricks"
  end

  test do
    assert_match "lazydatabricks", shell_output("#{bin}/lazydatabricks --help 2>&1", 2)
  end
end
