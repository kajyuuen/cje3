while($line=<>){
    chomp($line);
    @words = split(/ /,$line);
    @words[1] =~ s/^(a|an|and|in|of|the)$//g;
#    print "@words[1]";
    if( $words[1] ){
	print "$words[0] $words[1]\n";
    }
}
