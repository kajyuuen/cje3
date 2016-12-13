if (@ARGV != 1) {
    print STDERR "Usage: $0 <index file>\n"; exit;
}else{
    while($line=<STDIN>){
	chomp($line);
	@words = split(/ /,$line);
	push(@query_words,@words[1]);
    }
    while($line=<>){
	chomp($line);
	@words = split(/ /,$line);
	if($words[1] =~ /\S{1}/ ){
	    foreach $query_word (@query_words){
		if($words[1] eq $query_word){
		    if(defined($scores{$words[0]})){
			$scores{$words[0]} += $words[4];
		    }else{
			$scores{$words[0]} = $words[4];
		    }
		}
	    }
	}
    }
    $num = keys %scores;
    print "hits = $num\n";
    foreach $key ( sort { $scores{$b} <=>  $scores{$a} } keys %scores){
	print "$key $scores{$key}\n";
    }
}
