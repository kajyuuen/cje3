#%freq = {};
$now_doc = 'D001';
$dec_cnt = 1;
$string = '';
while($line=<>){
  chomp($line);
  @words = split(/ /,$line);
  if($now_doc ne $words[0]){
  	foreach $key ( sort { $freq{$b} <=>  $freq{$a} } keys %freq){
  	    $string = $string . "$now_doc $key $freq{$key}\n";
        delete($freq{$key});
  	}
    $dec_cnt++;
    $now_doc = $words[0];
  }else{
	$now_doc = $words[0];
    if($words[1] =~ /\S{1}/ ){
    	if(defined($freq{$words[1]})){
    	    $freq{$words[1]}++;
    	}else{
    	    $freq{$words[1]} = 1;
    	}
    }
  }
}
$string = $dec_cnt."\n".$string;

print "$string"
