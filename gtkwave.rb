class Gtkwave < Formula
  desc "GTKWave"
  homepage "https://gtkwave.github.io/gtkwave/"
  license "GPL-2.0-or-later"
  head "https://github.com/gtkwave/gtkwave.git", branch: "master"
  revision 6

  depends_on "desktop-file-utils" => :build
  depends_on "shared-mime-info" => :build
  depends_on "gtk-mac-integration"
  depends_on "gobject-introspection"
  depends_on "cmake" => :build
  depends_on "pango"
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "gtk4"
  depends_on "zlib"

  def install
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end
end
