#%freq = {};
@datas = ();
while($line=<>){
  chomp($line);
  @words = split(/ /,$line);
  if($words[1] =~ /\S{1}/ ){
      if(defined($idf{$words[1]})){
	  $idf{$words[1]} = $words[2];
      }else{
	  $idf{$words[1]} += $words[2];
      }
      push(@datas,[$words[0],$words[1],$words[2]]);
  }elsif($words[0] =~ /[0-9]+/){
      $cnt = $words[0];
  }
}  
foreach $term (sort keys %idf){
    $idf{$term} = log($cnt/$idf{$term}) + 1;
#    print "$term $idf{$term}\n";
}

foreach $data (@datas){
    #print "$data\n"
    $w = @$data[2] * $idf{@$data[1]};
    print "@$data[0] @$data[1] @$data[2] $idf{@$data[1]} $w\n";
}
