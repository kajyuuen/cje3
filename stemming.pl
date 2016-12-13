while($line=<>){
    chomp($line);
    @words = split(/ /,$line);
    @words[1] =~ s/(s|es|ed)$//g;
#    print "@words[1]";
    if( $words[1] ){
	print "$words[0] $words[1]\n";
    }
}
