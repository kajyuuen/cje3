@datas = ();
while($line=<>){
  chomp($line);
  @words = split(/ /,$line);
  if($words[1] =~ /\S{1}/ ){
      #print "$words[1]:$words[2]:$df{$words[1]}\n";
      if(defined($df{$words[1]})){
	  $df{$words[1]} ++;
      }else{
	  $df{$words[1]} = 1;
      }
      push(@datas,[$words[0],$words[1],$words[2]]);
  }elsif($words[0] =~ /[0-9]+/){
      $cnt = $words[0];
  }
}
foreach $term (sort keys %df){
    $idf{$term} = log($cnt/$df{$term})/log(2) + 1;
}

foreach $data (@datas){
    #print "$data\n"
    $w = @$data[2] * $idf{@$data[1]};
    print "@$data[0] @$data[1] @$data[2] $idf{@$data[1]} $w\n";
}
