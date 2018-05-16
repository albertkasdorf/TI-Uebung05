#
# http://ctan.math.illinois.edu/support/latexmk/latexmk.pdf
# http://mg.readthedocs.io/latexmk.html#local-configuration-files
#
@default_files = ('Übung05.tex');

#
# If equal to 4, generate a pdf version of the document using lualatex, using
# the command specified by the $lualatex variable
#
$pdf_mode = 4;
$lualatex = 'lualatex --shell-escape %O %S';
$clean_ext = "rai rao";

#
# Rail Support
#
push @file_not_found, '^Package .* Info: No file (.+) on input line \d+\.';
add_cus_dep('rai', 'rao', 0, 'rail');
sub rail {
   my ($base_name, $path, $ext) = fileparse( $_[0], qr/\.[^.\/]*/ );
   pushd $path;
   my $return = system "rail $base_name";
   popd;
   return $return;
}