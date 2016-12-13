$flag = 0;
while($line=<>){
    chomp($line);
    if ($line =~ /(<NUM>)(.+)(<\/NUM>)/){
	$num = $2;
    }
   
    if($line =~ /<\/TEXT>/){
	$flag = 0;
    }
    if( $flag ){
	@words = split(/ /,$line);
	foreach $word(@words){
	    $word =~ tr/A-Z/a-z/;
	    $word =~ s/(\,|\.)$//g;
	    if( $word ){
		print "$num $word\n";
	    }
	}
    }
    if ($line =~ /<TEXT>/){
	$flag = 1;
    }
}
#print "$l_cnt $w_cnt $c_cnt\n";
